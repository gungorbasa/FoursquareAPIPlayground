//
//  VenueService.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol VenueServing {

  typealias T = VenuesResponse

  func fetch(_ latitude: Float, longitude: Float, completion: @escaping (Result<T, Error>) -> Void)
}

final class VenueService: VenueServing {

  private let networking: Networking

  init(networking: Networking = DependencyContainer.networking) {
    self.networking = networking
  }

  func fetch(_ latitude: Float, longitude: Float, completion: @escaping (Result<T, Error>) -> Void) {
    networking.run(
    route: FoursquareRoutes.venues(latitude: latitude, longitude: longitude)
    ) { (result: Result<T, Error>) in
      completion(result)
    }
  }
}
