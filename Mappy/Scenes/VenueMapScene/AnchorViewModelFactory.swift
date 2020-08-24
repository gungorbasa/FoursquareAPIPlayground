//
//  AnchorViewModelFactory.swift
//  Mappy
//
//  Created by Gungor Basa on 8/23/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol AnchorViewModelFactorying {

  func anchorViewModel(from model: Venue) -> AnchorViewModeling
}

final class AnchorViewModelFactory: AnchorViewModelFactorying {

  func anchorViewModel(from model: Venue) -> AnchorViewModeling {
    return AnchorViewModel(
      id: model.id,
      latitude: model.location.lat,
      longitude: model.location.lng,
      title: model.name,
      subtitle: nil
    )
  }
}
