//
//  AGTEuro.h
//  Wallet
//
//  Created by Roberto Halgravez on 7/7/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTMoney.h"

@interface AGTEuro : AGTMoney

-(AGTEuro *)times:(NSInteger)multiplier;

@end
