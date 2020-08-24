//
//  VenueDetailsRouter.swift
//  Mappy
//
//  Created Gungor Basa on 8/24/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class VenueDetailsRouter: VenueDetailsRouterProtocol {
  
  unowned let view: UIViewController
  
  init(_ view: UIViewController) {
    self.view = view
  }
  
  func navigate(to route: VenueDetailsRoute) {
    
  }
}
