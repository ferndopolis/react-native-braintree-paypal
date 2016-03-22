#import "RCTBridgeModule.h"
#import "BraintreePayPal.h"

@interface RNBraintreePayPal : UIViewController <RCTBridgeModule, BTPayPalViewControllerDelegate>

@property (nonatomic, strong) BTAPIClient *braintreeClient;

@end
