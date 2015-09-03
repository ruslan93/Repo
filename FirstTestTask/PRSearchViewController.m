#import "PRSearchViewController.h"
#import "PRMapViewController.h"
#import "PRAppDelegate.h"

@interface PRSearchViewController ()
@property (strong) PRAppDelegate *appDelegate;

@end

@implementation PRSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.appDelegate=[[UIApplication sharedApplication]delegate];
    self.textFieldCityName.delegate=self;
    [self.appDelegate addObserver:self forKeyPath:@"city.cod" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [[self navigationController] setNavigationBarHidden:YES];
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
@end
