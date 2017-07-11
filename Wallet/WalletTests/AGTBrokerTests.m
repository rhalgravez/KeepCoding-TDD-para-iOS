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

@property(nonatomic, strong) AGTBroker *emptyBroker;
@property(nonatomic, strong) AGTMoney *oneDollar;
@end

@implementation AGTBrokerTests

- (void)setUp {
    [super setUp];
    
    self.emptyBroker = [AGTBroker new];
    self.oneDollar = [AGTMoney dollarWithAmount:1];
}

- (void)tearDown {
    
    [super tearDown];
    
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

-(void)testSimpleReduction {

    AGTMoney *sum = [[AGTMoney dollarWithAmount:5] plus:[AGTMoney dollarWithAmount:5]];
    
    //Convirtiendo dólares en dólares, pude haber hecho euros a euros
    AGTMoney *reduced = [self.emptyBroker reduce:sum toCurrency:@"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be NOP");
}

-(void)testReduction {
    AGTMoney *dollars = [AGTMoney dollarWithAmount:10];
    AGTMoney *euros = [AGTMoney euroWithAmount:5];
    
    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    AGTMoney *converted = [self.emptyBroker reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"$10 == €5 2:1");
}

-(void)testThatNoRateRaisesException {
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rate should cause exception");
}

-(void)testThatNilConversionDoesNotChangeMoney {
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"],
                          @"A nil conversion should have no effect");
}
@end
