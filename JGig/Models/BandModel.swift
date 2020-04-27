//
//  BandModel.swift
//  JGig
//
//  Created by Joacim Nidén on 2020-04-19.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import Foundation

// MARK: - HomeBand
struct BandModel: Codable {
    let id: Int
    let name: String
    let gigs: [GigModel]?
}

extension Array where Element == BandModel {
  
  /// Groups bandmodels by the first letter in their names and sorts the array by the letter
  /// - Returns: BandSectionModels
  func createAlphabeticalSection() -> [BandSectionModel] {
    
    let dict = Dictionary(grouping: self) { String($0.name.first!) }
    
    return dict.map {
      BandSectionModel(letter: $0.key, rows: $0.value)
    }.sorted(by: { $0.letter.lowercased() < $1.letter.lowercased() })
  }
  
  /// Searches the bands and creates BandSectionModels
  /// - Parameter string: search string
  /// - Returns: BandSectionModels
  func search(_ string: String) -> [BandSectionModel] {
    let filtered = self.filter {
      $0.name.lowercased().contains(string.lowercased())
    }
      
    return filtered.createAlphabeticalSection()
  }
}
