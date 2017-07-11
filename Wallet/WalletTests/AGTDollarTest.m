//
//  AGTDollarTest.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTDollar.h"
#import "AGTMoney.h"


@interface AGTDollarTest : XCTestCase

@end

@implementation AGTDollarTest

-(void)testMultiplication {
    AGTDollar *five = [AGTMoney dollarWithAmount:5];
    AGTDollar *ten = [AGTMoney dollarWithAmount:10];
    
    AGTDollar *total = [five times:2];
    
    XCTAssertEqualObjects(total, ten, @"$5*2 = $10");
}

-(void)testEquality {
    AGTDollar *five = [AGTMoney dollarWithAmount:5];
    AGTDollar *total = [five times:3];
    
    XCTAssertEqualObjects(total,
                          [AGTMoney dollarWithAmount:15],
                          @"Equivalent objects should be equal");
    
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
}

-(void)testHash {
    AGTDollar *objectA = [AGTMoney dollarWithAmount:2];
    AGTDollar *objectB = [AGTMoney dollarWithAmount:2];
    
    XCTAssertEqual([objectA hash], [objectB hash], @"Equal objects must have same hash");
}

-(void)testAmountStorage {
    AGTDollar *dollar = [AGTMoney dollarWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)] intValue], @"The value retrieved should be the smae as the stored");
    //La property amount no está visible en AGTDollar, ni en AGTMoney, tenemos que buscar una solucíón
#pragma clang diagnostic pop
}

@end
