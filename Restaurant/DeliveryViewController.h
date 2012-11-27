#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "GettingCoreContent.h"
#import "AddressListTableViewController.h"
#import "TimePicker.h"
#import "XMLParseResponseFromTheServer.h"
#import "Singleton.h"
#import "SSToolkit/SSToolkit.h"
#import <QuartzCore/QuartzCore.h>
#import "RestaurantAppDelegate.h"

@interface DeliveryViewController : UIViewController <UITextFieldDelegate, NSURLConnectionDelegate, AddressListDelegate, UIScrollViewDelegate, CLLocationManagerDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextField *addressName;
@property (strong, nonatomic) IBOutlet UITextField *customerName;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *CityName;
@property (strong, nonatomic) IBOutlet UITextField *street;
@property (strong, nonatomic) IBOutlet UITextField *build;
@property (strong, nonatomic) IBOutlet UITextField *appartaments;
@property (strong, nonatomic) IBOutlet UITextField *otherInformation;
@property (strong, nonatomic) IBOutlet UITextField *deliveryTime;
@property (strong, nonatomic) XMLParseResponseFromTheServer *db;

@property (weak, nonatomic) IBOutlet UIButton *toOrderButton;
@property (weak, nonatomic) IBOutlet UIButton *saveAddressButton;

- (IBAction)toOrder:(id)sender;
- (IBAction)saveAddress:(id)sender;
- (IBAction)toAddressList:(id)sender;

@property (strong, nonatomic) NSMutableDictionary *dictionary;
@property (strong, nonatomic) NSMutableDictionary *historyDictionary;
@property (strong, nonatomic) GettingCoreContent *content;

@property (strong, nonatomic) TimePicker *pickerViewContainer;

@property (nonatomic)BOOL enableTime;

@property (nonatomic, strong) NSString *locationStreet;
@property (nonatomic, strong) NSString *locationCity;

@end
