import UIKit

class HistoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var countrynameLabel: UILabel!    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
        
}
