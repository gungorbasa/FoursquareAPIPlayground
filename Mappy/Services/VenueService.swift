//
//  VenueService.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class VenueService: PaginatableService {

  typealias T = String

  private let networking: Networking

  init(networking: Networking = DependencyContainer.networking) {
    self.networking = networking
  }

  func fetch(_ completion: @escaping (Result<T, Error>) -> Void) {

  }

  func fetchMore(_ completion: @escaping (Result<T, Error>) -> Void) {

  }
}
