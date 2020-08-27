//
//  VenueDetailsService.swift
//  Mappy
//
//  Created by Gungor Basa on 8/24/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol VenueDetailsServing {

  typealias T = VenuesDetailsResponse

  func fetch(_ id: String, completion: @escaping (Result<T, Error>) -> Void)
}

final class VenueDetailsService: VenueDetailsServing {

  private let networking: Networking

  init(networking: Networking = DependencyContainer.networking) {
    self.networking = networking
  }

  func fetch(_ id: String, completion: @escaping (Result<T, Error>) -> Void) {
    networking.run(route: FoursquareRoutes.details(id), completion: completion)
  }
}
