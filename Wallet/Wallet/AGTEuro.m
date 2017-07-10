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

-(instancetype)initWithAmount:(NSInteger)amount {
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

-(AGTEuro *)times:(NSInteger)multiplier {
    //Cambiamos la manera de multiplicar para que times: no mute(modifique) al objeto que ya teníamos
    //lo ideal es que sea inmutable como los objetos en cocoa (ejemplo NSstring que al concatenar un string te regresa un nuevo NSString)
    AGTEuro *newEuro = [[AGTEuro alloc] initWithAmount: self.amount * multiplier ];
    
    return newEuro;
}

#pragma mark - Overwriten
//Siempre procurar implementar de la manera más sencilla posible
-(BOOL)isEqual:(id)object {
    return  [self amount] == [object amount];
    //Con esto pasa el text, pero no la mejor implementación porque:
    //Qué pasa si el object es de otro tipo (ejemplo NSString)?
    //Qué pasa si pasan nil como parámetro?
    //estos dos casos deben agreagarse como "To Do" pero por ahora lo que nos importa
    //es pasar el test
}

@end
