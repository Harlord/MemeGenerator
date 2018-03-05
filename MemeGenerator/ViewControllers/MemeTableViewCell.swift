//
//  MemeTableViewCell.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/4/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit
import Kingfisher

class MemeTableViewCell: UITableViewCell {

  @IBOutlet weak var pictureImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!

  var memeModel: MemesModel? {
    didSet {

      pictureImageView.kf.setImage(with: memeModel?.url, placeholder: #imageLiteral(resourceName: "placeholder"))
      titleLabel.text = memeModel?.name
    }
  }
}

extension MemeTableViewCell: Reusable {}
