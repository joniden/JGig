//
//  GigTableViewCell.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-22.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class GigTableViewCell: BaseTableViewCell {
  
  private let stackView = UIStackView()
  private let titleLabel = UILabel()
  private let subTitleLabel = UILabel()
  private let tagView = TagListView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func setup() {
    self.addSubview(stackView)
    self.backgroundColor = .none
    stackView.sizeToParent(left: 16, right: -16, top: 20, bottom: -20)
    stackView.axis = .vertical
    stackView.spacing = 2
    addTitleLabels()
    addTagView()
  }
  
  private func addTitleLabels() {
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(subTitleLabel)
  
    subTitleLabel.setHeightConstraint(25)
    titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    subTitleLabel.font = UIFont.systemFont(ofSize: 15)
    subTitleLabel.textColor = .subTitle
   }
   
   private func addTagView() {
     stackView.addArrangedSubview(tagView)
     tagView.setHeightConstraint(20)
   }
  
   func populate(_ gig: GigModel) {
    titleLabel.text = gig.name
    subTitleLabel.text = "\(gig.venue?.name ?? ""), \(gig.fromDate ?? "")"
       
     guard let bands = gig.bands else {
       return
     }
     
     bands.forEach { band in
       tagView.addTag(band.name)
     }
  }

}
