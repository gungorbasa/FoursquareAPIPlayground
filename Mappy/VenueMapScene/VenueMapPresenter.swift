//
//  VenueMapPresenter.swift
//  Mappy
//
//  Created Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class VenueMapPresenter: VenueMapPresenterProtocol {

  private weak var view: VenueMapViewProtocol?

  private let interactor: VenueMapInteractorProtocol
  private let router: VenueMapRouterProtocol
  private var venueSet = Set<Venue>()
  private let factory: AnchorViewModelFactorying

  init(
    _ view: VenueMapViewProtocol,
    interactor: VenueMapInteractorProtocol,
    router: VenueMapRouterProtocol,
    factory: AnchorViewModelFactorying
  ) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.factory = factory
    self.interactor.delegate = self
  }

  func onViewDidLoad() {
    interactor.requestLocationAuthorization()
    interactor.requestLocation()
  }

  func venueRegionDidChange(latitude: Double, longitude: Double) {
    interactor.venues(for: latitude, longitude: longitude)
  }
}

extension VenueMapPresenter: VenueMapInteractorDelegate {

  func handleOutput(_ output: VenueMapInteractorOutput) {
    DispatchQueue.main.async {
      switch output {
      case .venueList(let venues):
        var newVenueSet = Set(venues)
        newVenueSet.subtract(self.venueSet)
        for venue in newVenueSet {
          let viewModel = self.factory.anchorViewModel(from: venue)
          self.view?.handleOutput(.anchor(viewModel))
        }
        // TODO: This may lead to memory problems. We need to find an eviction strategy
        self.venueSet = self.venueSet.union(newVenueSet)
      case .location(let latitude, let longitude):
        self.view?.handleOutput(.currentLocation(lat: latitude, lng: longitude))
      case .error(let error):
        print(error.localizedDescription)
      }
    }
  }
}
