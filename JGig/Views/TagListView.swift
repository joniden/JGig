//
//  TagListView.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-20.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class TagListView: UIView {
  
  var collectionView: UICollectionView?
    
  var tags: [String] = [] {
    didSet {
      collectionView?.reloadData()
    }
  }
  
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
  
  private func setup() {
    // Set layout
    
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.itemSize = CGSize(width: 1, height: 20)
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    self.translatesAutoresizingMaskIntoConstraints = false
    collectionView?.dataSource = self
    collectionView?.delegate = self
    collectionView?.isScrollEnabled = false
    collectionView?.backgroundColor = .clear
    collectionView?.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
  }
  
  private func addCollectionView() {
    
    guard let collectionView = self.collectionView else {
      return
    }
    
    self.addSubview(collectionView)
    self.collectionView?.sizeToParent()
   
  }
  
  func addTag(_ string: String) {
    tags.append(string)
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
    
    cell.text = tags[indexPath.row]
    
    return cell
    
  }

}

extension TagListView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
   
    let item = tags[indexPath.row]
  
    let itemSize = item.size(withAttributes: [
      NSAttributedString.Key.font: TagCollectionViewCell.font
    ])
    
    // It's not big enough
    let size = CGSize(width: itemSize.width + 20, height: itemSize.height)
   
    return size
  }
}
