//
//  AGTBrokerTests.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTMoney.h"
#import "AGTBroker.h"

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
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be NOP");
}

-(void)testReduction {
    AGTMoney *dollars = [AGTMoney dollarWithAmount:10];
    AGTMoney *euros = [AGTMoney euroWithAmount:5];
    
    AGTBroker * broker = [AGTBroker new];
    [broker addRate:2 fromCurrency:@"USD" toCurrency:@"EUR"];
    
    AGTMoney *converted = [broker reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"$10 == €5 2:1");
}

@end
