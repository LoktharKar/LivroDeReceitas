//
//  SGReceitas.m
//  LivrodeReceitas
//
//  Created by Shinigami on 18/07/14.
//  Copyright (c) 2014 Shinigami. All rights reserved.
//

#import "SGReceitas.h"

@implementation SGReceitas

@synthesize titulo;
@synthesize categoria;
@synthesize porcoes;
@synthesize avaliacao;
@synthesize tempoDePreparacao;
@synthesize ingrediente;
@synthesize procedimento;
@synthesize image;
@synthesize favorito;

static NSString *tituloKey = @"SGRtituloKey";
static NSString *categoriaKey = @"SGRcategoriaKey";
static NSString *porcoesKey = @"SGRporcoesKey";
static NSString *avaliacaoKey = @"SGRavaliacaoKey";
static NSString *tempoDePreparacaoKey = @"SGRtempoDePreparacaoKey";
static NSString *ingredienteKey = @"SGRingredienteKey";
static NSString *procedimentoKey = @"SGRprocedimentoKey";
static NSString *imageKey = @"SGRimageKey";
static NSString *favoritoKey = @"SGRfavoritoKey";

// Metodo init
- (id) init{
    self = [super init];
    
    if(self){
        self.favorito = NO;
    }
    
    return self;
}


// Metodo de inicialização da instância com base na informação armazenada
- (id) initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    
    self.titulo = [aDecoder decodeObjectForKey:tituloKey];
    self.categoria = [aDecoder decodeObjectForKey:categoriaKey];
    self.porcoes = [aDecoder decodeObjectForKey:porcoesKey];
    self.avaliacao = [aDecoder decodeObjectForKey:avaliacaoKey];
    self.tempoDePreparacao = [aDecoder decodeObjectForKey:tempoDePreparacaoKey];
    self.ingrediente = [aDecoder decodeObjectForKey:ingredienteKey];
    self.procedimento = [aDecoder decodeObjectForKey:procedimentoKey];
    self.image = [aDecoder decodeObjectForKey:imageKey];
    self.favorito = [[aDecoder decodeObjectForKey:favoritoKey] boolValue];
    
    return self;
}

// Metodo para codificar e guardar a nova informação
- (void) encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.titulo forKey:tituloKey];
    [aCoder encodeObject:self.categoria forKey:categoriaKey];
    [aCoder encodeObject:self.porcoes forKey:porcoesKey];
    [aCoder encodeObject:self.avaliacao forKey:avaliacaoKey];
    [aCoder encodeObject:self.tempoDePreparacao forKey:tempoDePreparacaoKey];
    [aCoder encodeObject:self.ingrediente forKey:ingredienteKey];
    [aCoder encodeObject:self.procedimento forKey:procedimentoKey];
    [aCoder encodeObject:self.image forKey:imageKey];
    [aCoder encodeObject:[NSNumber numberWithBool:self.favorito] forKey:favoritoKey];
}

@end
