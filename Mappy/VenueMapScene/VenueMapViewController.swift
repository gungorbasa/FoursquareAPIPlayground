//
//  VenueMapViewController.swift
//  Mappy
//
//  Created Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit
import MapKit

final class VenueMapViewController: UIViewController {

  @IBOutlet private weak var mapView: MKMapView!

  var presenter: VenueMapPresenterProtocol!

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  private func setup() {
    mapView.delegate = self
  }

  private func addAnnotation(viewModel: AnchorViewModeling) {
    mapView.addAnnotation(viewModel)
  }
}

extension VenueMapViewController: MKMapViewDelegate {
  
  func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    let center = mapView.region.center
    presenter.venueRegionDidChange(latitude: center.latitude, longitude: center.longitude)
    print("Region Changed: \(mapView.region.center)")
  }
}

extension VenueMapViewController: VenueMapViewProtocol {

  func handleOutput(_ output: VenueMapPresenterOutput) {
    switch output {
    case .anchor(let viewModel):
      addAnnotation(viewModel: viewModel)
    }
  }
}
