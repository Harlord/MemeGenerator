//
//  MemesSuccess.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

public class MemeBase : Decodable {

  let success: Bool

  init(success: Bool) {

    self.success = success
  }
}
