//
//  MemeDetailsTableViewController.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/5/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

protocol MemeDetailsTableViewControllerRepresenteble {

  var tableView: UITableView! { get }
  var view: UIView! { get }
}

class MemeDetailsTableViewController: UITableViewController {

  var memesDataSource: MemeDetailsDataSourceOutput?
  var memesController: MemeDetailsControllerOutput?

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.isToolbarHidden = false
  }

  @IBOutlet weak var editButton: UIBarButtonItem!

  @IBAction func editAction(_ sender: UIBarButtonItem) {
    memesController?.editDone()
  }

  @IBAction func shareAction(_ sender: Any) {
    let alert = UIAlertController(title: "Share your meme by:", message: "", preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction(title: "Facebook", style: .default) { action in

      guard let memesDataSource = self.memesDataSource else { return }
      SocialCloud().share(urlToShare: memesDataSource.memesModel.url)
    })
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { action in
      // perhaps use action.title here
    })
    present(alert, animated: true, completion: nil)
  }

  func updateEditButton(state: MemeDetailsController.UIStates) {
    switch state {
    case .editing:
      editButton.title = "Save"
    case .readOnly:
      editButton.title = "Edit"
    }
  }

  public func setupDataSource(memesModel: MemesModel) {
    self.memesDataSource = MemeDetailsDataSource(viewController: self, memesModel: memesModel)
    setupController()
  }

  func setupController() {
    memesController = MemeDetailsController()
    memesController?.onError = { error in
      //TODO: Manage error
    }

    memesController?.onCreateMeme = { [weak self] memes in
      self?.memesDataSource?.memesModel.url = memes.url
    }

    memesController?.onChangeStatus = { [weak self] state in
      self?.updateEditButton(state: state)
      self?.memesDataSource!.configDataSource(state: state)
    }

    memesController?.onGetDataMeme = { [weak self] in
      let dataMeme = self?.memesDataSource?.getValues()
      return dataMeme
    }

    self.memesController?.onChangeStatus?(MemeDetailsController.UIStates.readOnly)
  }
}

extension MemeDetailsTableViewController: MemeDetailsTableViewControllerRepresenteble {

}
