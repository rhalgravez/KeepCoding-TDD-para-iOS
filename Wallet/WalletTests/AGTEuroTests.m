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

//Ahora que modifiqué el modelo para ser inmutable debo tener la capacidad de hacer comparaciones
//entre obetos, por eso creamos el test de igualdad
-(void)testEquality {
    //Buena práctica: Creamos dos objetos que representan la misma cantidad pero creados de forma distinta
    AGTEuro *five = [[AGTEuro alloc] initWithAmount:5];
    AGTEuro *ten = [[AGTEuro alloc] initWithAmount:10];
    
    AGTEuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent object should be equal");
}

@end
