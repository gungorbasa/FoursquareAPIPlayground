//
//  Networking.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol Networking {

  func run<T: Codable>(route: NetworkRouting, completion: @escaping (Result<T, Error>) -> ())
}
