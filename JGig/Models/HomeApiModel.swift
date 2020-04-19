//
//  HomeApiModel.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-18.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

struct HomeApiModel: Codable {
  let gigs: Int
  let bands: [BandModel]
  let lastgig: GigModel
  let totalGigCount: Int
  let title: String
  
  enum CodingKeys: String, CodingKey {
    case gigs, bands, lastgig, title
    case totalGigCount = "total_gig_count"
  }
}
