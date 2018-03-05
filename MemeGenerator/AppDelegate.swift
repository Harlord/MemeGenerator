//
//  AppDelegate.swift
//  MemeGenerator
//
//  Created by Harold Hernandez on 3/3/18.
//  Copyright © 2018 Harold Hernandez. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKCoreKit
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder{

  var window: UIWindow?
}

extension AppDelegate: UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    TWTRTwitter.sharedInstance().start(
      withConsumerKey: "X0smr4KztKGfL3pB2jQ2ZPhHQ",
      consumerSecret: "2bgNH4NVeJXxkboMLLddjPLYfc4ebfT7K0DexHGvts5Mps7om7"
    )

    return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {

    let intendedForTitterSDK = TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    let intendedForFacebookSDK = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)

    return intendedForFacebookSDK || intendedForTitterSDK
  }
}

