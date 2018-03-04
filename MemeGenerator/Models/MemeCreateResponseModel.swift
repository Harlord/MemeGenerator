//
//  MemeCreateModel.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

class MemeCreateResponseModel: MemeBase {

  let data: MemeCreateModel

  init(success: Bool, data: MemeCreateModel) {
    self.data = data
    super.init(success: success)
  }

  enum CodingKeys: String, CodingKey {
    case success
    case data
  }

  required convenience public init(from decoder: Decoder) throws {

    let container = try decoder.container(keyedBy: CodingKeys.self)
    let success: Bool = try container.decode(Bool.self, forKey: .success)
    let data: MemeCreateModel = try container.decode(MemeCreateModel.self, forKey: .data)
    self.init(success: success, data: data)
  }
}
