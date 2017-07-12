//
//  AGTWalletTableViewController.h
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGTWallet;

@interface AGTWalletTableViewController : UITableViewController

-(instancetype)initWithModel:(AGTWallet *)model;

@end
