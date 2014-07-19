//
//  SGReceitasTableViewController.h
//  LivrodeReceitas
//
//  Created by Shinigami on 18/07/14.
//  Copyright (c) 2014 Shinigami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGViewController.h"

@interface SGReceitasTableViewController : UITableViewController <SGViewControllerDelegate>

@property (nonatomic) NSMutableArray *receitas;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *editarButton;

- (IBAction)editar:(id)sender;

@end
