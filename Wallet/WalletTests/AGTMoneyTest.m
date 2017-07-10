//
//  AGTMoneyTest.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTMoney.h"

@interface AGTMoneyTest : XCTestCase

@end

@implementation AGTMoneyTest

-(void)testThatTimeRaisesException {
    AGTMoney *money = [[AGTMoney alloc] initWithAmount:1];
    
    XCTAssertThrows([money times:2], @"should raise an exception");
}

@end
