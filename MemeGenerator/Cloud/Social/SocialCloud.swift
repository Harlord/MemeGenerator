//
//  FacebookCloud.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/5/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FacebookShare
import Social
import Kingfisher
import TwitterKit

class SocialCloud {

  
  func getShareByFacebook(urlToShare: URL) -> ShareDialog<LinkShareContent> {

    let linkShareContent = LinkShareContent(url: urlToShare)
    let shareDialog = ShareDialog(content: linkShareContent)
    shareDialog.mode = .automatic
    shareDialog.failsOnInvalidData = true
    return shareDialog
  }

  var errorTwitterViewController: UIAlertController {
    let viewController = UIAlertController(title: "The user has not logged in", message: "You need to login to share", preferredStyle: .alert)
    return viewController
  }

  func getShareByTwitter(text: String, image: UIImage, completion: @escaping ((UIViewController) -> Void)) {

    if (TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers()) {

      let composerViewController = TWTRComposerViewController(initialText: text, image: image, videoURL: nil)
      completion(composerViewController)
      return
    }

    TWTRTwitter.sharedInstance().logIn { session, error in

      guard session?.authToken != nil else {

        completion(self.errorTwitterViewController)
        return
      }

      let composerViewController = TWTRComposerViewController.init(initialText: text, image: image, videoURL: nil)
      completion(composerViewController)
    }
  }
}
