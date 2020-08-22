//
//  VenuesResponse.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

struct VenuesResponse: Codable {

  enum ResponseKeys: String, CodingKey {
    case response
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ResponseKeys.self)
    let venueContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
    venues = try venueContainer.decode([Venue].self, forKey: .venues)
  }
  
  let venues: [Venue]
}
