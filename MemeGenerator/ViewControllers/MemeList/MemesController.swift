//
//  MemesController.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

protocol MemesControllerOutput {

  var onRefreshMemes: ((_ memes: [MemesModel]) -> Void)? { get set }
  var onError: ((_ error: ErrorPlatform) -> Void)? { get set }

  func fetchMemes()
}

class MemesController: NSObject {

  var onRefreshMemes: (([MemesModel]) -> Void)?
  var onError: ((_ error: ErrorPlatform) -> Void)?

  let memesCloud: MemesCloudRepresentable = MemesCloud()

  func fetchMemes() {
    memesCloud.list { [weak self] result in
      switch result {
      case let .succeeded(result):
        self?.onRefreshMemes?(result.data.memes)

      case let .failed(error):
        self?.onError?(error)
      }
    }
  }
}

extension MemesController: MemesControllerOutput {

}
