import UIKit
class ShelveGameController : UIViewController, UITableViewDataSource {
    var shelves = ["played", "currently playing", "want to play", "favorites", "beaten", "owned"]
    
    @IBOutlet weak var doneButton: UIButton!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shelves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let shelf = shelves[indexPath.row]
        cell.textLabel?.text = shelf
        return cell
    }
    
    var game : GameBasic?
    var ranking : RankingBasic?
    
    func configureView() {
        
    }
    
    override func viewDidLoad() {
        doneButton.addTarget(self, action:#selector(doneButtonClick(sender:)), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        configureView()
    }
    
    @objc func doneButtonClick(sender: UIButton) {
        self.dismiss(animated: true)
    }
}
