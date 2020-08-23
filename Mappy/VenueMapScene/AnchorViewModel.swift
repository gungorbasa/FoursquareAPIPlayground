//
//  AnchorViewModel.swift
//  Mappy
//
//  Created by Gungor Basa on 8/23/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
import MapKit

protocol AnchorViewModeling: MKAnnotation { }

final class AnchorViewModel: NSObject, AnchorViewModeling {

  var coordinate: CLLocationCoordinate2D
  var title: String?
  var subtitle: String?

  init(
    latitude: Double,
    longitude: Double,
    title: String? = nil,
    subtitle: String? = nil
  ) {
    self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    self.title = title
    self.subtitle = subtitle
  }
}
