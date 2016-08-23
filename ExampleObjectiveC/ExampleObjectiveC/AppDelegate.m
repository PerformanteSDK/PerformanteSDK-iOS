//
//  Created by Performante on 07/03/16.
//  Copyright © 2016 Performante. All rights reserved.
//

#import "AppDelegate.h"
#import <PerformanteSDK/PerformanteSDK.h>
#import "ViewController.h"

@interface AppDelegate()

@property (nonatomic, strong) PFSDK *performanteSDK;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self configurePerformanteSDK];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[ViewController alloc] initWithPerformanteSDK:self.performanteSDK];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)configurePerformanteSDK
{
    self.performanteSDK = [PFSDK newWithProductId:@"Example-Objective-C" apiKey:@"d0c03826-a284-464a-bea0-cabe8b6fa9cb"];
    [self.performanteSDK setExistingUser:NO];
    [self.performanteSDK sendAppStarted];
}

@end
