//
//  MemeDetailsEditTableViewCell.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/5/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit

class MemeDetailsEditTableViewCell: UITableViewCell {

  @IBOutlet weak var primaryText: UITextField!
  @IBOutlet weak var secondaryText: UITextField!
  @IBOutlet weak var heightImageConstraint: NSLayoutConstraint!
  @IBOutlet weak var pictureImageView: UIImageView!
  var imageUpdate: ((_ size: CGSize)->Void)?

  public func getValues() -> (primary: String?, secondary: String?) {
    return (primary: primaryText.text, secondary: secondaryText.text)
  }

  var memeModel: MemesModel? {
    didSet {

      pictureImageView.kf.setImage(with: memeModel?.url, placeholder: #imageLiteral(resourceName: "placeholder"), completionHandler: { [weak self] image, error, cacheType, imageURL in

        guard let size = image?.size else { return }

        self?.imageUpdate?(size)
      })
      primaryText.attributedPlaceholder = NSAttributedString(string: "Write the first here", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
      secondaryText.attributedPlaceholder = NSAttributedString(string: "Write the second text here", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }
  }
}

extension MemeDetailsEditTableViewCell: Reusable {}
