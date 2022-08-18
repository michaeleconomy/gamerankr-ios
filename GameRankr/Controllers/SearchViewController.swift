import UIKit
import Apollo

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, APISearchResultsDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var noGamesLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var results = [GameBasic]()
    var nextPage: String?
    var lastQuery: String?
    var currentApiTask: Cancellable?
    var shouldClearSearchOnResults = false
    
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
        if (nextPage != nil && indexPath.row >= (results.count - 15)) {
            doSearch(getNextPage: true)
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FixedImageSizeTableCell
        let game = results[indexPath.row]
        cell.primaryLabel?.text = game.title
        cell.secondaryLabel?.text = game.ports.map{$0.platform.name}.joined(separator: ", ")
        let port = game.ports.first
        if let imageUrl = port?.smallImageUrl {
            cell.fixedSizeImageView?.kf.indicatorType = .activity
            cell.fixedSizeImageView?.kf.setImage(with: URL(string: imageUrl)!, placeholder: PlaceholderImages.game, completionHandler: {
                (result) in
                cell.layoutSubviews()
            })
        }
        else {
            cell.fixedSizeImageView?.image = PlaceholderImages.game
        }
        return cell
    }

    private func doSearch(query: String? = nil, getNextPage: Bool = false) {
        if (currentApiTask != nil) {
            currentApiTask!.cancel()
            currentApiTask = nil
        }
        if (query != nil) {
            shouldClearSearchOnResults = true
            lastQuery = query
        }
        var nextPage: String?
        if (getNextPage) {
            nextPage = self.nextPage
            nextPage = nil
        }
        currentApiTask = api.search(query: lastQuery!, after: nextPage, delegate: self)
        
        DispatchQueue.main.async {
            self.loadingImage.isHidden = false
        }
    }
    
    func searchBar(_: UISearchBar, textDidChange: String) {
        if (searchBar.text?.underestimatedCount ?? 0 <= 2) {
            return
        }
        doSearch(query: searchBar.text)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        doSearch(query: searchBar.text)
        searchBar.endEditing(true)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func handleAPISearch(results: [GameBasic], nextPage: String?) {
        if (shouldClearSearchOnResults) {
            shouldClearSearchOnResults = false
            self.results.removeAll()
            DispatchQueue.main.async {
                self.tableView?.setContentOffset(CGPoint.zero, animated:false)
            }
        }
        self.results.append(contentsOf: results)
        self.nextPage = nextPage
        DispatchQueue.main.async {
            self.noGamesLabel?.isHidden = !self.results.isEmpty
            self.tableView.reloadData()
            self.loadingImage.isHidden = true
        }
    }
    
    func handleAPIAuthenticationError() {
        easyAlert("Session Expired, please try again.")
        DispatchQueue.main.async {
            self.loadingImage.isHidden = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            silentError("nil segue identifier")
            return
        }
        switch identifier {
        case "gameDetail":
            guard let indexPath = tableView.indexPathForSelectedRow else {
                unexpectedError("no indexPathForSelectedRow")
                return
            }
            
            guard let controller = segue.destination as? GameViewController else {
                unexpectedError("Unexpected destination controller type for segue: \(identifier)")
                return
            }
            controller.game = results[indexPath.row]
        default:
            silentError("unhandled segue identifier: \(identifier)")
        }
    }
}

