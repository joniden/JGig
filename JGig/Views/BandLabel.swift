//
//  BandLabel.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-19.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class BandLabel: UILabel {
  
  var topInset: CGFloat = 1.0
  var bottomInset: CGFloat = 1.0
  var leftInset: CGFloat = 8.0
  var rightInset: CGFloat = 8.0
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  private func setup() {
    self.textColor = .white
  }

  override func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    super.drawText(in: rect.inset(by: insets))
  }
  
  override var intrinsicContentSize: CGSize {
    var intrinsicSuperViewContentSize = super.intrinsicContentSize

    let textWidth = frame.size.width - (self.leftInset + self.rightInset)
    guard let font = self.font else {
      return .zero
    }
    
    let newSize = self.text!.boundingRect(with: CGSize(width: textWidth,
                                                       height: CGFloat.greatestFiniteMagnitude),
                                          options: .usesLineFragmentOrigin,
                                          attributes: [NSAttributedString.Key.font: font],
                                          context: nil)
    intrinsicSuperViewContentSize.height = ceil(newSize.size.height) + self.topInset + self.bottomInset

    return intrinsicSuperViewContentSize
  }
}
