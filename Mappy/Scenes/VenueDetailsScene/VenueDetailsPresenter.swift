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

  init(_ view: VenueDetailsViewProtocol, interactor: VenueDetailsInteractorProtocol, router: VenueDetailsRouterProtocol) {
    self.view = view
    self.interactor = interactor
    self.router = router
    self.interactor.delegate = self
  }
}

extension VenueDetailsPresenter: VenueDetailsInteractorDelegate {

  func handleOutput(_ output: VenueDetailsInteractorOutput) {

  }
}
