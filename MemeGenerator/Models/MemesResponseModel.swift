//
//  MemesResponse.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

public class MemesResponseModel: MemeBase {
  
  let data: DataModel

  init(success: Bool, data: DataModel) {
    self.data = data
    super.init(success: success)
  }

  enum CodingKeys: String, CodingKey {
    case success
    case data
  }

  required convenience public init(from decoder: Decoder) throws {

    let container = try decoder.container(keyedBy: CodingKeys.self)
    let data: DataModel = try container.decode(DataModel.self, forKey: .data)
    let success: Bool = try container.decode(Bool.self, forKey: .success)
    self.init(success: success, data: data)
  }
}
