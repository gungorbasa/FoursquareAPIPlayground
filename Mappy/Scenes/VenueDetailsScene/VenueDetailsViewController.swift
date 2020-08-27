//
//  VenueDetailsViewController.swift
//  Mappy
//
//  Created Gungor Basa on 8/24/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit
import Nuke

final class VenueDetailsViewController: UIViewController {
  
  var presenter: VenueDetailsPresenterProtocol!
  var imageLoader: ImageLoading!
  
  @IBOutlet private weak var venueImageView: UIImageView!
  @IBOutlet private weak var nameLabel: UILabel!
  @IBOutlet private weak var addressLabel: UILabel!
  @IBOutlet private weak var hoursLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.onViewDidLoad()
  }
  
  @IBAction func onCloseButtonPressed(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
}

extension VenueDetailsViewController: VenueDetailsViewProtocol {
  
  func handleOutput(_ output: VenueDetailsPresenterOutput) {
    switch output {
    case .image(let url):
      imageLoader.load(url: url, into: venueImageView)
    case .address(let address):
      addressLabel.text = address
    case .name(let name):
      nameLabel.text = name
    case .hours(let hours):
      hoursLabel.text = hours
    case .alert(let message):
      show(message: message)
    }
  }
}
