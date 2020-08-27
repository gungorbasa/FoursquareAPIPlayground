//
//  UIViewController+Extension.swift
//  Mappy
//
//  Created by Gungor Basa on 8/27/20.
//  Copyright © 2020 Gungor Basa. All rights reserved.
//

import UIKit

extension UIViewController {

  func show(message: String) {
    let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
    present(alert, animated: true, completion: nil)
  }
}
