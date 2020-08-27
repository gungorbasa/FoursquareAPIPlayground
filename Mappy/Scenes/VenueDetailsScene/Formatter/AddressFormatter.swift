//
//  AddressFormatter.swift
//  Mappy
//
//  Created by Gungor Basa on 8/27/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol AddressFormatting {
  
  func formattedAddress(from location: Location) -> String
}

final class AddressFormatter: AddressFormatting {
  func formattedAddress(from location: Location) -> String {
    guard let formattedArray = location.formattedAddress else {
      return location.address ?? ""
    }
    return formattedArray.joined(separator: "\n")
  }
}
