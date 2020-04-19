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
  private let titleLabel = UILabel()
  private let subTitleLabel = UILabel()
  private let imageView = UIImageView()
  
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
    
    stackView.addArrangedSubview(imageView)
    stackView.addArrangedSubview(titleLabel)
    stackView.addArrangedSubview(subTitleLabel)
    
    titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
    subTitleLabel.font = UIFont.systemFont(ofSize: 17)
    subTitleLabel.textColor = .subTitle
    
  }
  
  func populate(_ gig: GigModel) {
    if let image = gig.images?.first {
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.heightAnchor.constraint(equalToConstant: 214).isActive = true
      imageView.contentMode = .scaleAspectFill
      imageView.kf.setImage(with: URL(string: image.path))
    }
    
    titleLabel.text = gig.name
    subTitleLabel.text = "\(gig.venue?.name ?? ""), \(gig.fromDate ?? "")"
  }
  
  
}
