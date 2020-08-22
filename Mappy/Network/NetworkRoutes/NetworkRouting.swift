//
//  NetworkRouting.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol NetworkRouting {
  
  var host: String { get }
  var path: String { get }
  var headers: [String: String] { get }
  var parameters: [String: Any] { get }
  var body: [String: Any] { get }
  var method: HTTPMethod { get }
}

enum HTTPMethod: String {
  
  case get = "GET"
  case post = "POST"
  case put = "PUT"
  case delete = "DELETE"
}
