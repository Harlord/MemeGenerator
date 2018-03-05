//
//  MemeGeneratorTests.swift
//  MemeGeneratorTests
//
//  Created by Harold Hernandez on 3/3/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import XCTest
@testable import MemeGenerator

class NetworkingTests: XCTestCase {

  let memesCloud: MemesCloudRepresentable = MemesCloud()

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testMemesCloudCreate() {

    var id: String?

    let expectation = self.expectation(description: "testMemesCloudCreate")

    func create(id: String) {

      let request = MemesCreate(templateId: id,
                                userName: "imgflip_hubot",
                                password: "imgflip_hubot",
                                textPrimary: "Primary text",
                                textSecondary: "Secondary")

      memesCloud.create(request: request) { result in
        switch result {
        case let .succeeded(response):
          XCTAssertNotNil(response, "response should not be nil")
          XCTAssertEqual(response.success, true)
          self.testMemesCreateResponseModel(memeCreateResponseModel: response)
          expectation.fulfill()

        case let .failed(error):
          XCTAssertNotNil(error, "error should not be nil")
          XCTAssertTrue(true)
          expectation.fulfill()
        }
      }
    }

    memesCloud.list { result in
      switch result {
      case let .succeeded(response):
        id = response.data.memes.first?.id
        XCTAssertNotNil(id, "response.data.memes.first?.id should not be nil")
        create(id: id!)

      case let .failed(error):
        XCTAssertNotNil(error, "error should not be nil")
        XCTAssertTrue(true)
        expectation.fulfill()

      }
    }

    waitForExpectations(timeout: 20) { error in
      XCTAssertNil(error)
    }
  }

  func testMemesCreateResponseModel(memeCreateResponseModel: MemeCreateResponseModel?) {

    XCTAssertNotNil(memeCreateResponseModel, "response should not be nil")
    XCTAssertNotNil(memeCreateResponseModel?.data, "data should not be nil")
    XCTAssertEqual(memeCreateResponseModel?.success, true)
    XCTAssertNotNil(memeCreateResponseModel?.data.pageUrl, "pageUrl should not be nil")
    XCTAssertNotNil(memeCreateResponseModel?.data.url, "url should not be nil")
  }

  func testMemesCloudList() {

    let expectation = self.expectation(description: "testMemesCloudList")

    memesCloud.list { result in
      switch result {
      case let .succeeded(response):
        XCTAssertNotNil(response, "response should not be nil")
        XCTAssertEqual(response.success, true)
        self.testMemesResponseModel(memesResponseModel: response)
        expectation.fulfill()

      case let .failed(error):
        XCTAssertNotNil(error, "error should not be nil")
        XCTAssertTrue(true)
        expectation.fulfill()

      }
    }

    waitForExpectations(timeout: 10) { error in
      XCTAssertNil(error)
    }
  }

  func testMemesResponseModel(memesResponseModel: MemesResponseModel?) {

    XCTAssertNotNil(memesResponseModel, "response should not be nil")
    XCTAssertNotNil(memesResponseModel?.data, "data should not be nil")
    XCTAssertEqual(memesResponseModel?.success, true)
    testDataModel(dataModel: memesResponseModel?.data)
  }

  func testDataModel(dataModel: DataModel?) {

    XCTAssertNotNil(dataModel, "dataModel item should not be nil")
    let firt = dataModel?.memes.first
    testMemesModel(memesModel: firt)
  }

  func testMemesModel(memesModel: MemesModel?) {

    XCTAssertNotNil(memesModel?.id, "firt.id should not be nil")
    XCTAssertNotNil(memesModel?.name, "firt.name should not be nil")
    XCTAssertNotNil(memesModel?.url, "firt.url should not be nil")
    XCTAssertNotNil(memesModel?.width, "firt.width should not be nil")
    XCTAssertNotNil(memesModel?.height, "firt.height should not be nil")
  }
}

