//
//  VenueDetailsServiceMock.swift
//  MappyTests
//
//  Created by Gungor Basa on 8/27/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
@testable import Mappy

final class VenueDetailsServiceMock: VenueDetailsServing {

  var result: Result<T, Error>!

  func fetch(_ id: String, completion: @escaping (Result<T, Error>) -> Void) {
    completion(result)
  }
}
