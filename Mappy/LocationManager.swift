//
//  LocationManager.swift
//  Mappy
//
//  Created by Gungor Basa on 8/23/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation
import CoreLocation

enum LocationManagerError: Error {

  case noLocationFound
}

protocol LocationManaging {
  typealias LocationCompletion = (Result<CLLocationCoordinate2D, Error>) -> Void

  func requestAuthorization()
  func requestLocation(completion: @escaping LocationCompletion)
}

final class LocationManager: NSObject, LocationManaging {

  private let manager: CLLocationManager
  private var completion: LocationCompletion?

  var authorizationStatus: CLAuthorizationStatus { CLLocationManager.authorizationStatus() }

  init(_ manager: CLLocationManager = CLLocationManager()) {
    self.manager = manager
    super.init()
    self.manager.delegate = self
  }

  func requestAuthorization() {
    manager.requestWhenInUseAuthorization()
  }

  func requestLocation(completion: @escaping LocationCompletion) {
    self.completion = completion
    manager.requestLocation()
  }
}

extension LocationManager: CLLocationManagerDelegate {

  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    completion?(.failure(error))
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let coordinates = locations.first?.coordinate else {
      completion?(.failure(LocationManagerError.noLocationFound))
      return
    }
    completion?(.success(coordinates))
  }
}
