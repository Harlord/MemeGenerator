//
//  MemesListTableViewController.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

protocol MemesListTableViewControllerRepresenteble: class {

  var tableView: UITableView! { get }
  var view: UIView! { get }
}

class MemesListTableViewController: UITableViewController {

  var memesDataSource: MemesDataSourceOutput?
  var memesController: MemesControllerOutput?

  override func viewDidLoad() {
    super.viewDidLoad()

    setupDataSource()
    setupController()
  }

  func setupDataSource() {
    memesDataSource = MemesDataSource(viewController: self)
  }

  func setupController() {
    memesController = MemesController()

    memesController?.onError = { error in
      //TODO: Manage error
    }

    memesController?.onRefreshMemes = { [weak self] memes in
      self?.memesDataSource?.datasource = memes
    }

    memesController?.fetchMemes()
  }
}

extension MemesListTableViewController: MemesListTableViewControllerRepresenteble {

}
