//
//  TagCollectionView.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-24.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class TagCollectionView: UICollectionView {
    
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.itemSize = CGSize(width: 1, height: 20)
    super.init(frame: frame, collectionViewLayout: flowLayout)
    setup()
  }
  
  private func setup() {
    self.isScrollEnabled = false
    self.backgroundColor = .clear
    self.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
  }
}
