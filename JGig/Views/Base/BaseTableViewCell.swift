//
//  BaseTableViewCell.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-22.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

  class var identifier: String {
    return String(describing: self)
  }

}
