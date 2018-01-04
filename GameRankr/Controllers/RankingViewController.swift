import UIKit

class RankingViewController : UIViewController, UITableViewDataSource, APICommentsDelegate, AlertAPIErrorDelegate, UITextViewDelegate, APICommentDelegate, APIDestroyCommentDelegate, APIUserDetailDelegate {
    
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var verbLabel: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitleButton: UIButton!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var shelvesStack: UIStackView!
    @IBOutlet weak var starsStack: UIStackView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noCommentsLabel: UILabel!
    @IBOutlet weak var commentsTable: IntrinsicTableView!
    
    @IBOutlet weak var commentContainer: UIStackView!
    @IBOutlet weak var commentField: UITextView!
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var commentBottomContraint: NSLayoutConstraint!
    let defaultCommentText = "Write a comment..."
    
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
    var loadingCount = 0
    
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
        self.loadingImage?.isHidden = loadingCount <= 0
        if (user == nil || ranking == nil || game == nil) {
            scrollView?.isHidden = true
            commentContainer?.isHidden = true
            return
        }
        scrollView?.isHidden = false
        commentContainer.isHidden = false
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
        self.commentField?.text = defaultCommentText
        self.commentField?.textColor = UIColor.lightGray
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (api.signedOut) {
            performSegue(withIdentifier: "requireSignIn", sender: nil)
            return
        }
        if (textView.text == defaultCommentText) {
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
        updateLoadingBar(+1)
        api.comment(resourceId: ranking!.id, resourceType: "Ranking", comment: commentField.text, delegate: self)
        commentField.endEditing(true)
        defaultComment()
    }
    
    func loadComments(getNextPage: Bool = false) {
        if (!getNextPage) {
            self.nextPage = nil
            comments.removeAll()
            DispatchQueue.main.async(execute: {
                self.noCommentsLabel.isHidden = true
            })
        }
        updateLoadingBar(+1)
        api.comments(resourceId: ranking!.id, resourceType: "Ranking", after: self.nextPage, delegate: self)
        self.nextPage = nil
    }
    
    func loadCurrentUser() {
        updateLoadingBar(+1)
        api.me(delegate: self)
    }
    
    func updateLoadingBar(_ loadingDiff: Int) {
        loadingCount += loadingDiff
        DispatchQueue.main.async(execute: {
            self.loadingImage?.isHidden = self.loadingCount <= 0
        })
    }
    
    func handleAPIAuthenticationError() {
        updateLoadingBar(-1)
        easyAlert("You've been signed out, sorry for the inconvience")
    }
    
    func handleAPI(comments: [CommentBasic], nextPage: String?) {
        self.comments.append(contentsOf: comments)
        self.nextPage = nextPage
        
        updateLoadingBar(-1)
        DispatchQueue.main.async(execute: {
            self.commentsTable?.reloadData()
            self.noCommentsLabel.isHidden = !self.comments.isEmpty
        })
    }
    
    func handleAPI(comment: CommentBasic) {
        handleAPI(comments: [comment], nextPage: nil)
        //NOTE: this is a bug that prevents comments from continuing to load - but... we don't show duplicate comments
    }
    
    func handleAPI(userDetail: UserDetail, rankings: [RankingWithGame], nextPage: String?) {
        user = userDetail.fragments.userBasic
        updateLoadingBar(-1)
        DispatchQueue.main.async(execute: {
            self.configureView()
        })
    }
    
    func handleAPICommentDestruction(ranking: CommentBasic) {
        updateLoadingBar(-1)
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if (user == nil) {
            return false
        }
        if (user!.id == api.currentUserId) {
            return true
        }
        let comment = comments[indexPath.row]
        return comment.user.id == api.currentUserId
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let comment = comments[indexPath.row]
            DispatchQueue.main.async(execute: {
                self.loadingImage?.isHidden = false
            })
            comments.remove(at: indexPath.row)
            commentsTable.deleteRows(at: [indexPath], with: .automatic)
            updateLoadingBar(+1)
            api.destroyComment(id: comment.id, delegate: self)
        }
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
        case "requireSignIn": ()
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
