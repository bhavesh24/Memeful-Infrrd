
import SDWebImage
import UIKit

class ImgurMemeCell: UICollectionViewCell {
  @IBOutlet private weak var containerView: UIView!
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var captionLabel: UILabel!
  @IBOutlet private weak var pointsLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    containerView.layer.cornerRadius = 8
    containerView.layer.masksToBounds = true
  }
    func setMeme(meme:Meme)
    {
        if let url = URL(string:meme.images?[0].link ?? "")
        {
            imageView.sd_setImage(with: url)
        }
        if let points = meme.points
        {
            pointsLabel.text = "\(points) points"
        }
        if let title = meme.title
        {
            captionLabel.text = title
        }
    }
  
}
