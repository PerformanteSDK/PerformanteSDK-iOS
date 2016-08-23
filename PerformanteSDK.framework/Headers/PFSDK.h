//
// Created by Performante on 08/03/16.
// Copyright (c) 2016 Performante. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PFAPIClientProtocol;
@protocol PFLogging;
@protocol PFPersistenceManagerProtocol;
@class PFDataPointsProvider;
@class PFDebugConfiguration;

@interface PFSDK : NSObject

/**
 *  This is the designated initializer. Initialize `PFSDK` object with product id and api key.
 *  Both parameters can not be nil.
 *
 *  @param productId provide product id of your application
 *  @param apiKey    provide application key for authorize your connection with backend
 *
 *  @return `PFSDK` object which handles all network operation
 */

+ (instancetype)newWithProductId:(NSString *)productId
                          apiKey:(NSString *)apiKey;

/**
 *  This method is for sending open/install event when app is started.
 *
 *  Call this method after application has been started.
 */

- (void)sendAppStarted;

/**
 *  This method is for sending app event with custom name.
 *
 *  @param appEventName provide your custom name of event
 *                      e.g. for opening screen `Landing.screen.opened`,
 *                               clicking button `Button.was.tapped`
 */

- (void)sendAppEvent:(NSString *)appEventName;

/**
 *  When you don't want track existing user this value must be configured before calling method `sendAppStarted`.
 *  Default value for this parameter is set to `NO`. When you set to `YES` user will not be tracked.
 *  Setup this value is optional.
 *
 *  @param existingUser boolean value for define `Pre-Existing Users`
 */

- (void)setExistingUser:(BOOL)existingUser;

/**
 *  Object `PFDebugConfiguration` has property `isEnableDebugMode`
 *  which allow you to show developer logs. 
 *  Default value for this property is set to `NO` so logs aren't visible.
 *  Remember to don't leave `YES` for this property in production version.
 *
 *  It is possible to set this property only in `Info.plist`.
 *  Add below code to your main plist file:
 
 <key>PerformanteSDK</key>
 <dict>
    <key>EnableDebugMode</key>
    <true/>
 </dict>
 
 *
 */

@property (nonatomic, strong, readonly) PFDebugConfiguration *debugConfiguration;

/**
 *  Don't use it! This initializer is used only for test case.
 *
 *  @param apiClient          is client for manage network layer
 *  @param dataPointsProvider provide data points from device
 *                            which is needed for recognize specific device
 *  @param logger             custom logger for debugging
 *
 *  @return `PFSDK` object which handles all network operation
 */

- (instancetype)initWithAPIClient:(id <PFAPIClientProtocol>)apiClient
               dataPointsProvider:(PFDataPointsProvider *)dataPointsProvider
                           logger:(id <PFLogging>)logger
               persistenceManager:(id <PFPersistenceManagerProtocol>)persistenceManager;

@end
