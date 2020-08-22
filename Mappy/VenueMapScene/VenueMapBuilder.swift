//
//  VenueMapBuilder.swift
//  Mappy
//
//  Created Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

final class VenueMapBuilder {

    static func make() -> VenueMapViewController {
        let storyboard = UIStoryboard(name: "VenueMap", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "VenueMapViewController") as! VenueMapViewController
        // TODO: Injections
        let router = VenueMapRouter(view)
//        let networkWorker = NetworkWorker(app.networking)
//        let service = RestaurantListService(networkWorker, database: DbWorker(Database()))
//        //        MovieListInteractor(app.service)
        let interactor = VenueMapInteractor()
//        let interactor = VenueMapInteractor(service)
        let presenter = VenueMapPresenter(view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
