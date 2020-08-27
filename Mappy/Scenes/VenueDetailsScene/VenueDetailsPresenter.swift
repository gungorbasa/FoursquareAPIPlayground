//
//  VenueDetailsPresenter.swift
//  Mappy
//
//  Created Gungor Basa on 8/24/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class VenueDetailsPresenter: VenueDetailsPresenterProtocol {

  private weak var view: VenueDetailsViewProtocol?

  private let interactor: VenueDetailsInteractorProtocol
  private let router: VenueDetailsRouterProtocol
  private let addressFormatter: AddressFormatting
  private let venueId: String

  init(
    _ view: VenueDetailsViewProtocol,
    interactor: VenueDetailsInteractorProtocol,
    router: VenueDetailsRouterProtocol,
    addressFormatter: AddressFormatting,
    id: String
  ) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.addressFormatter = addressFormatter
    self.venueId = id
    self.interactor.delegate = self
  }

  func onViewDidLoad() {
    interactor.fetchVenueDetails(id: venueId)
  }
}

extension VenueDetailsPresenter: VenueDetailsInteractorDelegate {

  func handleOutput(_ output: VenueDetailsInteractorOutput) {
    DispatchQueue.main.async {
      switch output {
      case .details(let details):
        if let url = self.createPhotoURL(from: details) {
          self.view?.handleOutput(.image(url))
        }
        self.view?.handleOutput(.name(details.name))
        self.view?.handleOutput(.address(
          self.addressFormatter.formattedAddress(from: details.location))
        )
        self.view?.handleOutput(.hours(details.hereNow?.summary ?? ""))
      case .error(let error):
        self.view?.handleOutput(.alert(error.localizedDescription))
      }
    }
  }

  private func createPhotoURL(from details: VenueDetails) -> URL? {
    guard let photo = details.bestPhoto else { return nil }
    let urlString = photo.prefix + "cap700" + photo.suffix
    return URL(string: urlString)
  }
}
