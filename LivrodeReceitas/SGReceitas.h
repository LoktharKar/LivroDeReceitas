//
//  SGReceitas.h
//  LivrodeReceitas
//
//  Created by Shinigami on 18/07/14.
//  Copyright (c) 2014 Shinigami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGReceitas : NSObject <NSCoding>

@property (nonatomic) NSString *titulo;
@property (nonatomic) NSString *categoria;
@property (nonatomic) NSNumber *porcoes;
@property (nonatomic) NSNumber *avaliacao;
@property (nonatomic) NSNumber *tempoDePreparacao;
@property (nonatomic) NSString *ingrediente;
@property (nonatomic) NSString *procedimento;
@property (nonatomic) NSString *image;
@property (nonatomic) BOOL favorito;

- (id)init;

@end
