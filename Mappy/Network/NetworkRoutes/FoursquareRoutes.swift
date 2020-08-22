//
//  FoursquareRoutes.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

enum FoursquareRoutes: NetworkRouting {

  case venues
  case details(String)

  var host: String { return "https://api.foursquare.com/v2" }

  var path: String {
    switch self {
    case .venues:
      return "/venues/explore"
    case .details(let venueId):
      return "/venues/\(venueId)"
    }
  }

  var headers: [String : String] { [:] }

  var parameters: [String : Any] { [:] }

  var body: [String : Any] { [:] }

  var method: HTTPMethod {
    switch self {
    case .venues, .details:
      return .get
    }
  }
}
