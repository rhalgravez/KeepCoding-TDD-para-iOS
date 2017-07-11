//
//  AGTBrokerTests.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTMoney.h"

@interface AGTBrokerTests : XCTestCase

@end

@implementation AGTBrokerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testSimpleReduction {
    AGTBroker *broker = [[AGTBroker alloc] init];
    AGTMoney *sum = [[AGTMoney dollarWithAmount:5] plus:[AGTMoney dollarWithAmount:5]];
    
    //Convirtiendo dólares en dólares, pude haber hecho euros a euros
    AGTMoney *reduced = [broker reduce:sum toCurrency:@"USD"];
    
    XCTAssertNotEqualObjects(sum, reduced, @"Conversion to same currency should be NOP");
}

@end
