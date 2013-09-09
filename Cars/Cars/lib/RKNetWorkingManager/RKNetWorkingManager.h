//
//  RKNetWorkingManager.h
//  Lohas
//
//  Created by Evan on 13-8-15.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"

@protocol RKNetWorkingManagerDelegate;

@interface RKNetWorkingManager : NSObject {
    ASINetworkQueue *queue;
    ASINetworkQueue *singleQueue;
    ASINetworkQueue *remoteNotificationQueue;
    //NSOperationQueue *queue;
    
    id<RKNetWorkingManagerDelegate> delegate;
}

@property (nonatomic, retain) ASINetworkQueue *queue;
@property (nonatomic, retain) ASINetworkQueue *singleQueue;
@property (nonatomic, retain) ASINetworkQueue *remoteNotificationQueue;

@property (nonatomic, assign) id<RKNetWorkingManagerDelegate> delegate;

+ (RKNetWorkingManager *)sharedManager;

//ASIFormDataRequest
- (void)asiFormDataRequestWithUrlStr:(NSString *)urlStr
                      AndPostValue:(NSArray *)valueArray
                           PostKey:(NSArray *)postKeyArray
                        AndDataUrl:(NSArray *)fileArray
                           DataKey:(NSArray *)dataKeyArray;

- (void)asiFormDataRequestWithUrlStr:(NSString *)urlStr
                        AndPostValue:(NSArray *)valueArray
                             PostKey:(NSArray *)postKeyArray;

//ASIHttpRequest
- (void)asiHttpRequestWithUrlStr:(NSString *)urlStr
                        AndPostValue:(NSArray *)valueArray
                             PostKey:(NSArray *)postKeyArray
                          AndDataUrl:(NSArray *)fileArray
                             DataKey:(NSArray *)dataKeyArray;

@end

@protocol RKNetWorkingManagerDelegate <NSObject>

- (void)requestSuccWithData:(NSDictionary *)data;

- (void)requestFailedWithData:(NSString *)msgStr;

@end