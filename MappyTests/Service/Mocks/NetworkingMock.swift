//
//  NetworkingMock.swift
//  MappyTests
//
//  Created by Gungor Basa on 8/28/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
@testable import Mappy

final class NetworkingMock: Networking {

  var result: Any!

  func run<T>(route: NetworkRouting, completion: @escaping (Result<T, Error>) -> ()) where T : Decodable, T : Encodable {
    completion(result as! Result<T, Error>)
  }
}
