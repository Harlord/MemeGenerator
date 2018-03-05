//
//  MemeDetailsController.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/5/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

protocol MemeDetailsControllerOutput {

  var uiState: MemeDetailsController.UIStates { get }
  var onCreateMeme: ((_ meme: MemeCreateModel) -> Void)? { get set }
  var onError: ((_ error: ErrorPlatform) -> Void)? { get set }
  var onChangeStatus: ((_ state: MemeDetailsController.UIStates) -> Void)? { get set }
  var onGetDataMeme: (() -> MemesCreate?)? { get set }

  func editDone()
  func createMeme(request: MemesCreate)
}

class MemeDetailsController: NSObject {

  var onCreateMeme: ((_ meme: MemeCreateModel) -> Void)?
  var onError: ((_ error: ErrorPlatform) -> Void)?
  var onChangeStatus: ((_ state: MemeDetailsController.UIStates) -> Void)?
  var onGetDataMeme: (() -> MemesCreate?)?

  let memesCloud: MemesCloudRepresentable = MemesCloud()

  var uiState: UIStates = .readOnly

  enum UIStates {
    case readOnly
    case editing
  }

  func editDone() {
    switch uiState {
    case .readOnly:
      onChangeStatus?(.editing)
      uiState = .editing

    case .editing:
      guard let dataMeme = self.onGetDataMeme?() else { return }
      createMeme(request: dataMeme)
    }
  }

  func createMeme(request: MemesCreate) {

    memesCloud.create(request: request) {[weak self] result in
      switch result {
      case let .succeeded(result):
        self?.onCreateMeme?(result.data)
        self?.onChangeStatus?(.readOnly)
        self?.uiState = .readOnly

      case let .failed(error):
        self?.onError?(error)
      }
    }
  }
}

extension MemeDetailsController: MemeDetailsControllerOutput {

}
