//
//  AGTEuro.h
//  Wallet
//
//  Created by Roberto Halgravez on 7/7/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTEuro : NSObject

@property (nonatomic, readonly) NSInteger amount;

-(instancetype)initWithAmount:(NSInteger)amount;

-(AGTEuro *)times:(NSInteger)multiplier;

@end
