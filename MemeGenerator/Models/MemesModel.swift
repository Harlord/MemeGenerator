//
//  Memes.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

public struct MemesModel: Decodable {

  let id: String
  let name: String
  let url: String
  let width: Int
  let height: Int
}
