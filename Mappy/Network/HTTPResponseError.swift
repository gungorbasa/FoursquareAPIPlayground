//
//  HTTPResponseError.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

enum HTTPResponseError: LocalizedError {
  
  case badResponseCode
  case unknown

  var errorDescription: String? {
    return "Bad Response code"
  }
}
