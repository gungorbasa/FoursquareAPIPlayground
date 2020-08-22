//
//  FoursquareConfig.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

struct FoursquareConfig: Codable {

  private enum CodingKeys: String, CodingKey {
    case clientId = "client_id"
    case clientSecret = "client_secret"
  }
  
  let clientId: String
  let clientSecret: String
}
