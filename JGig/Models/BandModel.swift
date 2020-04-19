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
