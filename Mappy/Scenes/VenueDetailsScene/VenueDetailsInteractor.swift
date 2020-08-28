//
//  VenueDetailsInteractor.swift
//  Mappy
//
//  Created Gungor Basa on 8/24/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class VenueDetailsInteractor: VenueDetailsInteractorProtocol {
  
  weak var delegate: VenueDetailsInteractorDelegate?

  private let service: VenueDetailsServing

  init(_ service: VenueDetailsServing) {
    self.service = service
  }

  func fetchVenueDetails(id: String) {
    service.fetch(id) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success(let details):
        self.delegate?.handleOutput(.details(details.venue))
      case .failure(let error):
        self.delegate?.handleOutput(.error(error))
      }
    }
  }
}
