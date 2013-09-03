//
//  RKNetWorkingManager.m
//  Lohas
//
//  Created by Evan on 13-8-15.
//  Copyright (c) 2013年 Evan. All rights reserved.
//

#import "RKNetWorkingManager.h"
#import "SBJson.h"
#import "Common.h"

#define NETWORK_QUEUE_CURRENT_OPERATION 1

@implementation RKNetWorkingManager

@synthesize queue;
@synthesize singleQueue;

@synthesize homeDelegate, registerDelegate, loginDelegate, msgDelegate, faqDelegate;

#pragma - singleton

static RKNetWorkingManager *_networkRequestManager;

+(RKNetWorkingManager *)sharedManager {
    @synchronized(self){
        if (_networkRequestManager == nil) {
            _networkRequestManager = [[self alloc]init];
        }
    }
    return _networkRequestManager;
}

#pragma mark - NetWorkingRequest
-(void)homeDataRequest {
    [Common cancelAllRequestOfAllQueue];
    [self checkQueue];
    
    NSURL *url =[NSURL URLWithString:homeUrl];
    ASIFormDataRequest *request =[ASIFormDataRequest requestWithURL:url];
    
    request.delegate =self;
    request.didFinishSelector =@selector(homeDataRequestFinish:);
    request.didFailSelector =@selector(commonRequestQueryDataFailed:);
    request.timeOutSeconds =10.0;
    
    [queue addOperation:request];
}

-(void)homeDataRequestFinish:(ASIHTTPRequest *)request {
    NSDictionary *data =[[request responseString] JSONValue];
//    NSLog(@"%@", data);
    if ([[data objectForKey:@"status"]isEqualToString:@"0"]) {
        [homeDelegate homeImageViewData:[data objectForKey:@"data"]];
    }else  {
        [Common showNetWorokingAlertWithMessage:[data objectForKey:@"msg"]];
    }
}

-(void)getVerifyRequest:(NSString *)cellphone {
    [Common cancelAllRequestOfAllQueue];
    [self checkQueue];
    
    NSURL *url =[NSURL URLWithString:verifyUrl];
    ASIFormDataRequest *request =[ASIFormDataRequest requestWithURL:url];
    
    [request addPostValue:cellphone forKey:@"telephone"];
    
    request.delegate =self;
    request.didFinishSelector =@selector(verifyDataRequestFinish:);
    request.didFailSelector =@selector(commonRequestQueryDataFailed:);
    request.timeOutSeconds =10.0;
    
    [queue addOperation:request];
}

-(void)verifyDataRequestFinish:(ASIHTTPRequest *)request {
    NSDictionary *data =[[request responseString] JSONValue];
//    NSLog(@"%@", data);
    if ([[data objectForKey:@"status"]isEqualToString:@"0"]) {
    }else  {
        [Common showNetWorokingAlertWithMessage:[data objectForKey:@"msg"]];
    }
}

//register request
-(void)registerRequestWithAccount:(NSString *)accountStr Pwd:(NSString *)pwdStr comfirmPwd:(NSString *)confirmPwdStr Verify:(NSString *)verifyStr {
    [Common cancelAllRequestOfAllQueue];
    [self checkQueue];
    
    NSURL *url =[NSURL URLWithString:registerUrl];
    ASIFormDataRequest *request =[ASIFormDataRequest requestWithURL:url];
    
    [request addPostValue:accountStr forKey:@"account"];
    [request addPostValue:pwdStr forKey:@"password"];
    [request addPostValue:confirmPwdStr forKey:@"password_confirm"];
    [request addPostValue:verifyStr forKey:@"verify"];
    
    request.delegate =self;
    request.didFinishSelector =@selector(registerRequestFinish:);
    request.didFailSelector =@selector(commonRequestQueryDataFailed:);
    request.timeOutSeconds =10.0;
    
    [queue addOperation:request];
}

-(void)registerRequestFinish:(ASIHTTPRequest *)request {
    NSDictionary *data =[[request responseString] JSONValue];
//    NSLog(@"%@", data);
    if ([[data objectForKey:@"status"]isEqualToString:@"0"]) {
        [registerDelegate RegisterSucc];
    }else  {
        [Common showNetWorokingAlertWithMessage:[data objectForKey:@"msg"]];
    }
}

//login request
-(void)loginRequestWithAccount:(NSString *)accountStr Pwd:(NSString *)pwdStr {
    [Common cancelAllRequestOfAllQueue];
    [self checkQueue];
    
    NSURL *url =[NSURL URLWithString:loginUrl];
    ASIFormDataRequest *request =[ASIFormDataRequest requestWithURL:url];
    
    [request addPostValue:accountStr forKey:@"account"];
    [request addPostValue:pwdStr forKey:@"password"];
    
    request.delegate =self;
    request.didFinishSelector =@selector(loginRequestFinish:);
    request.didFailSelector =@selector(commonRequestQueryDataFailed:);
    request.timeOutSeconds =10.0;
    
    [queue addOperation:request];
}

