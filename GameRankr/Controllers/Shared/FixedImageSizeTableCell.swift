import UIKit
class FixedImageSizeTableCell: UITableViewCell {
    
    @IBOutlet weak var fixedSizeImageView: UIImageView!
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        fixedSizeImageView.frame = CGRect(x: 10, y: 0, width: 60, height: 60)
    }
}
