//
//  ApiManager.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-16.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation
import Alamofire

typealias CodableResultReponse = (Result<Decodable, Error>) -> Void

class ApiManager {
  
  // MARK: - Vars
  
  static var shared = ApiManager()
  
  private let baseUrl = Constant.baseUrl
  
  enum Screen: String {
    case home = "?json"
    case bands = "bands/all?json"
    case gigs = "gigs/all?json"
  }
  
  func get<T:Decodable>(screen: Screen, _ callback: @escaping ((Result<T, Error>) -> Void)) {
    AF.request("\(baseUrl)\(screen.rawValue)").responseDecodable(of: T.self) { response in
      switch response.result {
      case .success(let decodable):
        callback(.success(decodable))
      case .failure(let error):
        callback(.failure(error))
      }
    }
  }
  
}
