import UIKit
import Apollo

class PortChooserViewController : UITableViewController {
    var game : GameBasic?
    var selected : GraphQLID?
    var ranked : GraphQLID?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Editions for \(game!.title)"
        
        let selectedRow = game?.ports.index(where: {$0.id == selected})
        if (selectedRow != nil) {
            self.tableView.selectRow(at: IndexPath(row: selectedRow!, section: 0), animated: false, scrollPosition: .top)
        }
        else {
            NSLog("could not fine selected: \(selected ?? "nil")")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (game != nil) {
            return game!.ports.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let port = game!.ports[indexPath.row]
        cell.textLabel?.text = port.platform.name
        if (ranked == port.id) {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
//        if (selected == port.id) {
//            cell.isFocused = true
//        }
//        else {
//            cell.isFocused = false
//        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let port = game!.ports[indexPath.row]
        let gameViewController = navigationController!.viewControllers[navigationController!.viewControllers.count - 2] as! GameViewController
        gameViewController.selectPort(portId: port.id)
        self.navigationController!.popViewController(animated: true)
    }
}
