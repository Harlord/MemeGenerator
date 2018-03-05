//
//  MemesCreate.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/3/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

public class MemesCreate {

  let templateId: String
  let userName: String
  let password: String
  let textPrimary: String
  let textSecondary: String?

  init(templateId: String,
       textPrimary: String,
       textSecondary: String?) {

    self.templateId = templateId
    self.userName = "imgflip_hubot"
    self.password = "imgflip_hubot"
    self.textPrimary = textPrimary
    self.textSecondary = textSecondary
  }
}

extension MemesCreate: Encodable {

  enum CodingKeys: String, CodingKey {
    case templateId = "template_id"
    case userName = "username"
    case password
    case textPrimary = "text0"
    case textSecondary = "text1"
  }

  public func encode(to encoder: Encoder) throws {

    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(templateId, forKey: .templateId)
    try container.encode(userName, forKey: .userName)
    try container.encode(password, forKey: .password)
    try container.encode(textPrimary, forKey: .textPrimary)
    try? container.encode(textSecondary, forKey: .textSecondary)
  }
}
