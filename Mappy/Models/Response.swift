//
//  Response.swift
//  Mappy
//
//  Created by Gungor Basa on 8/27/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

struct Response<T: Codable>: Codable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ResponseKeys.self)
    let venueContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
    response = try venueContainer.decode(T.self, forKey: .response)
  }

  let response: T
}
