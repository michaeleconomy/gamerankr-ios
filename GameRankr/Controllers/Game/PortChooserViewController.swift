import UIKit
import Apollo

class PortChooserViewController : UITableViewController {
    var game : GameBasic?
    var selected : GraphQLID?
    var ranked : GraphQLID?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Editions for \(game?.title ?? "Unknown")"
        
        let selectedRow = game?.ports.index(where: {$0.id == selected})
        if (selectedRow != nil) {
            tableView.selectRow(at: IndexPath(row: selectedRow!, section: 0), animated: false, scrollPosition: .top)
        }
        else {
            unexpectedError("could not find selected: \(selected ?? "nil")")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game?.ports.count ?? 0
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
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let port = game!.ports[indexPath.row]
        let gameViewController = navigationController!.viewControllers[navigationController!.viewControllers.count - 2] as! GameViewController
        gameViewController.selectPort(portId: port.id)
        self.navigationController!.popViewController(animated: true)
    }
}
