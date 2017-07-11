//
//  AGTEuro.m
//  Wallet
//
//  Created by Roberto Halgravez on 7/7/17.
//  Copyright © 2017 Roberto Halgravez. All rights reserved.
//

#import "AGTEuro.h"

@interface AGTEuro()

@property (nonatomic) NSInteger amount;

@end

@implementation AGTEuro

-(AGTEuro *)times:(NSInteger)multiplier {
    //Cambiamos la manera de multiplicar para que times: no mute(modifique) al objeto que ya teníamos
    //lo ideal es que sea inmutable como los objetos en cocoa (ejemplo NSstring que al concatenar un string te regresa un nuevo NSString)
    AGTEuro *newEuro = [[AGTEuro alloc] initWithAmount: self.amount * multiplier ];
    
    return newEuro;
}

@end
