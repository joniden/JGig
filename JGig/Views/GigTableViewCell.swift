//
//  GigTableViewCell.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-22.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class GigTableViewCell: BaseTableViewCell {
  
  private let gigRow = GigRow()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    self.addSubview(gigRow)
    gigRow.sizeToParent()
  }
  
  func populate(_ model: GigModel) {
    gigRow.populate(model)
  }

}
