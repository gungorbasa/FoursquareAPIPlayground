//
//  DependecyContainer.swift
//  Mappy
//
//  Created by Gungor Basa on 8/22/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import Foundation

protocol DependencyContaining {

  var configuration: Configurating { get }
}

struct DependencyContainer: DependencyContaining {
  
  let configuration: Configurating = Configuration()
}
