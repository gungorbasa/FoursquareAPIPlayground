//
//  VenuePhotosService.swift
//  Mappy
//
//  Created by Gungor Basa on 8/27/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol VenuePhotosServing {

  typealias T = VenuesDetailsResponse

  func fetch(_ id: String, completion: @escaping (Result<T, Error>) -> Void)
}

final class VenuePhotosService: VenuePhotosServing {

  private let networking: Networking

  init(networking: Networking = DependencyContainer.networking) {
    self.networking = networking
  }

  func fetch(_ id: String, completion: @escaping (Result<T, Error>) -> Void) {
    networking.run(route: FoursquareRoutes.details(id)) { (result: Result<String, Error>) in

    }
  }
}
