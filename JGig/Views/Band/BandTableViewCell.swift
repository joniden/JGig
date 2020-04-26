//
//  BandTableViewCell.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-26.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit
import Kingfisher

class BandTableViewCell: BaseTableViewCell {
  
  // MARK: - Vars
  
  private let stackView = UIStackView()
  private let bandImageView = UIImageView()
  private let titleLabel = UILabel()
  private let counterLabel = UILabel()

  // MARK: - Life cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
     setup()
   }
   
   required init?(coder: NSCoder) {
     super.init(coder: coder)
   }
  
  // MARK: - Private methods
  
  private func setup() {
    self.addSubview(stackView)
    self.backgroundColor = .none
    stackView.sizeToParent(left: 16, right: -16, top: 8, bottom: -8)
    stackView.axis = .horizontal
    stackView.spacing = 16
    addImageView()
    addTitleLabels()
  }
  
  private func addTitleLabels() {
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(counterLabel)
   
    titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    counterLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
    counterLabel.textColor = .subTitle
    counterLabel.textAlignment = .right
  }
  
  private func addImageView() {
    stackView.addArrangedSubview(bandImageView)
    bandImageView.setWidthConstraint(44)
  }
  
  // MARK: - Public methods
  
  func populate(_ model: BandModel) {
    titleLabel.text = model.name
    counterLabel.text = "\(model.gigs?.count ?? 0)"
    imageView?.image = UIImage(named: "placeholder")
  }
  
  
}
