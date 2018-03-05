//
//  MemesUIController.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

protocol MemesDataSourceOutput {

  var datasource: [MemesModel] { get set }
}

final class MemesDataSource: NSObject, MemesDataSourceOutput {

  let viewController: MemesListTableViewControllerRepresenteble

  var datasource: [MemesModel] = [] {
    didSet {
      viewController.tableView.reloadData()
    }
  }

  init(viewController: MemesListTableViewControllerRepresenteble) {
    self.viewController = viewController
    viewController.tableView.register(reusableCell: MemeTableViewCell.self)
    super.init()
    viewController.tableView.dataSource = self
    viewController.tableView.estimatedRowHeight = 308
    viewController.tableView.rowHeight = UITableViewAutomaticDimension
  }
}

extension MemesDataSource: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return datasource.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = viewController.tableView.dequeCell(for: indexPath) as MemeTableViewCell
    let meme = datasource[indexPath.row]
    cell.memeModel = meme
    return cell
  }
}
