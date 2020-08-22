//
//  Service.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol Service {

  associatedtype T

  func fetch(_ completion: @escaping (Result<T, Error>) -> Void)
}

protocol PaginatableService: Service {
  
  func fetchMore(_ completion: @escaping (Result<T, Error>) -> Void)
}
