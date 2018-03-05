//
//  MemeDetailsEditTableViewCell.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/5/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

class MemeDetailsEditTableViewCell: UITableViewCell {

  @IBOutlet weak var pictureImageView: UIImageView!

  var memeModel: MemesModel? {
    didSet {

      pictureImageView.kf.setImage(with: memeModel?.url, placeholder: #imageLiteral(resourceName: "placeholder"))
    }
  }
}

extension MemeDetailsEditTableViewCell: Reusable {}
