//
//  VenueMapContracts.swift
//  Mappy
//
//  Created Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol VenueMapInteractorProtocol: class {

    var delegate: VenueMapInteractorDelegate? { get set }
}

enum VenueMapInteractorOutput {

}

protocol VenueMapInteractorDelegate: class {

    func handleOutput(_ output: VenueMapInteractorOutput)
}

// MARK: - Presenter
protocol VenueMapPresenterProtocol: class {

}

enum VenueMapPresenterOutput: Equatable {

}

// MARK: - View
protocol VenueMapViewProtocol: class {

    func handleOutput(_ output: VenueMapPresenterOutput)
}

// MARK: - Router
enum VenueMapRoute: Equatable {

}

protocol VenueMapRouterProtocol: class {

    func navigate(to route: VenueMapRoute)
}
