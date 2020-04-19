//
//  GigModel.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-19.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

// MARK: - Gig
struct GigModel: Codable {
  let id: Int
  let name: String
  let fromDate, endDate: String?
  let type: GigType
  let bands: [BandModel]?
  let venue: VenueModel?
  let images: [ImageModel]?
  
  enum CodingKeys: String, CodingKey {
    case id, name, type, bands, venue, images
    case fromDate = "from_date"
    case endDate = "end_date"
  }
}
