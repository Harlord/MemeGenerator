//
//  MemeDetailsTableViewCell.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/5/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

class MemeDetailsTableViewCell: UITableViewCell {

  @IBOutlet weak var heightImageConstraint: NSLayoutConstraint!
  @IBOutlet weak var pictureImageView: UIImageView!
  var imageUpdate: ((_ size: CGSize)->Void)?

  var memeModel: MemesModel? {
    didSet {
      pictureImageView.contentMode = .scaleAspectFit
      pictureImageView.kf.setImage(with: memeModel?.url, placeholder: #imageLiteral(resourceName: "placeholder"), completionHandler: { [weak self] image, error, cacheType, imageURL in

        guard let size = image?.size else { return }

        self?.imageUpdate?(size)
      })
    }
  }
}

extension MemeDetailsTableViewCell: Reusable {}

