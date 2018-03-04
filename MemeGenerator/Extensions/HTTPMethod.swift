//
//  HTTPMethod.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import Alamofire

extension HTTPMethod {

  var codeSuccess: Int {
    
    switch self {
    case .get, .put, .patch, .head, .trace, .connect, .options: return 200
    case .post: return 201
    case .delete:return 204
    }
  }
}
