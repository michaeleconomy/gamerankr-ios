import UIKit
class ShelveGameController : UIViewController, UITableViewDataSource, APIMyShelvesManagerDelegate, AlertAPIErrorDelegate {
    
    @IBOutlet weak var doneButton: UIButton!
    
    var game : GameBasic?
    var ranking : RankingBasic?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        doneButton.addTarget(self, action:#selector(doneButtonClick(sender:)), for: .touchUpInside)
        MyShelvesManager.sharedInstance.registerDelegate(delegate: self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (game == nil) {
            easyAlert("game could not be found for ShelveGameViewController")
            return
        }
        self.title = "Shelving: \(game!.title)"
        tableView.reloadData()
    }
    
    @objc func doneButtonClick(sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyShelvesManager.sharedInstance.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ShelveGameCell
        let shelf = MyShelvesManager.sharedInstance[indexPath.row]
        if (shelf == nil) {
            easyAlert("Couldn't locate shelf: \(indexPath.row)")
            return cell
        }
        cell.textLabel?.text = shelf!.name
        if (ranking != nil) {
            let shelfNames = ranking!.shelves.map{$0.name}.joined(separator: ", ")
            NSLog("ranking was set, shelf names are: \(shelfNames)// current_Shelf_name is: \(shelf!.name)")
            let matchingShelf = ranking!.shelves.first(where: { (r_shelf) -> Bool in
                return r_shelf.name == shelf!.name
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
        let cell = sender.superview!.superview as! ShelveGameCell
        let indexForCell = tableView.indexPath(for: cell)!
        let shelf = MyShelvesManager.sharedInstance[indexForCell.row]!
        NSLog("shelfToggled for \(game!.title) \(game!.id) \(shelf.name) \(shelf.id) \(sender.isOn)")
    }
    
    
    func handleUpdates() {
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
}
