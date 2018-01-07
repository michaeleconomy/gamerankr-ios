import UIKit
class FixedImageSizeTableCell: UITableViewCell {
    
    @IBOutlet weak var fixedSizeImageView: UIImageView!
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        fixedSizeImageView.frame =  CGRect(x: fixedSizeImageView.frame.minX, y: (self.frame.height / 2) - 30, width: 60, height: 60)
    }
}
