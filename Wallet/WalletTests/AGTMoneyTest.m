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

-(void)testMultiplication {
    AGTMoney *euro = [AGTMoney euroWithAmount:5];
    AGTMoney *total = [euro times:2];
    
    XCTAssertEqualObjects(total,
                          [AGTMoney euroWithAmount:10],
                          @"5*2 should be 10");
    
    AGTMoney *dollar = [AGTMoney dollarWithAmount:3];
    AGTMoney *totalDollar = [dollar times:2];
    
    XCTAssertEqualObjects(totalDollar,
                          [AGTMoney dollarWithAmount:6],
                          @"5*2 should be 10");
    
}

//Ahora que modifiqué el modelo para ser inmutable debo tener la capacidad de hacer comparaciones
//entre obetos, por eso creamos el test de igualdad
-(void)testEquality {
    //Buena práctica: Creamos dos objetos que representan la misma cantidad pero creados de forma distinta
    AGTMoney *five = [AGTMoney euroWithAmount:5];
    AGTMoney *ten = [AGTMoney euroWithAmount:10];
    
    AGTMoney *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent object should be equal");
    
    XCTAssertEqualObjects([AGTMoney dollarWithAmount:4],
                          [AGTMoney dollarWithAmount:4],
                          @"Equivalent object should be equal");
}

//Agregamos el testHash ya que como buena práctica al sobrescribir isEqual: también tenemos que sobrescribir hash
-(void)testHash {
    AGTMoney *objectA = [AGTMoney euroWithAmount:2];
    AGTMoney *objectB = [AGTMoney euroWithAmount:2];
    
    XCTAssertEqual([objectA hash], [objectB hash], @"Equal objects must have same hash");
    
    XCTAssertEqual([[AGTMoney dollarWithAmount:1] hash],
                          [[AGTMoney dollarWithAmount:1] hash],
                          @"Equal objects must have same hash");
}

-(void)testAmountStorage {
    AGTMoney *euro = [AGTMoney euroWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)] intValue], @"The value retrieved should be the smae as the stored");
    //La property amount no está visible en AGTDollar, ni en AGTMoney, tenemos que buscar una solucíón
    
    XCTAssertEqual(2, [[[AGTMoney dollarWithAmount:2] performSelector:@selector(amount)] intValue], @"The value retrieved should be the smae as the stored");
#pragma clang diagnostic pop
}

-(void)testDifferentCurrencies {
    AGTMoney *euro = [AGTMoney euroWithAmount:1];
    AGTMoney *dollar = [AGTMoney dollarWithAmount:1];
    
    XCTAssertNotEqualObjects(euro, dollar, @"Different currencies should not be equal");
}

-(void)testSimpleAdition {
    AGTMoney *sum = [[AGTMoney dollarWithAmount:5] plus:
                     [AGTMoney dollarWithAmount:10]];
    
    XCTAssertEqualObjects(sum, [AGTMoney dollarWithAmount:15],
                          @"$5 + $10 = $15");
}

-(void)testThatHashIsAmount {
    AGTMoney *one = [AGTMoney dollarWithAmount:1];
    
    XCTAssertEqual([one hash], 1, @"The hash must be the same as the amount");
}

@end
