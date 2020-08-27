//
//  VenueDetailsBuilder.swift
//  Mappy
//
//  Created Gungor Basa on 8/24/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class VenueDetailsBuilder {
  
  static func make(id: String) -> VenueDetailsViewController {
    let storyboard = UIStoryboard(name: "VenueDetails", bundle: nil)
    let view = storyboard.instantiateViewController(withIdentifier: "VenueDetailsViewController") as! VenueDetailsViewController
    // TODO: Injections
    let router = VenueDetailsRouter(view)
    let service = VenueDetailsService()
    let interactor = VenueDetailsInteractor(service)
    let formatter = AddressFormatter()
    let presenter = VenueDetailsPresenter(
      view,
      interactor: interactor,
      router: router,
      addressFormatter: formatter,
      id: id
    )
    view.presenter = presenter
    view.imageLoader = ImageLoader.shared
    return view
  }
}
