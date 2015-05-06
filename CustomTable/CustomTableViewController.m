//
//  CustomTableViewController.m
//  
//
//  Created by Hemant V. Torsekar on 2015-04-14.
//
//

#import "CustomTableViewController.h"
#import "Recipe.h"
@interface CustomTableViewController ()

@end

@implementation CustomTableViewController {
    NSMutableArray *_recipe;
    NSMutableArray *names;
    NSMutableArray *prepTime;
    NSMutableArray *images;
    BOOL recipeChecked[10];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Arrays of Recipe Names
    names = [[NSMutableArray alloc]initWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger",@"Ham and Egg Sandwich", @"Creme Brelee",@"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini",nil];
    
    //Arrays of Recipe Preparation Times
    prepTime = [[NSMutableArray alloc]initWithObjects:@"20 min", @"45 min", @"30 min", @"20 min", @"20 min", @"1 hr",@"1 hr", @"10 min", @"30 min", @"15 min",@"30 min", @"30 min", @"15 min", @"45 min", @"1 hr", @"30 min",nil];
    
    //Arrays of Recipe Images
    images = [[NSMutableArray alloc]initWithObjects:@"egg_benedict.jpg", @"mushroom_risotto.jpg", @"full_breakfast.jpg",@"hamburger.jpg", @"ham_and_egg_sandwich.jpg", @"creme_brelee.jpg", @"white_chocolate_donut.jpg", @"starbucks_coffee.jpg", @"vegetable_curry.jpg",@"instant_noodle_with_egg.jpg", @"noodle_with_bbq_pork.jpg",@"japanese_noodle_with_pork.jpg", @"green_tea.jpg", @"thai_shrimp_cake.jpg",@"angry_birds_cake.jpg", @"ham_and_cheese_panini.jpg",nil];
    
    _recipe = [[NSMutableArray alloc] init];
    for (int i = 0; i < names.count; i++)
    {
        Recipe *tmp = [[Recipe alloc] init];
        tmp.name = names[i];
        tmp.prepTime = prepTime[i];
        tmp.images = images[i];
        tmp.isChecked = NO;
        [_recipe addObject:tmp];
    }
    
    //Creating plist file
    
    [self setUpPlistFile];
    
}

-(NSString *)setUpPlistFile
{
//    - NSArray * NSSearchPathForDirectoriesInDomains ( NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde ) {
//        
//    }
    NSFileManager *manager = [NSFileManager defaultManager];
    NSURL *url = [manager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *plistName = @"recipe.plist";
    NSString *fullPlistPath = [url.path stringByAppendingPathComponent:plistName];
    BOOL result = [manager createFileAtPath:fullPlistPath contents:nil attributes:nil];
    
    return fullPlistPath;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_recipe count];
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
    Recipe *recipe = _recipe[indexPath.row];
    // Set recipe name and prep time for cell label text
    
    cell.nameLabel.text = recipe.name;
    cell.prepTimeLabel.text = recipe.prepTime;
    
    cell.nameLabel.textColor = [UIColor blackColor];
    cell.prepTimeLabel.textColor = [UIColor blackColor];
    // Check to see if recipeChecked array is Checked (YES) or IsNotChecked(NO)
    
    
    // Array of images in array named recipeImages
    cell.backgroundImageView.image = [UIImage imageNamed:recipe.images];
    
    
    cell.prepTimeLabel.backgroundColor = [UIColor clearColor];
    cell.backgroundImageView.backgroundColor = [UIColor grayColor];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{

    return NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

//    [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionTop];


}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    return indexPath;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:
(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_recipe removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

}


@end
