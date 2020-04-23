//
//  GigView.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-19.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit
import Kingfisher

class GigView: UIView {
  
  // MARK: - Private Vars
  
  private let stackView = UIStackView()
  private let imageView = UIImageView()
  private let titleLabel = UILabel()
  private let subTitleLabel = UILabel()
  private let tagView = TagListView()
  
  // MARK: - Life cycle
  
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
    stackView.spacing = 8
    addImageView()
    addTitleLabels()
    addTagView()
    
  }
  
  private func addImageView() {
    stackView.addArrangedSubview(imageView)
  }
  
  private func addTitleLabels() {
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(subTitleLabel)
    titleLabel.setHeightConstraint(35)
    subTitleLabel.setHeightConstraint(25)
    
    titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
    subTitleLabel.font = UIFont.systemFont(ofSize: 17)
    subTitleLabel.textColor = .subTitle
  }
  
  private func addTagView() {
    stackView.addArrangedSubview(tagView)
    tagView.setHeightConstraint(25)
  }
  
  func populate(_ gig: GigModel) {
    if let image = gig.images?.first {
      imageView.setHeightConstraint(214)
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
      imageView.kf.setImage(with: URL(string: image.path))
    }
    
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
