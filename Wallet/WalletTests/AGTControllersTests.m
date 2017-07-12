//
//  AGTControllersTests.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTSimpleViewController.h"

@interface AGTControllersTests : XCTestCase

@property (nonatomic, strong) AGTSimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;

@end

@implementation AGTControllersTests

- (void)setUp {
    [super setUp];
    // Creamos el entorno de laboratorio
    self.simpleVC = [[AGTSimpleViewController alloc] initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;//asignar la etiqueta self.label para que displayText: pueda cambiarla
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

-(void)testThatTextOnLabelIsEqualToTextButton {
    
    //mandamos el mensaje
    [self.simpleVC displayText:self.button];
    //comprobamso que etiqueta y botón tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same text");
}

@end
