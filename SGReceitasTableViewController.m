//
//  SGReceitasTableViewController.m
//  LivrodeReceitas
//
//  Created by Shinigami on 18/07/14.
//  Copyright (c) 2014 Shinigami. All rights reserved.
//

#import "SGReceitasTableViewController.h"
#import "SGViewController.h"
#import "SGReceitas.h"

@interface SGReceitasTableViewController ()

@end

@implementation SGReceitasTableViewController

@synthesize receitas;
@synthesize editarButton;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // para definir os atributos da letra do Navigation Bar
    NSDictionary *atributosTexto = [[NSDictionary alloc] initWithObjectsAndKeys:
                                    [UIColor whiteColor], NSForegroundColorAttributeName,
                                    [UIFont fontWithName:@"Gill Sans" size: 22.0f], NSFontAttributeName, nil];
    
    // atribuição dos valores definidos anteriormente
    self.navigationController.navigationBar.titleTextAttributes = atributosTexto;
    
    // definição do botão back
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Voltar" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    [self loadArrayFromUD];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Metodo usado quado é despoletada uma segue (adicionar)
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    SGViewController *details = segue.destinationViewController;
    
    details.delegate = self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [receitas count];
}

// Metodo para adicionar a receita ao array com as receitas ja guardadas
-(void) addReceita:(SGReceitas *)receita{
    [receitas addObject:receita];
    [self saveArrayInUD];
}

// Metodo para ler as receitas guardadas em memoria (UserDefaults)
-(void) loadArrayFromUD{
    receitas =  [[NSMutableArray alloc] init];
    NSData *receitasData = [[NSUserDefaults standardUserDefaults] objectForKey:@"SGreceitas"];
    
    if(receitasData){
        receitas = [NSKeyedUnarchiver unarchiveObjectWithData:receitasData];
    }
    
    if(!receitas){
        receitas = [[NSMutableArray alloc] init];
    }
}

// Metodo para guardar o array com as receitas na memoria (UserDefaults)
- (void) saveArrayInUD{
    NSData * receitasData = [NSKeyedArchiver archivedDataWithRootObject:receitas];
    [[NSUserDefaults standardUserDefaults] setObject:receitasData forKey:@"SGreceitas"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = @"ReceitasCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    SGReceitas *receita = [receitas objectAtIndex:indexPath.row];
    
    cell.textLabel.text = receita.titulo;
    
    if(receita.favorito){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
    return cell;
}

// Metodo para quando se clica numa segue que corresponde a um item já presente na memoria, mostrando assim os detalhes desse item
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SGReceitas *receita = [receitas objectAtIndex:indexPath.row];
    SGViewController *details = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewDetailsController"];
    
    details.receitas = receita;
    details.delegate = self;
    
    [self.navigationController pushViewController:details animated:YES];
}

- (IBAction)editar:(id)sender {
    if(![self.tableView isEditing]){
        editarButton.title = @"Terminar";
        [self.tableView setEditing:YES animated:YES];
    }else{
        editarButton.title = @"Editar";
        [self.tableView setEditing:NO animated:YES];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Metodo usado para remover itens da tableview e do UserDefaults
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // para remover do nosso array
        [receitas removeObjectAtIndex:indexPath.row];
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    // fazer o refresh à lista e guardar o array alterado
    [tableView reloadData];
    [self saveArrayInUD];
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
