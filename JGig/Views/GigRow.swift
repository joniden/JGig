//
//  GigRow.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-23.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class GigRow: UIView {
  
  private let stackView = UIStackView()
  private let titleLabel = UILabel()
  private let subTitleLabel = UILabel()
  
  private let tagView = TagListView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    self.addSubview(stackView)
    self.backgroundColor = .none
    stackView.sizeToParent()
    stackView.axis = .vertical
    stackView.spacing = 2
    addTitleLabels()
    addTagView()
  }
  
  private func addTitleLabels() {
     stackView.addArrangedSubview(titleLabel)
     stackView.addArrangedSubview(subTitleLabel)
     titleLabel.setHeightConstraint(28)
     subTitleLabel.setHeightConstraint(25)
     
     titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
     subTitleLabel.font = UIFont.systemFont(ofSize: 15)
     subTitleLabel.textColor = .subTitle
   }
   
   private func addTagView() {
     stackView.addArrangedSubview(tagView)
     tagView.setHeightConstraint(25)
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
