//
//  BandsPresenter.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-26.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

class BandsPresenter {

  let vc: BandsViewController
  
  init(_ vc: BandsViewController) {
    self.vc = vc
    getData()
  }
  
  private func getData() {
    ApiManager.shared.get(screen: .bands) { [weak self] (result: Result<BandsApiModel, Error>) in
      switch result {
      case .success(let model):
        DispatchQueue.main.async {
          self?.vc.populate(model.bands)
        }
      case .failure(let error):
        print(error)
      }
    }
  }
}
