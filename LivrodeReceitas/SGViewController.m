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
@synthesize receitas;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


// Metodo que corre imediatamente antes da view aparecer
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    // caso já exista dados para o item escolhido parecem nos campos apropriados
    if(receitas){
        self.tituloBox.text = receitas.titulo;
        self.categoriaBox.text = receitas.categoria;
        self.tempoBox.text = [receitas.tempoDePreparacao stringValue];
        self.avaliacaoBox.text = [receitas.avaliacao stringValue];
        self.porcoesBox.text = [receitas.porcoes stringValue];
        self.favoritoButton.on = receitas.favorito;
        self.ingredientesBox.text = receitas.ingrediente;
        self.procedimentoBox.text = receitas.procedimento;
        
        // para definir o titulo do navigator quando carregamos num item da lista
        self.navigationItem.title = receitas.titulo;
    }
}

// Metodo que corre imediatamente depois da view aparecer
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

// Metodo que corre imediatamente antes da view desaparecer
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

// Metodo que corre imediatamente depois da view desaparecer
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
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

    if([[self delegate] respondsToSelector:@selector(addReceita:)]){
        [[self delegate] addReceita:receita];
    }
    
}

// Metodo para adicionar uma imagem à receita
- (IBAction)adicionarImagem:(id)sender {
    // codigo para adicionar imagem e guarda-la
}

@end
