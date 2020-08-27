//
//  ImageLoader.swift
//  Mappy
//
//  Created by Gungor Basa on 8/27/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit
import Nuke

protocol ImageLoading {
  
  static var shared: ImageLoading { get }

  func load(url: URL, into: UIImageView)
}

final class ImageLoader: ImageLoading {

  static let shared: ImageLoading = ImageLoader()

  private let placeholderImageName: String = "placeholder"
  private let animationTime: Double = 0.5

  func load(url: URL, into: UIImageView) {
    let options = ImageLoadingOptions(
      placeholder: UIImage(named: placeholderImageName),
      transition: .fadeIn(duration: animationTime)
    )
    Nuke.loadImage(with: url, options: options, into: into)
  }
}
