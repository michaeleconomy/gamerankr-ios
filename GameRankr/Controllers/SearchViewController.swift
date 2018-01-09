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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let game = results[indexPath.row]
        cell.textLabel!.text = game.title
        cell.detailTextLabel!.text = game.ports.map{$0.platform.name}.joined(separator: ", ")
        let port = game.ports.first
        if (port != nil && port?.smallImageUrl != nil) {
            cell.imageView?.kf.indicatorType = .activity
            cell.imageView?.kf.setImage(with: URL(string: port!.smallImageUrl!)!, placeholder: PlaceholderImages.game, completionHandler: {
                (image, error, cacheType, imageUrl) in
                cell.layoutSubviews()
            })
        }
        else {
            cell.imageView?.image = PlaceholderImages.game
        }
        return cell
    }

    private func doSearch(query: String? = nil, getNextPage: Bool = false) {
        if (currentApiTask != nil) {
            currentApiTask!.cancel()
            currentApiTask = nil
        }
        if (query != nil) {
            self.shouldClearSearchOnResults = true
            lastQuery = query
        }
        var nextPage: String?
        if (getNextPage) {
            nextPage = self.nextPage
            self.nextPage = nil
        }
        currentApiTask = api.search(query: lastQuery!, after: nextPage, delegate: self)
        
        DispatchQueue.main.async(execute: {
            self.loadingImage.isHidden = false
        })
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
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
    
    func handleAPISearch(results: [GameBasic], nextPage: String?) {
        if (shouldClearSearchOnResults) {
            shouldClearSearchOnResults = false
            self.results.removeAll()
            DispatchQueue.main.async(execute: {
                self.tableView?.setContentOffset(CGPoint.zero, animated:false)
            })
        }
        self.results.append(contentsOf: results)
        self.nextPage = nextPage
        DispatchQueue.main.async(execute: {
            self.noGamesLabel?.isHidden = !self.results.isEmpty
            self.tableView.reloadData()
            self.loadingImage.isHidden = true
        })
    }
    
    func handleAPIAuthenticationError() {
        easyAlert("Session Expired, please try again.")
        DispatchQueue.main.async(execute: {
            self.loadingImage.isHidden = true
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == nil) {
            NSLog("nil segue from user view")
            return
        }
        switch segue.identifier! {
        case "gameDetail":
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = segue.destination as! GameViewController
                controller.game = results[indexPath.row]
            }
        default:
            NSLog("search view: unhandled segue identifier: \(segue.identifier!)")
        }
    }
}

