#import <UIKit/UIKit.h>
#import "PRCity.h"

@interface PRAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,copy) PRCity*city;
-(void)getDataFromServer:(NSString*) name;
@end

