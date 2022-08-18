import UIKit
import Apollo

class FlagViewController: UIViewController, APIFlagDelegate, UITextViewDelegate {
    
    var resourceId: GraphQLID?
    var resourceType: String?
    
    @IBOutlet weak var flagText: UITextView!
    
    let defaultText = "Flag justification..."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flagText.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        flagText.text = defaultText
        flagText.textColor = .gray
    }
    
    func handleAPIFlaggedSuccessfully() {
        //ignore, we already updated the ui.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.text == defaultText) {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    @IBAction func cancelButtonTouch(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func flagButtonTouch(_ sender: UIBarButtonItem) {
        if (flagText.text == "" || flagText.text == defaultText) {
            easyAlert("Justification required.")
            return
        }
        guard let resourceId = resourceId else {
            unexpectedError("resourceId required.")
            return
        }
        guard let resourceType = resourceType else {
            unexpectedError("resourceType required.")
            return
        }

        api.flag(resourceId: resourceId, resourceType: resourceType, text: flagText.text, delegate: self)
        
        easyAlert("Thank you for your report. GameRankr staff will investigate this report.", handler: { alert in
            self.dismiss(animated: true)
        })
        
    }
}
