//
//  AGTControllersTests.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTSimpleViewController.h"
#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"

@interface AGTControllersTests : XCTestCase

@property (nonatomic, strong) AGTSimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) AGTWalletTableViewController *walletVC;
@property (nonatomic, strong) AGTWallet *wallet;

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
    
    self.wallet = [[AGTWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[AGTMoney euroWithAmount:1]];
    self.walletVC = [[AGTWalletTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
    
    self.walletVC = nil;
    self.wallet = nil;
}

-(void)testThatTextOnLabelIsEqualToTextButton {
    
    //mandamos el mensaje
    [self.simpleVC displayText:self.button];
    //comprobamso que etiqueta y botón tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same text");
}

-(void)testThatTableHasOneSection {
    NSUInteger section = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(section, 1, @"There can only be one");
    
}

-(void) testThatNumberOfCellsIsNumberOfMoneysPlusOne {
    XCTAssertEqual(self.wallet.count + 1, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of cells is the number of moneys plus 1 (the total)");
}

@end
