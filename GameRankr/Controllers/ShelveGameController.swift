import UIKit
import Apollo

class ShelveGameController : UIViewController, UITableViewDataSource, APIMyShelvesManagerDelegate, APIMyGamesManagerDelegate, UITableViewDelegate {
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var removeButton: UIButton!
    
    var game: Api.GameBasic?
    var ranking: Api.RankingWithGame?
    var portId: Api.ID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyShelvesManager.sharedInstance.load()
        loadingImage.image = PlaceholderImages.loadingBar
        doneButton.target = self
        doneButton.action = #selector(doneButtonClick(sender:))
        removeButton.addTarget(self, action: #selector(removeButtonTap(sender:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MyShelvesManager.sharedInstance.register(delegate: self)
        MyGamesManager.sharedInstance.register(delegate: self)
        configureView()
    }
    
    func configureView() {
        loadingImage.isHidden = !MyGamesManager.sharedInstance.loading() || !MyShelvesManager.sharedInstance.loading
        guard let game = game else {
            unexpectedError("Game could not be found")
            return
        }
        self.title = "Shelving: \(game.title)"
        tableView.reloadData()
        removeButton.isHidden = ranking == nil
    }
    
    @objc func removeButtonTap(sender: UIButton) {
        guard let port = ranking!.fragments.rankingBasic.port else {
            easyAlert("no port id, cannot remove")
            return
        }
        MyGamesManager.sharedInstance.destroyRanking(portId:port.id)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonClick(sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyShelvesManager.sharedInstance.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UITableViewCellWithSwitch
        let shelf = MyShelvesManager.sharedInstance[indexPath.row]
        if (shelf == nil) {
            unexpectedError("Couldn't locate shelf: \(indexPath.row)")
            return cell
        }
        cell.textLabel?.text = shelf!.name
        if (ranking != nil) {
            let matchingShelf = ranking!.fragments.rankingBasic.shelves.first(where: { (r_shelf) -> Bool in
                return r_shelf.fragments.shelfBasic.name == shelf!.name
            })
            cell.switch.isOn = matchingShelf != nil
        }
        else {
            cell.switch.isOn = false
        }
        cell.switch.addTarget(self, action: #selector(shelfToggled(sender:)), for: .valueChanged)
        return cell
    }
    
    
    @objc func shelfToggled(sender: UISwitch) {
        let cell = sender.superview!.superview as! UITableViewCellWithSwitch
        let indexForCell = tableView.indexPath(for: cell)!
        let shelf = MyShelvesManager.sharedInstance[indexForCell.row]!
        if (sender.isOn) {
            MyGamesManager.sharedInstance.rankPort(portId: portId!, addShelfId: shelf.id)
            return
        }
    
        if (ranking == nil) {
            sender.isOn = true
            easyAlert("Still saving, please try again soon")
            return
        }
        if (ranking!.fragments.rankingBasic.shelves.count == 1) {
            sender.isOn = true
            easyAlert("Can't remove the last shelf from a game - to remove the port - use the delete button")
            return
        }
        MyGamesManager.sharedInstance.rankPort(portId: portId!, removeShelfId: shelf.id)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UITableViewCellWithSwitch
        cell.switch.isOn = !cell.switch.isOn
        shelfToggled(sender: cell.switch)
    }
    
    func handleShelvesUpdates() {
        DispatchQueue.main.async {
            self.configureView()
        }
    }
    
    func handleUpdates() {
        self.ranking = MyGamesManager.sharedInstance.getRanking(gameId: game!.id)
        DispatchQueue.main.async {
            self.configureView()
        }
    }
    
    func handleAPIAuthenticationError() {
        easyAlert("You've been signed out.")
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
