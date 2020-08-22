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

    init(_ view: VenueMapViewProtocol, interactor: VenueMapInteractorProtocol, router: VenueMapRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
}

extension VenueMapPresenter: VenueMapInteractorDelegate {

    func handleOutput(_ output: VenueMapInteractorOutput) {

    }
}
