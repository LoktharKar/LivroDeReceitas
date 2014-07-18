//
//  SGViewController.m
//  LivrodeReceitas
//
//  Created by Shinigami on 17/07/14.
//  Copyright (c) 2014 Shinigami. All rights reserved.
//

#import "SGViewController.h"
#import "SGReceitas.h"

@interface SGViewController ()

@end

@implementation SGViewController

@synthesize tituloBox;
@synthesize categoriaBox;
@synthesize tempoBox;
@synthesize porcoesBox;
@synthesize avaliacaoBox;
@synthesize ingredientesBox;
@synthesize procedimentoBox;

@synthesize favoritoButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSData *receitaData = [[NSUserDefaults standardUserDefaults] objectForKey:@"receitaKeyobject"];
    
    SGReceitas *receita;
    if(receitaData){
        receita = [NSKeyedUnarchiver unarchiveObjectWithData:receitaData];
        
        self.tituloBox.text = receita.titulo;
        self.categoriaBox.text = receita.categoria;
        self.tempoBox.text = [receita.tempoDePreparacao stringValue];
        self.avaliacaoBox.text = [receita.avaliacao stringValue];
        self.porcoesBox.text = [receita.porcoes stringValue];
        self.favoritoButton.on = receita.favorito;
        self.ingredientesBox.text = receita.ingrediente;
        self.procedimentoBox.text = receita.procedimento;
    }
    
	// Do any additional setup after loading the view, typically from a nib.
}


// Metodo que corre imediatamente antes da view aparecer
- (void)viewWillAppear:(BOOL)animated{
    
}

// Metodo que corre imediatamente depois da view aparecer
- (void)viewDidAppear:(BOOL)animated{
    
}

// Metodo que corre imediatamente antes da view desaparecer
- (void)viewWillDisappear:(BOOL)animated{
    
}

// Metodo que corre imediatamente depois da view desaparecer
- (void)viewDidDisappear:(BOOL)animated{
    
}


// Metodo para o caso de termos avisos de memoria
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Metodo para gravar a nova receita
- (IBAction)adicionarReceita:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Livro de Receitas" message:@"Deseja adicionar a receita à sua biblioteca?"
        delegate:self
        cancelButtonTitle:@"Cancelar"
        otherButtonTitles:nil];
    [alert addButtonWithTitle:@"Sim"];
    [alert show];
    
    SGReceitas *receita = [[SGReceitas alloc] init];
    
    receita.titulo = self.tituloBox.text;
    receita.categoria = self.categoriaBox.text;
    receita.porcoes = [NSNumber numberWithInteger: [self.porcoesBox.text integerValue]];
    receita.avaliacao = [NSNumber numberWithInteger: [self.avaliacaoBox.text integerValue]];
    receita.tempoDePreparacao = [NSNumber numberWithInteger:[self.tempoBox.text integerValue]];
    receita.ingrediente = self.ingredientesBox.text;
    receita.procedimento = self.procedimentoBox.text;
    // falta adicionar a imagem à gravacao....
    receita.favorito = self.favoritoButton.on;
    
    NSData *receitasData = [NSKeyedArchiver archivedDataWithRootObject:receita];
    [[NSUserDefaults standardUserDefaults] setObject:receitasData forKey:@"receitaKeyobject"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

// Metodo para adicionar uma imagem à receita
- (IBAction)adicionarImagem:(id)sender {
    // codigo para adicionar imagem e guarda-la
}

@end
