import UIKit
import Apollo

class PortChooserViewController : UITableViewController {
    var game : GameBasic?
    var selected : GraphQLID?
    var ranked : GraphQLID?
    
    private var ports: [GameBasic.Port]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Editions for \(game?.title ?? "Unknown")"
        
        ports = game?.ports.sorted(by: { p1, p2 in
            p1.platform.name > p2.platform.name
        })
        let selectedRow = ports?.index(where: {$0.id == selected})
        if (selectedRow != nil) {
            tableView.selectRow(at: IndexPath(row: selectedRow!, section: 0), animated: false, scrollPosition: .top)
        }
        else {
            unexpectedError("could not find selected: \(selected ?? "nil")")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ports?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SubtitleTableCell
        let port = ports![indexPath.row]
        cell.primaryLabel?.text = port.platform.name
        cell.secondaryLabel?.text = Formatter.format(dateString: port.releasedAt, defaultString: "")
        if (ranked == port.id) {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let port = ports![indexPath.row]
        let gameViewController = navigationController!.viewControllers[navigationController!.viewControllers.count - 2] as! GameViewController
        gameViewController.selectPort(portId: port.id)
        self.navigationController!.popViewController(animated: true)
    }
}
