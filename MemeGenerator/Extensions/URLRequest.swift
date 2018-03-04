//
//  URLRequest.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import Alamofire

extension URLRequest {

  var httpMethodTyped: HTTPMethod {

    switch httpMethod ?? "" {
    case HTTPMethod.options.rawValue: return .options
    case HTTPMethod.get.rawValue: return .get
    case HTTPMethod.head.rawValue: return .head
    case HTTPMethod.post.rawValue: return .post
    case HTTPMethod.put.rawValue: return .put
    case HTTPMethod.patch.rawValue: return .patch
    case HTTPMethod.delete.rawValue: return .delete
    case HTTPMethod.trace.rawValue: return .trace
    case HTTPMethod.connect.rawValue: return .connect
    default: return .get
    }
  }
}
