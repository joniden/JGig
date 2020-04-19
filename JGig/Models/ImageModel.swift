//
//  ImageModel.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-19.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

struct ImageModel: Codable {
  let id: Int
  let title: String
  let path: String
  
  enum CodingKeys: String, CodingKey {
    case id, title, path
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(Int.self, forKey: .id)
    title = try values.decode(String.self, forKey: .title)
    let filePath = try values.decode(String.self, forKey: .path)
    
    path = "\(Constant.baseUrl)\(filePath)"
    
  }

}
