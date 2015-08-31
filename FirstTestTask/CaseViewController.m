//
//  CaseViewController.m
//  FirstTestTask
//
//  Created by Ruslan on 25.11.14.
//  Copyright (c) 2014 Ruslan Palapa. All rights reserved.
//

#import "CaseViewController.h"
#import "ServerManager.h"
#import "UIImageView+AFNetworking.h"
@interface CaseViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *buttonYes;
@property (weak, nonatomic) IBOutlet UIButton *buttonNo;
@property (strong) NSMutableArray *data;

@end

@implementation CaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [NSString stringWithFormat:@"Caseid %@", self.caseID];
        [self getDataFromServer];
    }
- (IBAction)leftButton:(id)sender {
    if ([self.data count]!=0 && [[self.data firstObject]valueForKey:@"caseId"]!=nil){
        CaseViewController *caseController = [[CaseViewController alloc]initWithNibName:nil bundle:nil];
        caseController.caseID=[[self.data firstObject]valueForKey:@"caseId"];
        [self.navigationController pushViewController:caseController animated:YES];
    }
}
- (IBAction)rightButton:(id)sender {
    if ([self.data count]!=0){
        CaseViewController *caseController = [[CaseViewController alloc]initWithNibName:nil bundle:nil];
        caseController.caseID=[[self.data lastObject]valueForKey:@"caseId"];
        [self.navigationController pushViewController:caseController animated:YES];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getDataFromServer{
    [[ServerManager sharedManager]getDataFromCaseMethodWithId:self.caseID onSuccess:^(NSArray *data) {        self.label.text = [data valueForKey:@"text"];
        self.data = [data valueForKey:@"answers"];
        self.buttonNo.titleLabel.text=[[self.data firstObject]valueForKey:@"text"];
        self.buttonYes.titleLabel.text=[[self.data lastObject]valueForKey:@"text"];
        
        if ([data valueForKey:@"image"]!=[NSNull null])
            [self.imageView setImageWithURL:[NSURL URLWithString:[data valueForKey:@"image"]]];
        else [self.imageView setImage:[UIImage imageNamed:@"Car-50.png"]];
        
    } onFailure:^(NSError *error, NSInteger statusCode) {
    }];
}

@end
