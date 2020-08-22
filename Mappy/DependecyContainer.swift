//
//  DependecyContainer.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol DependencyContaining {

  static var configuration: Configurating { get }
  static var networking: Networking { get }
}

struct DependencyContainer: DependencyContaining {
  
  static let configuration: Configurating = Configuration()
  static let networking: Networking = AlamofireNetwork()
}
