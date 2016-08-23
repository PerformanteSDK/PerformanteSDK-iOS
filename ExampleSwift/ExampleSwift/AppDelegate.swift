//
//  Created by Performante on 07/03/16.
//  Copyright © 2016 Performante. All rights reserved.
//

import UIKit
import PerformanteSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let performanteSDK = PFSDK.newWithProductId("Example-Swift", apiKey:"58dbb0ee-3c5d-4d7d-a3ac-2df4559cb00c")

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        configurePerformanteSDK()
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = ViewController(performanteSDK: performanteSDK)
        window?.makeKeyAndVisible()
        return true
    }
    
    func configurePerformanteSDK() {
        performanteSDK.setExistingUser(false)
        performanteSDK.sendAppStarted()
    }

}
