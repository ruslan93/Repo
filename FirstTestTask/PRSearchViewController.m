#import "PRSearchViewController.h"
#import "PRMapViewController.h"
#import "PRAppDelegate.h"

@interface PRSearchViewController ()
@property (strong) PRAppDelegate *appDelegate;
@property (strong) NSMutableArray *controlsArray;

@end

@implementation PRSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate=[[UIApplication sharedApplication]delegate];
    self.textFieldCityName.delegate=self;
    [self.appDelegate addObserver:self forKeyPath:@"city.cod" options:NSKeyValueObservingOptionNew context:nil];
    self.controlsArray = [NSMutableArray array];
    [self.controlsArray addObject:self.labelWeather];
    [self.controlsArray addObject:self.textFieldCityName];
    [self.controlsArray addObject:self.button];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [[self navigationController] setNavigationBarHidden:YES];
    [self animateVisibleCells];
}

- (IBAction)buttonPressed:(id)sender {
    NSString *city = [self.textFieldCityName.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    if (city.length!=0)
    {
        [self.appDelegate getDataFromServer:city];
    }
    else {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"You have not type name of city" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
    }
}



-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if (self.appDelegate.city.cod==200) {
        PRMapViewController *controller  = [self.storyboard instantiateViewControllerWithIdentifier:@"viewController"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"City not found" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}
-(void)dealloc{
    [self.appDelegate removeObserver:self forKeyPath:@"city.cod"];
}

#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)animateVisibleCells {
        for (int i=0; i<self.controlsArray.count; i++) {
        UIView *view = self.controlsArray[i];
        CGRect frame = view.frame;
        view.frame = frame;
        frame.origin.x=frame.origin.x+1000*i;

        [UIView animateWithDuration:0.5f delay:0.25f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            view.frame=frame;
        } completion:^(BOOL finished) {
        }];
    }
}

@end
