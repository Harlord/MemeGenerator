//
//  MemeCreateModel.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

public struct MemeCreateModel {

  let url: String
  let pageUrl: String

  init(url: String, pageUrl: String) {
    self.url = url
    self.pageUrl = pageUrl
  }
}

extension MemeCreateModel: Decodable {

  enum CodingKeys: String, CodingKey {
    case
    url,
    pageUrl = "page_url"
  }

  public init(from decoder: Decoder) throws {

    let container = try decoder.container(keyedBy: CodingKeys.self)
    let url: String = try container.decode(String.self, forKey: .url)
    let pageUrl: String = try container.decode(String.self, forKey: .pageUrl)
    self.init(url: url, pageUrl: pageUrl)
  }
}
