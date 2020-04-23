//
//  HomeViewController.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-19.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  var presenter: HomePresenter?
  let gigView = GigView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    presenter = HomePresenter(self)
  }
  
  // MARK: - Private methods
  
  private func setup() {
    let stackView = UIStackView()
    stackView.axis = .vertical
    view.backgroundColor = .defaultBackgroundColor
    view.addSubview(stackView)
    stackView.sizeToParent()
    
    stackView.addArrangedSubview(gigView)
    stackView.addArrangedSubview(UIView()) // Add empty view at the bottom
  }
  
  func populate(_ gig: GigModel) {
    gigView.populate(gig)
  }
  
}
