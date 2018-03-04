//
//  ErrorPlatform.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

public enum ErrorPlatform: Error {
  case platform(error: ErrorModel)
  case network(error: Error)
  case unknow(error: String)
  case decode(error: Error)

  static var unknowError: ErrorPlatform {
    return ErrorPlatform.unknow(error: "Unknown Error")
  }
}
