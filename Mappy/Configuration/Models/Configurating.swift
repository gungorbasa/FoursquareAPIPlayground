//
//  Configurating.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol Configurating {

  var foursquareConfig: FoursquareConfig? { get }
}

final class Configuration: Configurating {

  private let foursquareFileName: String = "FoursquareConfig"

  private lazy var foursquareURL: URL? = {
    return Bundle(for: type(of: self)).url(forResource: "FoursquareConfig", withExtension: "plist")
  }()

  var foursquareConfig: FoursquareConfig? {
    let decoder = PropertyListDecoder()

    guard let url = foursquareURL, let data = try? Data.init(contentsOf: url),
      let config = try? decoder.decode(FoursquareConfig.self, from: data)
      else { return nil }

    return config
  }
}
