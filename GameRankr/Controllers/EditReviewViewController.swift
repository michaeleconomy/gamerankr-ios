import UIKit

class EditReviewViewController : UIViewController {
    var ranking : RankingBasic?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var reviewView: UITextView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (ranking != nil) {
            reviewView.text = ranking?.review
        }
        else {
            reviewView.text = ""
            let alert = UIAlertController(title: "Alert", message: "Ranking is missing", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        saveButton.target = self
        saveButton.action = #selector(saveButtonClick(sender:))
    }
    
    @objc func saveButtonClick(sender: UIButton) {
        //TODO - save the reivew
        self.dismiss(animated: true)
    }
}
