//
//  MKMapView+Extension.swift
//  Mappy
//
//  Created by Gungor Basa on 8/23/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
import MapKit

extension MKMapView {
  
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000,
    animated: Bool = true
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius
    )
    setRegion(coordinateRegion, animated: animated)
  }
}
