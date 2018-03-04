//
//  Encodable.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/3/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

extension Encodable {

  var json: String? {

    guard
      let jsonData = try? JSONEncoder().encode(self),
      let jsonString = String(data: jsonData, encoding: .utf8) else {
      return nil
    }

    return jsonString
  }

  var dictionary: [String: Any]? {

    guard

      let data = try? JSONEncoder().encode(self),
      let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      return nil
    }

    return dictionary
  }
}
