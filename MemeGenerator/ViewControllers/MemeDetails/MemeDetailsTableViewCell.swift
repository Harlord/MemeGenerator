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
  var imageUpdate: ((_ ratio: CGFloat)->Void)?

  var memeModel: MemesModel? {
    didSet {
      pictureImageView.contentMode = .scaleAspectFit
      pictureImageView.kf.setImage(with: memeModel?.url, placeholder: #imageLiteral(resourceName: "placeholder"), completionHandler: { [weak self] image, error, cacheType, imageURL in

        let imageSize = image?.size
        let ratio = (imageSize?.height ?? 0) / (imageSize?.width ?? 0)
        self?.imageUpdate?(ratio)
      })
    }
  }
}

extension MemeDetailsTableViewCell: Reusable {}

