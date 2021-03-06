//
//  SGViewController.h
//  LivrodeReceitas
//
//  Created by Shinigami on 17/07/14.
//  Copyright (c) 2014 Shinigami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGReceitas.h"

@protocol SGViewControllerDelegate

-(void) addReceita: (SGReceitas*) receita;

@end


@interface SGViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *tituloBox;
@property (weak, nonatomic) IBOutlet UITextField *categoriaBox;
@property (weak, nonatomic) IBOutlet UITextField *tempoBox;
@property (weak, nonatomic) IBOutlet UITextField *porcoesBox;
@property (weak, nonatomic) IBOutlet UITextField *avaliacaoBox;
@property (weak, nonatomic) IBOutlet UITextView *ingredientesBox;
@property (weak, nonatomic) IBOutlet UITextView *procedimentoBox;

@property (weak, nonatomic) IBOutlet UISwitch *favoritoButton;

@property (nonatomic) SGReceitas *receitas;

@property (nonatomic) id delegate;

- (IBAction)adicionarImagem:(id)sender;
- (IBAction)adicionarReceita:(id)sender;

@end
