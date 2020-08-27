//
//  VenueDetailsResponse.swift
//  Mappy
//
//  Created by Gungor Basa on 8/24/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

struct VenuesDetailsResponse: Codable {

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ResponseKeys.self)
    let venueContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
    venue = try venueContainer.decode(VenueDetails.self, forKey: .venue)
  }

  init(venue: VenueDetails) {
    self.venue = venue
  }

  let venue: VenueDetails
}
