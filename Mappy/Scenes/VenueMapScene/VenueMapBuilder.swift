//
//  VenueMapBuilder.swift
//  Mappy
//
//  Created Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class VenueMapBuilder {

  static func make() -> VenueMapViewController {
    let storyboard = UIStoryboard(name: "VenueMap", bundle: nil)
    let view = storyboard.instantiateViewController(withIdentifier: "VenueMapViewController") as! VenueMapViewController
    // TODO: Injections
    let router = VenueMapRouter(view)
    let service = VenueService()
    let locationManger = LocationManager()
    let interactor = VenueMapInteractor(service, locationManager: locationManger)
    let factory = AnchorViewModelFactory()
    let presenter = VenueMapPresenter(view, interactor: interactor, router: router, factory: factory)
    view.presenter = presenter
    return view
  }
}
