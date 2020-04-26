//
//  TagListView.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-20.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class TagListView: UIView {
  
  // MARK: - Vars
  
  var collectionView: TagCollectionView?
  var colors: [UIColor] = [.gigRed, .gigBlue, .gigGreen, .gigPurple, .gigPink, .gigYellow]
  var tags: [String] = []
  let maxTags = 3
  
  // MARK: - Life cycle
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    addCollectionView()
  }
  
  // MARK: - Private methods
  
  private func setup() {
    // Set layout
    colors.shuffle()
    collectionView = TagCollectionView(frame: .zero, collectionViewLayout: .init())
    collectionView?.dataSource = self
    collectionView?.delegate = self
  }
  
  private func addCollectionView() {
    
    guard let collectionView = self.collectionView else {
      return
    }
    
    self.addSubview(collectionView)
    self.collectionView?.sizeToParent()
  }
  
  // MARK: - Public Methods
  
  func addTag(_ string: String) {
    tags.append(string)
    
    //collectionView?.reloadData()
  }
}

extension TagListView: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return tags.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else {
      return UICollectionViewCell()
    }
    
    let cellRect = cell.contentView.convert(cell.contentView.bounds, to: UIScreen.main.coordinateSpace)
    if UIScreen.main.bounds.intersects(cellRect) {
       // return UICollectionViewCell()
    }
    
    cell.text = tags[indexPath.row]
    cell.setColor(colors[indexPath.row])
    
    return cell
    
  }

}

extension TagListView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
   
    let item = tags[indexPath.row]
  
    let itemSize = item.size(withAttributes: [
      NSAttributedString.Key.font: TagCollectionViewCell.font
    ])
    
    // Add some spacing
    let size = CGSize(width: itemSize.width + 20, height: itemSize.height)
   
    return size
  }
}
