//
//  Reusable.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

protocol Reusable: class {
  
  static var className: String { get }
  static var nib: UINib { get }
}

extension Reusable {

  static var className: String {
    return "\(self)"
  }

  static var nib: UINib {
    return UINib(nibName: className, bundle: nil)
  }
}
