//
//  AGTEuroTests.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/7/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTEuro.h"

@interface AGTEuroTests : XCTestCase

@end

@implementation AGTEuroTests

-(void)testMultiplication {
    AGTEuro *euro = [[AGTEuro alloc] initWithAmount:5];
    AGTEuro *total = [euro times:2];
    
    XCTAssertEqual(total.amount, 10, @"5*2 should be 10");
}

@end