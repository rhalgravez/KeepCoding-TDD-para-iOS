//
//  AGTWallet.h
//  Wallet
//
//  Created by Roberto Halgravez on 7/11/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTWallet.h"
#import "AGTMoney.h"

@interface AGTWallet : NSObject <AGTMoney>

@property (nonatomic, readonly) NSUInteger count;

-(void)subscribeToMemoryWarning:(NSNotificationCenter *)nc;

@end
