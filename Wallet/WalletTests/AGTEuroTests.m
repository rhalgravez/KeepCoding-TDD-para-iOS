//
//  AGTEuroTests.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/7/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AGTEuroTests : XCTestCase

@end

@implementation AGTEuroTests

-(void)testMultiplication {
    AGTEuro *euro = [[AGTEuro alloc] initWithAmount:5];
    [euro times:2];
    
    XCTAssertEqual(euro.amount, 10, @"5*2 should be 10"); 
}

@end
