//
//  VenueDetailsViewController.swift
//  Mappy
//
//  Created Gungor Basa on 8/24/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class VenueDetailsViewController: UIViewController {
  
  var presenter: VenueDetailsPresenterProtocol!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.onViewDidLoad()
    setup()
  }
  
  private func setup() {
    
  }
}

extension VenueDetailsViewController: VenueDetailsViewProtocol {
  
  func handleOutput(_ output: VenueDetailsPresenterOutput) {
    
  }
}
