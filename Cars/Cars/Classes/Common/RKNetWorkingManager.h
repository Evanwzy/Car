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
#import "Constents.h"

@protocol RKNetWorkingManagerHomeDelegate;
@protocol RKNetWorkingManagerRegisterDelegate;
@protocol RKNetWorkingManagerLoginDelegate;
@protocol RKNetWorkingManagerMsgDelegate;
@protocol RKNetWorkingManagerFAQDelegate;

@interface RKNetWorkingManager : NSObject {
    ASINetworkQueue *queue;
    ASINetworkQueue *singleQueue;
    ASINetworkQueue *remoteNotificationQueue;
    //NSOperationQueue *queue;
    
    //NetWorkingRequestDelegate
    id<RKNetWorkingManagerHomeDelegate> homeDelegate;
    id<RKNetWorkingManagerRegisterDelegate> registerDelegate;
    id<RKNetWorkingManagerLoginDelegate> loginDelegate;
    id<RKNetWorkingManagerFAQDelegate> faqDelegate;
    id<RKNetWorkingManagerMsgDelegate> msgDelegate;
}

@property (nonatomic, retain) ASINetworkQueue *queue;
@property (nonatomic, retain) ASINetworkQueue *singleQueue;
@property (nonatomic, retain) ASINetworkQueue *remoteNotificationQueue;

@property (nonatomic, assign) id<RKNetWorkingManagerHomeDelegate> homeDelegate;
@property (nonatomic, assign) id<RKNetWorkingManagerRegisterDelegate> registerDelegate;
@property (nonatomic, assign) id<RKNetWorkingManagerLoginDelegate> loginDelegate;
@property (nonatomic, assign) id<RKNetWorkingManagerFAQDelegate> faqDelegate;
@property (nonatomic, assign) id<RKNetWorkingManagerMsgDelegate> msgDelegate;

+ (RKNetWorkingManager *)sharedManager;

//data Request
- (void)homeDataRequest;
- (void)getVerifyRequest:(NSString *)cellphone;
- (void)registerRequestWithAccount:(NSString *)accountStr Pwd:(NSString *)pwdStr comfirmPwd:(NSString *)confirmPwdStr Verify:(NSString *)verifyStr;
- (void)loginRequestWithAccount:(NSString *)accountStr Pwd:(NSString *)pwdStr;
- (void)getMsgData;
- (void)faqRequest:(NSString *)faqStr;

@end

@protocol RKNetWorkingManagerHomeDelegate <NSObject>

- (void)homeImageViewData:(NSArray *)array;

@end

@protocol RKNetWorkingManagerRegisterDelegate <NSObject>

- (void)RegisterSucc;

@end

@protocol RKNetWorkingManagerLoginDelegate <NSObject>

- (void)loginSucc;

@end

@protocol RKNetWorkingManagerFAQDelegate <NSObject>

- (void)faqSucc;

@end

@protocol RKNetWorkingManagerMsgDelegate <NSObject>

- (void)msgSucc:(NSArray *)dataArr;

@end
