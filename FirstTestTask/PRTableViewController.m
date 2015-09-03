//
//  TableViewController.m
//  FirstTestTask
//
//  Created by Ruslan on 8/31/15.
//  Copyright (c) 2015 Ruslan Palapa. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"



@interface TableViewController ()
@property (strong,nonatomic) NSMutableArray *cities;
@property (strong, nonatomic) NSMutableArray *data;
@property (strong, nonatomic) NSString *city;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.cities = [ NSMutableArray arrayWithObjects:@"Amsterdam", @"Athens", @"Barcelona", @"Beijing", @"Belgrade", @"Berlin", @"Bogota", @"Bratislava", @"Brussels", @"Bucharest", @"Budapest", @"Chicago", @"Dubai", @"Dublin", @"Frankfurt", @"Helsinki", @"Istanbul", @"Kabul", @"Kyiv", @"Lisbon", @"London", @"Madrid", @"Mexico", @"Moscow" , @"Nairobi" , @"Oslo", @"Ottawa", @"Paris", @"Riga", @"Tokyo", @"Zagreb", nil ];
    self.data=[NSMutableArray array];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cities count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *city = [self.cities objectAtIndex:indexPath.row];
    [cell.textLabel setText:city];
     return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewController *controller  = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController"];
    controller.city = [self.cities objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
    }




@end
