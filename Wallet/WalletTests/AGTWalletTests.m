//
//  AGTWalletTests.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTMoney.h"
#import "AGTBroker.h"

@interface AGTWalletTests : XCTestCase

@end

@implementation AGTWalletTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//€40 + $20 = $100 2:1
-(void)testAdditionWithReduction {
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus: [AGTMoney dollarWithAmount:20]];
    
    AGTBroker *broker = [AGTBroker new];
    [broker addRate:2 fromCurrency:@"USD" toCurrency:@"EUR"];
    
    AGTMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [AGTMoney dollarWithAmount:10], @"€40 + $20 = $100 2:1");
}

@end
