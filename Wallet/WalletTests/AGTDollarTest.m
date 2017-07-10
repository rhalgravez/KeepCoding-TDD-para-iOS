//
//  AGTDollarTest.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AGTDollarTest : XCTestCase

@end

@implementation AGTDollarTest

-(void)testMultiplication {
    AGTDollar *five = [[AGTDollar alloc] initWithAmount:5];
    AGTDollar *ten = [[AGTDollar alloc] initWithAmount:10];
    
    AGTDollar *total = [five times:2];
    
    XCTAssertEqualObjects(totla, ten, @"$5*2 = $10");
}

@end
