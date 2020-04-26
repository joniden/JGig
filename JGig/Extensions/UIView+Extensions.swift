//
//  UIView+Extensions.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-19.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

extension UIView {
  
  /// Using autolayout, constraint 0,0,0,0 to the parent view
  func sizeToParent(left: CGFloat = 0, right: CGFloat = 0, top: CGFloat = 0, bottom: CGFloat = 0) {
    
    if self.translatesAutoresizingMaskIntoConstraints {
      self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    guard let superView = superview else {
       print("superview required")
       return
     }
    
    let guide = superView.safeAreaLayoutGuide
    
    self.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: left).isActive = true
    self.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: right).isActive = true
    self.topAnchor.constraint(equalTo: guide.topAnchor, constant: top).isActive = true
    self.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: bottom).isActive = true
  }
  
  func setHeightConstraint(_ height: CGFloat) {
    if self.translatesAutoresizingMaskIntoConstraints {
      self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    self.heightAnchor.constraint(equalToConstant: height).isActive = true
  }
  
  func setWidthConstraint(_ width: CGFloat) {
    if self.translatesAutoresizingMaskIntoConstraints {
      self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    self.widthAnchor.constraint(equalToConstant: width).isActive = true
  }
  
}
