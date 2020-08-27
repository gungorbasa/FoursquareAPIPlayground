//
//  VenueDetails.swift
//  Mappy
//
//  Created by Gungor Basa on 8/24/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

struct VenueDetails: Codable {

  let location: Location
  let name: String
  let bestPhoto: Photo?
  let hereNow: HereNow?
  let hours: Hours?
}
