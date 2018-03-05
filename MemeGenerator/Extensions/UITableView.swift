//
//  UITableView.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

extension UITableView {

  func register<T: UITableViewCell & Reusable>(reusableCell: T.Type) {

    register(T.nib, forCellReuseIdentifier: T.className)
  }

  func dequeCell<T: UITableViewCell & Reusable>() -> T {

    let v = dequeueReusableCell(withIdentifier: T.className) as! T
    return v
  }

  func dequeCell<T: UITableViewCell & Reusable>(for indexPath: IndexPath) -> T {

    let v = dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    return v
  }

  func removeFooterView() {
    tableFooterView = UIView()
  }
}

