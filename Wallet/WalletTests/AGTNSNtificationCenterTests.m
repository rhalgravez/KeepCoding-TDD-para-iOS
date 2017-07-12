//
//  AGTNSNtificationCenterTests.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTFakeNotificationCenter.h"
#import "AGTWallet.h"

@interface AGTNSNtificationCenterTests : XCTestCase

@end

@implementation AGTNSNtificationCenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testThatSubscribesToMemoryWarning {
    AGTFakeNotificationCenter *fake = [AGTFakeNotificationCenter new];
    
    AGTWallet *fat = [AGTWallet new];
    
    [fat subscribeToMemoryWarning:(NSNotificationCenter*)fake];
    
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, fat, @"Fat object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
}

@end
