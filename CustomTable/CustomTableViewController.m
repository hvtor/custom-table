//
//  CustomTableViewController.m
//  
//
//  Created by Hemant V. Torsekar on 2015-04-14.
//
//

#import "CustomTableViewController.h"

@interface CustomTableViewController ()

@end

@implementation CustomTableViewController {
    NSDictionary *recipe;
    NSMutableArray *recipeNames;
    NSMutableArray *recipePrepTime;
    NSMutableArray *recipeImages;
    BOOL recipeChecked[10];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    recipeNames = [[NSMutableArray alloc]initWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger",@"Ham and Egg Sandwich", @"Creme Brelee",@"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini",nil];
    
    recipePrepTime = [[NSMutableArray alloc]initWithObjects:@"20 min", @"45 min", @"30 min", @"20 min", @"20 min", @"1 hr",@"1 hr", @"10 min", @"30 min", @"15 min",@"30 min", @"30 min", @"15 min", @"45 min", @"1 hr", @"30 min",nil];
    
    
    recipeImages = [[NSMutableArray alloc]initWithObjects:@"egg_benedict.jpg", @"mushroom_risotto.jpg", @"full_breakfast.jpg",@"hamburger.jpg", @"ham_and_egg_sandwich.jpg", @"creme_brelee.jpg", @"white_chocolate_donut.jpg", @"starbucks_coffee.jpg", @"vegetable_curry.jpg",@"instant_noodle_with_egg.jpg", @"noodle_with_bbq_pork.jpg",@"japanese_noodle_with_pork.jpg", @"green_tea.jpg", @"thai_shrimp_cake.jpg",@"angry_birds_cake.jpg", @"ham_and_cheese_panini.jpg",nil];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        return [recipeNames count];
    }
                    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
    {
        // Return the number of sections.
        return 1;
    }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    // Check for existence of cell, if not, allocation and initialization of style and setting reuse identifier
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    // Set recipe name and prep time for cell label text
    cell.nameLabel.text = [recipeNames objectAtIndex:indexPath.row];
    cell.prepTimeLabel.text = [recipePrepTime objectAtIndex:indexPath.row];
    
    // Check to see if recipeChecked array is Checked (YES) or IsNotChecked(NO)
    cell.accessoryType = recipeChecked[indexPath.row] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    // Array of images in array named recipeImages
    cell.thumbnailImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    recipeChecked[indexPath.row] = YES;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSIndexPath *oldIndex = [self.tableView indexPathForSelectedRow];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:oldIndex];
    recipeChecked[oldIndex.row] = NO;
    cell.accessoryType = UITableViewCellAccessoryNone;
    [self.tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    return indexPath;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:
(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *recipeName = [recipeNames objectAtIndex:indexPath.row];

    [recipeNames removeObjectAtIndex:indexPath.row];
    [recipePrepTime removeObjectAtIndex:indexPath.row];
    [recipeImages removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
    
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
    
}


@end
