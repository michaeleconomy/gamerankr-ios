import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, APISearchResultsDelegate, AlertAPIErrorDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var results: [SearchQuery.Data.Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        loadingImage.image = PlaceholderImages.loadingBar
        loadingImage.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let game = results[indexPath.row]
        cell.textLabel!.text = game.title
        cell.detailTextLabel!.text = game.ports.map{$0.platform.name}.joined(separator: ", ")
        let port = game.ports.first
        if (port != nil && port?.smallImageUrl != nil) {
            cell.imageView?.kf.indicatorType = .activity
            cell.imageView?.kf.setImage(with: URL(string: port!.smallImageUrl!)!, placeholder: PlaceholderImages.game)
        }
        else {
            cell.imageView?.image = PlaceholderImages.game
        }
        return cell
    }

    func searchBar(_: UISearchBar, textDidChange: String) {
//        NSLog("searchText Changed: \(searchBar.text!)")
        // TODO: search as you type
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.results = []
        self.tableView.reloadData()
        self.loadingImage.isHidden = false
        api.search(query: searchBar.text!, delegate: self)
        searchBar.endEditing(true)
    }
    
    func handleAPISearch(results: [SearchQuery.Data.Game]) {
        self.results = results
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
            self.loadingImage.isHidden = true
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! GameViewController
                controller.game = results[indexPath.row].fragments.gameBasic
            }
        }
    }
}

