//
//  VenueMapInteractor.swift
//  Mappy
//
//  Created Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

final class VenueMapInteractor: VenueMapInteractorProtocol {

  weak var delegate: VenueMapInteractorDelegate?

  private let service: VenueServing

  init(_ service: VenueServing) {
    self.service = service
  }

  func venues(for latitude: Double, longitude: Double) {
    service.fetch(latitude, longitude: longitude) { [weak self] result in
      guard let self = self else { return }
      switch result {
      case .success(let venuesResponse):
        self.delegate?.handleOutput(.venueList(venuesResponse.venues))
      case .failure(let error):
        self.delegate?.handleOutput(.error(error))
      }
    }
  }
}