-(void)loginRequestFinish:(ASIHTTPRequest *)request {
    NSDictionary *data =[[request responseString] JSONValue];
//    NSLog(@"%@", data);
    if ([[data objectForKey:@"status"]isEqualToString:@"0"]) {
        [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"IsLogined"];
        [[NSUserDefaults standardUserDefaults]setValue:[data objectForKey:@"data"] forKey:@"userInfo"];
        [loginDelegate loginSucc];
    }else  {
        [Common showNetWorokingAlertWithMessage:[data objectForKey:@"msg"]];
    }
}

//msg Request
-(void)getMsgData{
    [Common cancelAllRequestOfAllQueue];
    [self checkQueue];
    
    NSURL *url =[NSURL URLWithString:msgUrl];
    ASIFormDataRequest *request =[ASIFormDataRequest requestWithURL:url];
    
    [request addPostValue:[Common getKey] forKey:@"user_key"];
    
    request.delegate =self;
    request.didFinishSelector =@selector(getMsgDataFinish:);
    request.didFailSelector =@selector(commonRequestQueryDataFailed:);
    request.timeOutSeconds =10.0;
    
    [queue addOperation:request];
}

-(void)getMsgDataFinish:(ASIHTTPRequest *)request {
    NSDictionary *data =[[request responseString] JSONValue];
//    NSLog(@"%@", data);
    if ([[data objectForKey:@"status"]isEqualToString:@"0"]) {
        [msgDelegate msgSucc:[data objectForKey:@"data"]];
    }else  {
        [Common showNetWorokingAlertWithMessage:[data objectForKey:@"msg"]];
    }
}

- (void)faqRequest:(NSString *)faqStr {
    [Common cancelAllRequestOfAllQueue];
    [self checkQueue];
    
    NSURL *url =[NSURL URLWithString:faqUrl];
    ASIFormDataRequest *request =[ASIFormDataRequest requestWithURL:url];
    
    [request addPostValue:[Common getKey] forKey:@"user_key"];
    [request addPostValue:faqStr forKey:@"content"];
    
    request.delegate =self;
    request.didFinishSelector =@selector(faqRequestFinish:);
    request.didFailSelector =@selector(commonRequestQueryDataFailed:);
    request.timeOutSeconds =10.0;
    
    [queue addOperation:request];
}

-(void)faqRequestFinish:(ASIHTTPRequest *)request {
    NSDictionary *data =[[request responseString] JSONValue];
//    NSLog(@"%@", data);
    if ([[data objectForKey:@"status"]isEqualToString:@"0"]) {
        [faqDelegate faqSucc];
    }else  {
        [Common showNetWorokingAlertWithMessage:[data objectForKey:@"msg"]];
    }
}


#pragma mark - Common methods
-(void)checkQueue{
    if (!queue) {
        queue = [[ASINetworkQueue alloc]init];
        [queue setMaxConcurrentOperationCount:NETWORK_QUEUE_CURRENT_OPERATION];
        [queue setShouldCancelAllRequestsOnFailure:NO];
        
        [queue go];
    }
}



-(void)checkSingleQueue{
    if (!singleQueue) {
        singleQueue = [[ASINetworkQueue alloc]init];
        [singleQueue setMaxConcurrentOperationCount:NETWORK_QUEUE_CURRENT_OPERATION];
        [singleQueue setShouldCancelAllRequestsOnFailure:NO];
        [singleQueue go];
    }
}

-(void)checkRemoteNotificationQueue{
    if (!remoteNotificationQueue) {
        remoteNotificationQueue = [[ASINetworkQueue alloc] init];
        [remoteNotificationQueue setMaxConcurrentOperationCount:NETWORK_QUEUE_CURRENT_OPERATION];
        [remoteNotificationQueue setShouldCancelAllRequestsOnFailure:NO];
        [remoteNotificationQueue go];
    }
}

- (void)commonRequestQueryDataFailed:(ASIHTTPRequest *)request {
    //new code 11.30 ???
    //    NSString *where = [request.userInfo objectForKey:@"where"];
    //    if ([where isEqualToString:@"shanghai"] || [where isEqualToString:@"banner"] || [where isEqualToString:@"shSub"]) {
    //        if (!shouldShowAlertAtHome) {
    //            return;
    //        } else {
    //            shouldShowAlertAtHome = NO;
    //        }
    //    }
    //
    //    //old code...
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"联网失败，请检查网络"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ENDREFRASH" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"COMMITENABLE" object:nil];
    NSLog(@"query data error: %@", [request error]);
}

- (void)dealloc {
    if (queue) {
        [queue cancelAllOperations];
        [queue release];
    }
    
    if (remoteNotificationQueue) {
        [remoteNotificationQueue cancelAllOperations];
        [remoteNotificationQueue release];
    }
    
    if(singleQueue){
        [singleQueue cancelAllOperations];
        [singleQueue release];
    }
    
    [super dealloc];
}

#pragma mark - Common cancel

- (void)cancelAll{
    for (ASIHTTPRequest *request in [queue operations]) {
        [request cancel];
    }
}
@end