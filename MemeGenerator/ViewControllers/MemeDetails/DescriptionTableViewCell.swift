//
//  DescriptionTableViewCell.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/5/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

  @IBOutlet weak var descriptionLabel: UILabel!
  
  var memeModel: MemesModel? {
    didSet {

      descriptionLabel.text = memeModel?.name
    }
  }
}

extension DescriptionTableViewCell: Reusable {}

