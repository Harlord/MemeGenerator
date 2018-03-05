//
//  Memes.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

public class MemesModel: Decodable {

  let id: String
  let name: String
  var url: URL
  let width: Int
  let height: Int
}
