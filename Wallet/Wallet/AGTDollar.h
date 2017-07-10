//
//  AGTDollar.h
//  Wallet
//
//  Created by Roberto Halgravez on 7/10/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTDollar : NSObject

-(instancetype)initWithAmount:(NSInteger)amount;

-(AGTDollar *)times:(NSInteger)multiplier;

@end
