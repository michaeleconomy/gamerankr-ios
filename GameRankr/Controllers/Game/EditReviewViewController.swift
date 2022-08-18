import UIKit

class EditReviewViewController : UIViewController, UITextViewDelegate {
    var ranking : RankingWithGame?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var reviewView: UITextView!
    
    let defaultText = "Write a review..."
    
    
    override func viewDidLoad() {
        saveButton.target = self
        saveButton.action = #selector(saveButtonClick(sender:))
        
        reviewView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (ranking == nil) {
            reviewView.text = ""
            easyAlert("Ranking is missing")
            return
        }
        
        if (ranking!.fragments.rankingBasic.review == nil || ranking!.fragments.rankingBasic.review! == "") {
            reviewView.text = defaultText
            reviewView.textColor = .gray
            return
        }
        reviewView.text = ranking?.fragments.rankingBasic.review
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.text == defaultText) {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    
    @objc func saveButtonClick(sender: UIButton) {
        MyGamesManager.sharedInstance.rankPort(portId: ranking!.fragments.rankingBasic.port?.id ?? "0", review: reviewView.text)
        ranking?.fragments.rankingBasic.review = reviewView.text
        navigationController!.popViewController(animated: true)
    }
}
