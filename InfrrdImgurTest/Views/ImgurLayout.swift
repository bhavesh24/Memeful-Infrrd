

import UIKit

protocol ImgurLayoutDelegate: AnyObject {
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}

class ImgurLayout: UICollectionViewFlowLayout {
  weak var delegate: ImgurLayoutDelegate?

  private let numberOfColumns = 2
  private let cellPadding: CGFloat = 6

  private var attributesArray: [UICollectionViewLayoutAttributes] = []

  private var contentHeight: CGFloat = 0

  private var contentWidth: CGFloat {
    guard let collectionView = collectionView else {
      return 0
    }
    let insets = collectionView.contentInset
    return collectionView.bounds.width - (insets.left + insets.right)
  }

  override var collectionViewContentSize: CGSize {
    return CGSize(width: contentWidth, height: contentHeight)
  }
  
  override func prepare() {
    attributesArray = []
    guard
      let collectionView = collectionView
      else {
        return
    }
    let columnWidth = contentWidth / CGFloat(numberOfColumns)
    var xOffset: [CGFloat] = []
    for column in 0..<numberOfColumns {
      xOffset.append(CGFloat(column) * columnWidth)
    }
    var column = 0
    var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
      
    for item in 0..<collectionView.numberOfItems(inSection: 0) {
      let indexPath = IndexPath(item: item, section: 0)
        
      let photoHeight = delegate?.collectionView(
        collectionView,
        heightForPhotoAtIndexPath: indexPath) ?? 180
      let height = cellPadding * 2 + photoHeight
      let frame = CGRect(x: xOffset[column],
                         y: yOffset[column],
                         width: columnWidth,
                         height: height)
      let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
        
      let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
      attributes.frame = insetFrame
      attributesArray.append(attributes)
        
      contentHeight = max(contentHeight, frame.maxY)
      yOffset[column] = yOffset[column] + height
        
      column = column < (numberOfColumns - 1) ? (column + 1) : 0
      (self.delegate as! HomeViewModel).currentYOffset = yOffset
    }
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
    
    // Loop through the attributesArray and look for items in the rect
    for attributes in attributesArray {
      if attributes.frame.intersects(rect) {
        visibleLayoutAttributes.append(attributes)
      }
    }
    return visibleLayoutAttributes
  }
  
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    if indexPath.item == attributesArray.count
    {
        return UICollectionViewLayoutAttributes(forCellWith: indexPath)
    }
    else
    {
        return attributesArray[indexPath.item]
    }
  }
}
