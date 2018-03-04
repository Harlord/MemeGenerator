//
//  OperationResult.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

public enum OperationResult<T> {
  case succeeded(T)
  case failed(ErrorPlatform)
  typealias Callback = (OperationResult<T>) -> Void
}
