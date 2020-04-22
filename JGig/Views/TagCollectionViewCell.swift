//
//  TagCollectionViewCell.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-20.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class TagCollectionViewCell: ReusableCell {
  
  class var font: UIFont {
    return UIFont.systemFont(ofSize: 14)
  }
  
  var text: String? {
    didSet {
      label.text = text
      label.setNeedsLayout()
      label.layoutIfNeeded()
    }
  }
  
  private let label = BandLabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    self.addSubview(label)
    
    label.font = TagCollectionViewCell.font
    label.sizeToParent(left: 5, right: 5, top: 5, bottom: 5)
    label.layer.cornerRadius = 5
  }
  
}