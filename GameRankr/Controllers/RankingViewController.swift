import UIKit
import Apollo

class RankingViewController : UIViewController, UITableViewDataSource, APICommentsDelegate, UITextViewDelegate, APICommentDelegate, APIDestroyCommentDelegate, APIUserDetailDelegate {
    
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var verbLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var shelvesStack: UIStackView!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var noCommentsLabel: UILabel!
    @IBOutlet weak var commentsTable: IntrinsicTableView!
    
    @IBOutlet weak var commentContainer: UIStackView!
    @IBOutlet weak var commentField: UITextView!
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var commentBottomContraint: NSLayoutConstraint!
    let defaultCommentText = "Write a comment..."
    
    var ranking: RankingBasic?
    var user: UserBasic?
    var userId: GraphQLID?
    var game: GameBasic?
    
    private var comments = [CommentBasic]()
    private var nextPage: String?
    
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
        
        let gameImageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToGameImage(sender:)))
        gameImage?.addGestureRecognizer(gameImageTapRecognizer)
        
        let titleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToGameTitle(sender:)))
        gameTitle?.addGestureRecognizer(titleTapRecognizer)
        
        let userImageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToUserImage(sender:)))
        userImage?.addGestureRecognizer(userImageTapRecognizer)
        
        shareButton?.target = self
        shareButton?.action = #selector(shareRanking)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if user == nil {
            if let userId = userId {
                api.userDetail(id: userId, delegate: self)
            }
            else {
                unexpectedError("No user or userId provided")
            }
        }
        loadComments()
        defaultComment()
        configureView()
    }
    
    func configureView() {
        if !isViewLoaded {
            return
        }
        gameImage?.image = PlaceholderImages.game
        
        guard let user = user, let ranking = ranking else {
            scrollView?.isHidden = true
            commentContainer?.isHidden = true
            verbLabel?.text = "???"
            return
        }

        scrollView?.isHidden = false
        commentContainer?.isHidden = false
        self.title = "Comments"
        userImage?.kf.setImage(with: URL(string: user.photoUrl)!, placeholder: PlaceholderImages.user)
        userButton?.setTitle(user.realName, for: .normal)
        verbLabel?.text = ranking.verb
        
        let port = ranking.port
        platformLabel?.text = port?.platform.name ?? "Unknown"
        if let imageUrl = port?.mediumImageUrl {
            gameImage?.kf.setImage(with: URL(string: imageUrl)!, placeholder: PlaceholderImages.game)
        }
        
        for subView in shelvesStack.arrangedSubviews.suffix(from: 1) {
            subView.removeFromSuperview()
        }
        for shelf in ranking.shelves {
            let shelfButton = UIButton()
            shelfButton.setTitle(shelf.fragments.shelfBasic.name, for: .normal)
            shelfButton.setTitleColor(.blue, for: .normal)
            shelfButton.contentHorizontalAlignment = .left
            shelfButton.addTarget(self, action: #selector(shelfButtonTap(sender:)), for: .touchUpInside)
            shelvesStack?.addArrangedSubview(shelfButton)
        }
        
        let stars = ranking.ranking ?? 0
//        starsLabel?.text = String(repeating: "\u{2605}", count: 5)
        let attributedStarsText = NSMutableAttributedString(string: String(repeating: "\u{2605}", count: 5))
        attributedStarsText.addAttribute(NSAttributedString.Key.foregroundColor, value: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), range: NSRange(location: 0, length: stars))
        attributedStarsText.addAttribute(NSAttributedString.Key.foregroundColor, value: #colorLiteral(red: 0.7, green: 0.7, blue: 0.7, alpha: 1), range: NSRange(location: stars, length: 5 - stars))
        starsLabel?.attributedText = attributedStarsText
        
        
        let review = ranking.review ?? ""
        if review != "" {
            reviewLabel.text = review
            reviewLabel.isHidden = false
        }
        else {
            reviewLabel.isHidden = true
        }
        
        if let date = Formatter.formatDate(ranking.updatedAt) {
            dateLabel?.text = date
            dateLabel.isHidden = false
        }
        else {
            dateLabel.isHidden = true
        }
        
        gameImage?.kf.indicatorType = .activity

        gameTitle?.text = game?.title ?? "Unknown"
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
    
    @objc func shareRanking() {
        share(message: "\(user?.realName ?? "Unknown")'s review of \(game?.title ?? "Unknown") - GameRankr", link: ranking!.url, displayFlag: true)
    }
    
    
    @objc func goToGameImage(sender: UIImageView) {
        performSegue(withIdentifier: "game", sender: sender)
    }
    
    @objc func goToGameTitle(sender: UILabel) {
        performSegue(withIdentifier: "game", sender: sender)
    }
    
    @objc func goToUserImage(sender: UIImageView) {
        performSegue(withIdentifier: "rankingUserDetail", sender: sender)
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
        let navBarHeight = navigationController!.navigationBar.frame.size.height
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
        loadingImage?.isHidden = false
        api.comment(resourceId: ranking!.id, resourceType: "Ranking", comment: commentField.text, delegate: self)
        commentField.endEditing(true)
        defaultComment()
    }
    
    private func loadComments(getNextPage: Bool = false) {
        if (!getNextPage) {
            nextPage = nil
            comments.removeAll()
            DispatchQueue.main.async {
                self.noCommentsLabel?.isHidden = true
                self.loadingImage?.isHidden = false
            }
        }
        api.comments(resourceId: ranking!.id, resourceType: "Ranking", after: nextPage, delegate: self)
        nextPage = nil
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

        cell.textLabel?.text = user.fragments.userBasic.realName
        cell.imageView?.kf.setImage(with: URL(string: user.fragments.userBasic.photoUrl)!, placeholder: PlaceholderImages.user, completionHandler: {
            (result) in
            cell.layoutSubviews()
        })
        cell.detailTextLabel?.text = "\"\(comment.comment)\"\n\(Formatter.format(dateString: comment.createdAt))"
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
        return comment.user.fragments.userBasic.id == api.currentUserId
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            let comment = comments[indexPath.row]
            DispatchQueue.main.async {
                self.loadingImage?.isHidden = false
            }
            comments.remove(at: indexPath.row)
            commentsTable.deleteRows(at: [indexPath], with: .automatic)
            api.destroyComment(id: comment.id, delegate: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            silentError("nil segue from game view")
            return
        }
        switch identifier {
        case "commentUserDetail":
            guard let indexPath = commentsTable?.indexPathForSelectedRow else {
                unexpectedError("GameViewController: could not get indexPath")
                return
            }
            let comment = comments[indexPath.row]
            guard let controller = segue.destination as? UserViewController else {
                unexpectedError("unexpected controller type for commentUserDetail seque")
                return
            }
            controller.user = comment.user.fragments.userBasic
        case "rankingUserDetail":
            guard let controller = segue.destination as? UserViewController else {
                unexpectedError("unexpected controller type for rankingUserDetail seque")
                return
            }
            controller.user = user
        case "game":
            guard let controller = segue.destination as? GameViewController else {
                unexpectedError("unexpected controller type for game seque")
                return
            }
            controller.game = game
            if let port = ranking?.port {
                controller.selectPort(portId: port.id)
            }
        case "flag":
            guard let controller = segue.destination as? FlagViewController else {
                unexpectedError("unexpected controller type for flag seque")
                return
            }
            controller.resourceType = "Ranking"
            controller.resourceId = ranking?.id
        case "requireSignIn": ()
        case "shelfDetail":
            let button = sender as! UIButton
            guard let shelfIndex = shelvesStack.arrangedSubviews.index(where: {$0 === button}) else {
                unexpectedError("RankingViewController - could not find button in shelvesStack")
                return
            }
            guard let controller = segue.destination as? ShelfViewController else {
                unexpectedError("unexpected controller type for shelfDetail seque")
                return
            }
            controller.shelf = ranking?.shelves[shelfIndex - 1].fragments.shelfBasic
            controller.user = user
        default:
            silentError("unknown segue from game view: \(identifier)")
        }
    }
    
    
    func handleAPIAuthenticationError() {
        easyAlert("You've been signed out.")
    }
    
    func handleAPI(comments: [CommentBasic], nextPage: String?) {
        self.comments.append(contentsOf: comments)
        self.nextPage = nextPage
        
        DispatchQueue.main.async {
            self.commentsTable?.reloadData()
            self.noCommentsLabel?.isHidden = !self.comments.isEmpty
            self.loadingImage?.isHidden = true
        }
    }
    
    func handleAPI(comment: CommentBasic) {
        handleAPI(comments: [comment], nextPage: nil)
        //NOTE: this is a bug that prevents comments from continuing to load - but... we don't show duplicate comments
    }
    
    func handleAPI(userDetail: UserDetail, rankings: [RankingWithGame], nextPage: String?) {
        user = userDetail.fragments.userBasic
        DispatchQueue.main.async {
            self.loadingImage?.isHidden = false
            self.configureView()
        }
    }
    
    func handleAPICommentDestruction(ranking: CommentBasic) {
        DispatchQueue.main.async {
            self.loadingImage?.isHidden = false
        }
    }
}
