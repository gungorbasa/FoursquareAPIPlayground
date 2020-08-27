//
//  FoursquareRoutes.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

enum FoursquareRoutes: NetworkRouting {

  case venues(latitude: Double, longitude: Double)
  case details(String)

  var host: String { return "https://api.foursquare.com/v2" }

  var path: String {
    switch self {
    case .venues:
      return "/venues/search"
    case .details(let venueId):
      return "/venues/\(venueId)"
    }
  }

  var headers: [String : String] { [:] }

  var parameters: [String : Any] {
    var defaultParams: [String: Any] = [
      "client_id": DependencyContainer.configuration.foursquareConfig?.clientId ?? "",
      "client_secret": DependencyContainer.configuration.foursquareConfig?.clientSecret ?? "",
      "v": "20200822"
    ]
    switch self {
    case .venues(let latitude, let longitude):
      defaultParams["ll"] = "\(latitude), \(longitude)"
    default:
      break
    }
    return defaultParams
  }

  var body: [String : Any] { [:] }

  var method: HTTPMethod {
    switch self {
    case .venues, .details:
      return .get
    }
  }
}
