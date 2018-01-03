import UIKit

class RankingViewController : UIViewController, UITableViewDataSource, APICommentsDelegate, AlertAPIErrorDelegate, UITextViewDelegate, APICommentDelegate {
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var verbLabel: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitleButton: UIButton!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var shelvesStack: UIStackView!
    @IBOutlet weak var starsStack: UIStackView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentsTable: IntrinsicTableView!
    @IBOutlet weak var commentField: UITextView!
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var commentBottomContraint: NSLayoutConstraint!
    let defaultText = "Write a comment..."
    
    var ranking: RankingBasic? {
        didSet {
            loadComments()
            
            DispatchQueue.main.async(execute: {
                self.defaultComment()
                self.configureView()
            })
        }
    }
    var user: UserBasic? {
        didSet {
            DispatchQueue.main.async(execute: {
                self.configureView()
            })
        }
    }
    
    var game: GameBasic? {
        didSet {
            DispatchQueue.main.async(execute: {
                self.configureView()
            })
        }
    }
    
    var comments = [CommentBasic]()
    var nextPage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingImage.image = PlaceholderImages.loadingBar
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        commentField.delegate = self
        commentField.layer.borderColor = UIColor.gray.cgColor
        commentField.layer.borderWidth = 2
        commentButton.addTarget(self, action: #selector(postComment), for: .touchUpInside)
        defaultComment()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    func configureView() {
        if (user == nil || ranking == nil || game == nil) {
            return
        }
        self.title = "Comments"
        userButton?.setTitle(user?.realName, for: .normal)
        verbLabel?.text = ranking!.verb
        platformLabel?.text = ranking!.port.platform.name
        
        for subView in shelvesStack.arrangedSubviews.suffix(from: 1) {
            subView.removeFromSuperview()
        }
        for shelf in ranking!.shelves {
            let shelfButton = UIButton()
            shelfButton.setTitle(shelf.name, for: .normal)
            shelfButton.setTitleColor(.blue, for: .normal)
            shelfButton.contentHorizontalAlignment = .left
            shelfButton.addTarget(self, action: #selector(shelfButtonTap(sender:)), for: .touchUpInside)
            shelvesStack?.addArrangedSubview(shelfButton)
        }
        
        var i = 1
        for star in starsStack.arrangedSubviews {
            star.isHidden =  i > ranking?.ranking ?? 0
            i += 1
        }
        if (ranking!.review != nil && ranking!.review!.count > 0) {
            reviewLabel.isHidden = false
            reviewLabel.text = "\"\(ranking!.review!)\""
        }
        else {
            reviewLabel.isHidden = true
        }
        
        //TODO - see NSDateFormatter
        dateLabel.isHidden = true
        
        self.gameImage?.kf.indicatorType = .activity
        self.gameImage?.kf.setImage(with: URL(string: ranking!.port.smallImageUrl!)!)

        self.gameTitleButton?.setTitle(game!.title, for: .normal)
    }
    
    func defaultComment() {
        self.commentField?.text = self.defaultText
        self.commentField?.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.text == defaultText) {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    @objc func shelfButtonTap(sender: UIButton) {
        performSegue(withIdentifier: "shelfDetail", sender: sender)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue else {
            NSLog("couldn't get keyboard frame")
            return
        }
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        let navBarHeight = self.navigationController!.navigationBar.frame.size.height
        commentBottomContraint.constant = keyboardHeight - navBarHeight
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        commentBottomContraint.constant = 0
    }
    
    @objc func postComment() {
        if (commentField.text == nil || commentField.text == "") {
            //dont' post empty comment
            return
        }
        loadingImage.isHidden = false
        api.comment(resourceId: ranking!.id, resourceType: "Ranking", comment: commentField.text, delegate: self)
        commentField.endEditing(true)
        defaultComment()
    }
    
    func loadComments(getNextPage: Bool = false) {
        NSLog("loadComments called")
        if (!getNextPage) {
            self.nextPage = nil
            comments.removeAll()
        }
        DispatchQueue.main.async(execute: {
            self.loadingImage.isHidden = false
        })
        api.comments(resourceId: ranking!.id, resourceType: "Ranking", after: self.nextPage, delegate: self)
        self.nextPage = nil
    }
    
    
    func handleAPIAuthenticationError() {
        easyAlert("You've been signed out, sorry for the inconvience")
    }
    
    func handleAPI(comments: [CommentBasic], nextPage: String?) {
        self.comments.append(contentsOf: comments)
        self.nextPage = nextPage
        
        DispatchQueue.main.async(execute: {
            self.loadingImage?.isHidden = true
            self.commentsTable?.reloadData()
        })
    }
    
    func handleAPI(comment: CommentBasic) {
        handleAPI(comments: [comment], nextPage: nil)
        //NOTE: this is a bug that prevents comments from continuing to load - but... we don't show duplicate comments
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (nextPage != nil && indexPath.row > comments.count - 15) {
            loadComments(getNextPage: true)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let comment = comments[indexPath.row]
        let user = comment.user

        cell.textLabel!.text = user.realName
        cell.imageView?.kf.setImage(with: URL(string: user.photoUrl)!, placeholder: PlaceholderImages.user, completionHandler: {
            (image, error, cacheType, imageUrl) in
            cell.layoutSubviews()
        })
        cell.detailTextLabel!.text = "\"\(comment.comment)\""
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == nil) {
            NSLog("nil segue from game view")
            return
        }
        switch segue.identifier! {
        case "userDetail":
            guard let indexPath = self.commentsTable?.indexPathForSelectedRow  else {
                NSLog("GameViewController: could not get indexPath")
                return
            }
            let comment = comments[indexPath.row]
            let controller = segue.destination as! UserViewController
            controller.user = comment.user.fragments.userBasic
        case "rankingUserDetail":
            let controller = segue.destination as! UserViewController
            controller.user = user
        case "gameDetail":
            let controller = segue.destination as! GameViewController
            controller.game = game
            controller.selectPort(portId: ranking!.port.id)
        case "shelfDetail":
            let button = sender as! UIButton
            let shelfIndex = shelvesStack.arrangedSubviews.index(where: {$0 === button})!
            let shelf = ranking!.shelves[shelfIndex].fragments.shelfBasic
            let controller = segue.destination as! ShelfViewController
            controller.shelf = shelf
        default:
            NSLog("unknown segue from game view: \(segue.identifier!)")
        }
    }
}
