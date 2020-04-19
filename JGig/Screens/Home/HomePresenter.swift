//
//  HomePresenter.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-19.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

class HomePresenter {
  
  var vc: HomeViewController?
  
  init(_ vc: HomeViewController?) {
    self.vc = vc
    getData()
  }
  
  func getData() {
    ApiManager.shared.get(screen: .home) { [weak self] (result: Result<HomeApiModel, Error>) in
      switch result {
      case .success(let model):
        DispatchQueue.main.async {
          self?.vc?.populate(model.lastgig)
        }
      case .failure(let error):
        print(error)
      }
    }
  }
  
}
