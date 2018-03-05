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
  var imageUpdate: ((_ ratio: CGFloat)->Void)?

  public func getValues() -> (primary: String?, secondary: String?) {
    return (primary: primaryText.text, secondary: secondaryText.text)
  }

  var memeModel: MemesModel? {
    didSet {

      pictureImageView.kf.setImage(with: memeModel?.url, placeholder: #imageLiteral(resourceName: "placeholder"), completionHandler: { [weak self] image, error, cacheType, imageURL in

        let imageSize = image?.size
        let ratio = (imageSize?.height ?? 0) / (imageSize?.width ?? 0)
        self?.imageUpdate?(ratio)
      })
      primaryText.attributedPlaceholder = NSAttributedString(string: "Write the top text", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
      secondaryText.attributedPlaceholder = NSAttributedString(string: "Write the bottom text", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }
  }
}

extension MemeDetailsEditTableViewCell: Reusable {}
