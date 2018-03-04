//
//  MemesRoutes.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/3/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import Alamofire

enum MemesRoutes: URLRequestConvertible {
  case list
  case create(parameters: MemesCreate)

  var method: HTTPMethod {
    switch self {
    case .list: return .get
    case .create: return .post
    }
  }

  var path: String {
    switch self {
    case .list: return "/get_memes"
    case .create: return "/caption_image"
    }
  }

  func getUrl() throws -> URL {
    return try cloudMemeBase.asURL().appendingPathComponent(path)
  }

  var params: Parameters? {
    switch self {
    case .list: return nil
    case let .create(parameters: parameters): return parameters.dictionary
    }
  }

  var encoding: Alamofire.ParameterEncoding {
    switch self {
    case .list: return URLEncoding()
    case .create: return URLEncoding()
    }
  }

  func asURLRequest() throws -> URLRequest {
    let url = try getUrl()
    var request = URLRequest(url: url)
    request.httpMethod = HTTPMethod.get.rawValue
    let params = self.params
    print("Request path: \(method) \(url.absoluteString)")
    print("Request params: \(String(describing: params))")
    let result = try encoding.encode(request, with: params)
    return result
  }
}
