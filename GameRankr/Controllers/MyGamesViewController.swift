import UIKit

class MyGamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,  APIMyGamesDelegate, AlertAPIErrorDelegate {
    
    var games: [Game] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signedInView: UIView!
    @IBOutlet weak var signedOutView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (api.signed_in) {
            signedOutView.isHidden = true
            signedInView.isHidden = false
            api.getMyGames(delegate: self)
        }
        else {
            signedOutView.isHidden = false
            signedInView.isHidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let game = games[indexPath.row]
        cell.textLabel!.text = game.title
        return cell
    }
    
    
    func handleAPIMyGames(games: [Game]) {
        self.games = games
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
        })
    }
}


