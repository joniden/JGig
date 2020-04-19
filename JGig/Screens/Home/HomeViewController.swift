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
    title = "Last gig"
  }
  
  // MARK: - Private methods
  
  private func setup() {
    let stackView = UIStackView()
    stackView.axis = .vertical
    view.backgroundColor = .defaultBackgroundColor
    view.addSubview(stackView)
    stackView.sizeToParent()
    
    stackView.addArrangedSubview(gigView)
  }
  
  func populate(_ gig: GigModel) {
    gigView.populate(gig)
  }
  
}
