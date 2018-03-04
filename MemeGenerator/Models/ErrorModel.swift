//
//  ErrorBase.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

public class ErrorModel: MemeBase {

  let errorMessage: String

  init(success: Bool, errorMessage: String) {
    self.errorMessage = errorMessage
    super.init(success: success)
  }

  enum CodingKeys: String, CodingKey {
    case success
    case errorMessage = "error_message"
  }

  required convenience public init(from decoder: Decoder) throws {

    let container = try decoder.container(keyedBy: CodingKeys.self)
    let errorMessage: String = try container.decode(String.self, forKey: .errorMessage)
    let success: Bool = try container.decode(Bool.self, forKey: .success)
    self.init(success: success, errorMessage: errorMessage)
  }
}
