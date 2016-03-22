#import "RCTBridgeModule.h"
#import "BraintreePayPal.h"

@interface RNBraintreePayPal : UIViewController <RCTBridgeModule, BTViewControllerPresentingDelegate, BTAppSwitchDelegate>

@property (nonatomic, strong) BTAPIClient *braintreeClient;

@end
