//
//  AnchorViewModel.swift
//  Mappy
//
//  Created by Gungor Basa on 8/23/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
import MapKit

protocol AnchorViewModeling: NSObject, MKAnnotation {

  var id: String { get }
}

final class AnchorViewModel: NSObject, AnchorViewModeling {

  let id: String
  let coordinate: CLLocationCoordinate2D
  let title: String?
  let subtitle: String?

  init(
    id: String,
    latitude: Double,
    longitude: Double,
    title: String? = nil,
    subtitle: String? = nil
  ) {
    self.id = id
    self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    self.title = title
    self.subtitle = subtitle
  }
}
