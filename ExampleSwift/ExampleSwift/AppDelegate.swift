//
//  Created by Performante on 07/03/16.
//  Copyright © 2016 Performante. All rights reserved.
//

import UIKit
import PerformanteSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let performanteSDK = PFSDK.new(withProductId: "Example-Swift", apiKey:"58dbb0ee-3c5d-4d7d-a3ac-2df4559cb00c")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configurePerformanteSDK()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController(performanteSDK: performanteSDK!)
        window?.makeKeyAndVisible()
        return true
    }
    
    func configurePerformanteSDK() {
        performanteSDK?.setExistingUser(false)
        performanteSDK?.sendAppStarted()
    }

}
