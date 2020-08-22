//
//  VenueMapViewController.swift
//  Mappy
//
//  Created Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class VenueMapViewController: UIViewController {

    var presenter: VenueMapPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

    }
}

extension VenueMapViewController: VenueMapViewProtocol {

    func handleOutput(_ output: VenueMapPresenterOutput) {

    }
}
