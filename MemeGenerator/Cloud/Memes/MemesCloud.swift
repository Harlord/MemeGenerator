//
//  MemesCloud.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/3/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import Alamofire

protocol MemesCloudRepresentable {

  func list(callback: @escaping (OperationResult<MemesResponseModel>) -> Void)
  func create(request: MemesCreate, callback: @escaping (OperationResult<MemeCreateResponseModel>) -> Void)
}

class MemesCloud: MemesCloudRepresentable {
  
  public func list(callback: @escaping (OperationResult<MemesResponseModel>) -> Void) {

    Alamofire.request(MemesRoutes.list).responseTyped(callback: callback)
  }

  public func create(request: MemesCreate,
              callback: @escaping (OperationResult<MemeCreateResponseModel>) -> Void) {

    Alamofire.request(MemesRoutes.create(parameters: request)).responseTyped(callback: callback)
  }
}
