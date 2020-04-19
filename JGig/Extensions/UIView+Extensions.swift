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
  func sizeToParent() {
    self.translatesAutoresizingMaskIntoConstraints = false
    
    guard let superView = superview else {
       print("superview required")
       return
     }
    
    let guide = superView.safeAreaLayoutGuide
    
    self.leftAnchor.constraint(equalTo: guide.leftAnchor).isActive = true
    self.rightAnchor.constraint(equalTo: guide.rightAnchor).isActive = true
    self.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    self.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
  
}
