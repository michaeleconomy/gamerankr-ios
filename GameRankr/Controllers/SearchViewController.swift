import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, APISearchResultsDelegate, AlertAPIErrorDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var results: [SearchQuery.Data.Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("test123")
        // Do any additional setup after loading the view, typically from a nib.
        searchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let game = results[indexPath.row]
        cell.textLabel!.text = game.title
        return cell
    }

    func searchBar(_: UISearchBar, textDidChange: String) {
        NSLog("searchText Changed: \(searchBar.text!)")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        NSLog("searchBar clicked, search: \(searchBar.text!)")
        self.results = []
        self.tableView.reloadData()
        api.search(query: searchBar.text!, delegate: self)
        searchBar.endEditing(true)
    }
    
    func handleAPISearch(results: [SearchQuery.Data.Game]) {
        self.results = results
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
}

