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

-(void)testHash {
    AGTDollar *objectA = [[AGTDollar alloc] initWithAmount:2];
    AGTDollar *objectB = [[AGTDollar alloc] initWithAmount:2];
    
    XCTAssertEqual([objectA hash], [objectB hash], @"Equal objects must have same hash");
}

-(void)testAmountStorage {
    AGTDollar *dollar = [[AGTDollar alloc] initWithAmount:2];
    
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)] intValue], @"The value retrieved should be the smae as the stored");
    //La property amount no está visible en AGTDollar, ni en AGTMoney, tenemos que buscar una solucíón
}

@end
