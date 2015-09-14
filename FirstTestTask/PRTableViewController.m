
#import "PRTableViewController.h"
#import "PRMapViewController.h"
#import "PRAppDelegate.h"
#import "PRSection.h"


@interface PRTableViewController ()
@property (strong,nonatomic) NSMutableArray *cities;
@property (strong) PRAppDelegate *appDelegate;
@property (strong, nonatomic) NSArray* sectionsArray;
@end

@implementation PRTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.appDelegate=[[UIApplication sharedApplication]delegate];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:1/255.f green:122/255.f blue:1 alpha:1]};
    self.cities = [ NSMutableArray arrayWithObjects:@"Amsterdam", @"Athens", @"Barcelona", @"Beijing", @"Belgrade", @"Berlin", @"Bogota", @"Bratislava", @"Brussels", @"Bucharest", @"Budapest", @"Chicago", @"Dubai", @"Dublin", @"Frankfurt", @"Helsinki", @"Istanbul", @"Kabul", @"Kyiv", @"Lisbon", @"London", @"Madrid", @"Mexico", @"Moscow" , @"Nairobi" , @"Oslo", @"Ottawa", @"Paris", @"Riga", @"Tokyo", @"Zagreb", nil ];
    self.sectionsArray = [self generateSectionsFromArray:self.cities withFilter:@""];
    [self.navigationItem setTitle:@"Favorite cities"];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    UIImageView *tableBackgroundView = [[UIImageView alloc]
                                        initWithImage:[UIImage imageNamed:@"city.jpg"]];
    [tableBackgroundView setFrame: self.tableView.frame];
    [self.tableView setBackgroundView:tableBackgroundView];
    [self.tableView setContentInset:UIEdgeInsetsMake(0,0,self.tabBarController.tabBar.frame.size.height
,0)];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:NO];
}

- (NSArray*) generateSectionsFromArray:(NSArray*) array withFilter:(NSString*) filterString {
    
    NSMutableArray* sectionsArray = [NSMutableArray array];
    
    NSString* currentLetter = nil;
    
    for (NSString* string in array) {
        
        if ([filterString length] > 0 && [string rangeOfString:filterString].location == NSNotFound) {
            continue;
        }
        
        NSString* firstLetter = [string substringToIndex:1];
        PRSection* section = nil;
        if (![currentLetter isEqualToString:firstLetter]) {
            section = [[PRSection alloc] init];
            section.sectionName = firstLetter;
            section.itemsArray = [NSMutableArray array];
            currentLetter = firstLetter;
            [sectionsArray addObject:section];
        } else {
            section = [sectionsArray lastObject];
        }
        [section.itemsArray addObject:string];
        
    }
    
    return sectionsArray;
}
#pragma mark - Table view data source

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray* array = [NSMutableArray array];
    for (PRSection* section in self.sectionsArray) {
        [array addObject:section.sectionName];
    }
    return array;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.sectionsArray count];

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[self.sectionsArray objectAtIndex:section] sectionName];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    PRSection* sec = [self.sectionsArray objectAtIndex:section];
    return [sec.itemsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    PRSection* section = [self.sectionsArray objectAtIndex:indexPath.section];
    NSString* name = [section.itemsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = name;
    cell.textLabel.textColor=[UIColor whiteColor];
    [cell.textLabel setFont:[UIFont boldSystemFontOfSize:17.f]];
    cell.backgroundColor= [UIColor clearColor];
    return cell;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:12]];
    NSString *string = [[self.sectionsArray objectAtIndex:section] sectionName];
    [label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:0.5]];
    return view;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PRSection* section = [self.sectionsArray objectAtIndex:indexPath.section];
    [self.appDelegate getDataFromServer:[section.itemsArray objectAtIndex:indexPath.row]];
}


#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar {
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    self.sectionsArray = [self generateSectionsFromArray:self.cities withFilter:searchText];
    [self.tableView reloadData];
}

@end
