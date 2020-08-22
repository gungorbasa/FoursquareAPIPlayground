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

  private lazy var foursquareURL: URL = {
    let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    return documents.appendingPathComponent("\(foursquareFileName).plist")
  }()

  var foursquareConfig: FoursquareConfig? {
    let decoder = PropertyListDecoder()

    guard let data = try? Data.init(contentsOf: foursquareURL),
      let config = try? decoder.decode(FoursquareConfig.self, from: data)
      else { return nil }

    return config
  }

  init() {
    copyPreferencesFromBundle(name: foursquareFileName, to: foursquareURL)
  }

  // If no config is available on Documents directory we update it
  // Later, we can always use documents directory for remote config
  private func copyPreferencesFromBundle(name: String, to: URL) {
    if let path = Bundle.main.path(forResource: name, ofType: "plist"),
      let data = FileManager.default.contents(atPath: path),
      FileManager.default.fileExists(atPath: to.path) == false {
      FileManager.default.createFile(atPath: to.path, contents: data, attributes: nil)
    }
  }
}
