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

-(void)testCurrencies {
    XCTAssertEqualObjects(@"EUR", [[AGTMoney euroWithAmount:1] currency],
                          @"The currency of euros should be EUR");
    
    XCTAssertEqualObjects(@"USD", [[AGTMoney dollarWithAmount:1] currency],
                          @"The currency of dollars should be USD");
}


@end
