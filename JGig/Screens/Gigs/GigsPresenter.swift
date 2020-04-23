//
//  GigsPresenter.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-22.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

class GigsPresenter {
  
  var vc: GigsViewController
  
  init(_ vc: GigsViewController) {
    self.vc = vc
    getData()
  }
  
  func getData() {
    ApiManager.shared.get(screen: .gigs) { [weak self] (result: Result<GigsApiModel, Error>) in
      switch result {
      case .success(let model):
        DispatchQueue.main.async {
          self?.vc.populate(model.gigs)
        }
      case .failure(let error):
        print(error)
      }
    }
  }
  
}
