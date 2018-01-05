import UIKit

class MyGamesFilterViewController: UIViewController, APIMyShelvesManagerDelegate, UITableViewDataSource, AlertAPIErrorDelegate {
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var clearFiltersButton: UIButton!
    @IBOutlet weak var shelvesTable: UITableView!
    
    
    var callingController: MyGamesViewController?
    var filter = RankingFilter() {
        didSet {
            DispatchQueue.main.async(execute: {
                self.configureView()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyShelvesManager.sharedInstance.load()
        loadingImage.image = PlaceholderImages.loadingBar
        MyShelvesManager.sharedInstance.register(delegate: self)
        
        doneButton.target = self
        doneButton.action = #selector(doneButtonTouch(sender:))
        cancelButton.target = self
        cancelButton.action = #selector(cancelButtonTouch(sender:))
        clearFiltersButton.addTarget(self, action: #selector(clearFiltersButtonTouch(sender:)), for: .touchUpInside)
        configureView()
    }
    
    func configureView() {
        loadingImage?.isHidden = !MyShelvesManager.sharedInstance.loading
        shelvesTable?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyShelvesManager.sharedInstance.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UITableViewCellWithSwitch
        let shelf = MyShelvesManager.sharedInstance[indexPath.row]
        if (shelf == nil) {
            easyAlert("Couldn't locate shelf: \(indexPath.row)")
            return cell
        }
        cell.textLabel?.text = shelf!.name

        cell.switch.isOn = filter.shelves.contains(shelf!.name)
        cell.switch.addTarget(self, action: #selector(shelfToggled(sender:)), for: .valueChanged)
        return cell
    }
    
    func handleShelvesUpdates() {
        DispatchQueue.main.async(execute: {
            self.configureView()
        })
    }
    
    func handleAPIAuthenticationError() {
        easyAlert("you've been signed out")
        dismiss(animated: true)
    }
    
    @objc func shelfToggled(sender: UISwitch) {
        let cell = sender.superview!.superview as! UITableViewCellWithSwitch
        let indexForCell = shelvesTable.indexPath(for: cell)!
        let shelf = MyShelvesManager.sharedInstance[indexForCell.row]!
        if (sender.isOn) {
            filter.shelves.insert(shelf.name)
            return
        }
        filter.shelves.remove(shelf.name)
    }
    
    @objc func doneButtonTouch(sender: UIButton) {
        if (filter.shelves.isEmpty) {
            easyAlert("must select at least one shelf")
            return
        }
        callingController!.filter = filter.copy()
        dismiss(animated: true)
    }
    
    @objc func cancelButtonTouch(sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc func clearFiltersButtonTouch(sender: UIButton) {
        callingController!.filter = nil
        dismiss(animated: true)
    }
    
}
