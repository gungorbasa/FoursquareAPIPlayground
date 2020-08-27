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
  private let venueId: String

  init(
    _ view: VenueDetailsViewProtocol,
    interactor: VenueDetailsInteractorProtocol,
    router: VenueDetailsRouterProtocol,
    id: String
  ) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.venueId = id
    self.interactor.delegate = self
  }

  func onViewDidLoad() {
    interactor.fetchVenueDetails(id: venueId)
  }
}

extension VenueDetailsPresenter: VenueDetailsInteractorDelegate {

  func handleOutput(_ output: VenueDetailsInteractorOutput) {

  }
}
