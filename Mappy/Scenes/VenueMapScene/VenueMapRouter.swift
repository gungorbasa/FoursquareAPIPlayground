//
//  VenueMapRouter.swift
//  Mappy
//
//  Created Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class VenueMapRouter: VenueMapRouterProtocol {

    weak var view: UIViewController?

    init(_ view: UIViewController) {
        self.view = view
    }

    func navigate(to route: VenueMapRoute) {
      switch route {
      case .details(let id):
        let vc = VenueDetailsBuilder.make(id: id)
        view?.present(vc, animated: true, completion: nil)
      }
    }
}
