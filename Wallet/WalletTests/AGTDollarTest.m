//
//  AGTDollarTest.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTDollar.h"

@interface AGTDollarTest : XCTestCase

@end

@implementation AGTDollarTest

-(void)testMultiplication {
    AGTDollar *five = [[AGTDollar alloc] initWithAmount:5];
    AGTDollar *ten = [[AGTDollar alloc] initWithAmount:10];
    
    AGTDollar *total = [five times:2];
    
    XCTAssertEqualObjects(total, ten, @"$5*2 = $10");
}

-(void)testEquality {
    AGTDollar *five = [[AGTDollar alloc] initWithAmount:5];
    AGTDollar *total = [five times:3];
    
    XCTAssertEqualObjects(total,
                          [[AGTDollar alloc] initWithAmount:15],
                          @"Equivalent objects should be equal");
    
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
}

@end
