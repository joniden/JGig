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
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    id = try values.decode(Int.self, forKey: .id)
    name = try values.decode(String.self, forKey: .name)
    type = try values.decode(GigType.self, forKey: .type)
    bands = try values.decodeIfPresent([BandModel].self, forKey: .bands)
    venue = try values.decodeIfPresent(VenueModel.self, forKey: .venue)
    images = try values.decodeIfPresent([ImageModel].self, forKey: .images)
    
    // Format the dates
    let fromDateString = try values.decodeIfPresent(String.self, forKey: .fromDate)
    let endDateString = try values.decodeIfPresent(String.self, forKey: .endDate)
    
    fromDate = fromDateString.getFormattedDateString()
    endDate = endDateString.getFormattedDateString()
    
  }
  
}

extension Array where Element == GigModel {
  
  /// Searches the Gigs
  /// - Parameter string: search string
  /// - Returns: BandSectionModels
  func search(_ string: String) -> [GigModel] {
    return self.filter {
      $0.name.lowercaseContains(string)
    }
  }
}
