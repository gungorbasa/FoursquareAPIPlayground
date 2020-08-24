//
//  VenueDetailsContracts.swift
//  Mappy
//
//  Created Gungor Basa on 8/24/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

// MARK: - Interactor
protocol VenueDetailsInteractorProtocol: class {
  
  var delegate: VenueDetailsInteractorDelegate? { get set }
}

enum VenueDetailsInteractorOutput {
  
}

protocol VenueDetailsInteractorDelegate: class {
  
  func handleOutput(_ output: VenueDetailsInteractorOutput)
}

// MARK: - Presenter
protocol VenueDetailsPresenterProtocol: class {
  
}

enum VenueDetailsPresenterOutput: Equatable {
  
}

// MARK: - View
protocol VenueDetailsViewProtocol: class {
  
  func handleOutput(_ output: VenueDetailsPresenterOutput)
}

// MARK: - Router
enum VenueDetailsRoute: Equatable {
  
}

protocol VenueDetailsRouterProtocol: class {
  
  func navigate(to route: VenueDetailsRoute)
}
