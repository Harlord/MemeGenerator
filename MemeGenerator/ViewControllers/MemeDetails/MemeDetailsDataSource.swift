//
//  MemeDetailsDataSource.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/5/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

protocol MemeDetailsDataSourceOutput {

  var imageActual: UIImage? { get }
  func getValues() -> MemesCreate
  var memesModel: MemesModel { get set }
  func configDataSource(state: MemeDetailsController.UIStates)
}

final class MemeDetailsDataSource: NSObject, MemeDetailsDataSourceOutput {

  var memesModel: MemesModel
  let viewController: MemeDetailsTableViewControllerRepresenteble
  var datasource: [CellType] = []

  init(viewController: MemeDetailsTableViewControllerRepresenteble, memesModel: MemesModel) {
    self.viewController = viewController
    self.memesModel = memesModel
    super.init()
    registerCells(viewController)
    setupTableView(viewController)
  }

  lazy var editCell: MemeDetailsEditTableViewCell = { [unowned self] in
    let cell = viewController.tableView.dequeCell() as MemeDetailsEditTableViewCell
    cell.imageUpdate = { size in

      self.viewController.tableView.actualHeight(size: size, completion: { height in
        cell.heightImageConstraint.constant = height
      })
    }
    return cell
  }()

  lazy var descriptionCell: DescriptionTableViewCell = {
    let cell = viewController.tableView.dequeCell() as DescriptionTableViewCell
    return cell
  }()

  lazy var detailCell: MemeDetailsTableViewCell = {
    let cell = viewController.tableView.dequeCell() as MemeDetailsTableViewCell
    cell.imageUpdate = { size in

      self.viewController.tableView.actualHeight(size: size, completion: { height in
        cell.heightImageConstraint.constant = height
      })
    }
    return cell
  }()

  var imageActual: UIImage? {
    return editCell.pictureImageView?.image ?? detailCell.pictureImageView?.image
  }

  func getValues() -> MemesCreate {
    let values = editCell.getValues()
    let dataMeme = MemesCreate(templateId: memesModel.id,
                               textPrimary: values.primary ?? "",
                               textSecondary: values.secondary ?? "")
    return dataMeme
  }

  fileprivate func registerCells(_ viewController: MemeDetailsTableViewControllerRepresenteble) {
    viewController.tableView.register(reusableCell: MemeDetailsTableViewCell.self)
    viewController.tableView.register(reusableCell: DescriptionTableViewCell.self)
    viewController.tableView.register(reusableCell: MemeDetailsEditTableViewCell.self)
  }

  fileprivate func setupTableView(_ viewController: MemeDetailsTableViewControllerRepresenteble) {
    viewController.tableView.dataSource = self
    viewController.tableView.estimatedRowHeight = 100
    viewController.tableView.rowHeight = UITableViewAutomaticDimension
  }

  func configDataSource(state: MemeDetailsController.UIStates) {
    datasource.removeAll()
    switch state {
    case .editing:
      datasource.append(.description)
      datasource.append(.memeEdit)

    case .readOnly:
      datasource.append(.description)
      datasource.append(.memeDetail)
    }
    viewController.tableView.reloadData()
  }

  enum CellType {
    case description
    case memeDetail
    case memeEdit
  }
}

extension MemeDetailsDataSource: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return datasource.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cellType = datasource[indexPath.row]

    switch cellType {
    case .description:
      descriptionCell.memeModel = memesModel
      return descriptionCell

    case .memeDetail:
      detailCell.memeModel = memesModel
      return detailCell

    case .memeEdit:
      editCell.memeModel = memesModel
      return editCell
    }
  }
}
