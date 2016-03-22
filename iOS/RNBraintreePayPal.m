#import "RNBraintreePayPal.h"

@implementation RNBraintreePayPal

static NSString *URLScheme;

+ (instancetype)sharedInstance {
    static RNBraintreePayPal *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[RNBraintreePayPal alloc] init];
    });
    return _sharedInstance;
}

RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(initWithURLScheme:(NSString *)clientToken urlscheme:(NSString*)urlscheme)
{
  URLScheme = urlscheme;
  [BTAppSwitch setReturnURLScheme:urlscheme];
  self.braintreeClient = [[BTAPIClient alloc] initWithAuthorization: clientToken];
}

RCT_EXPORT_METHOD(initWithAuthorization: (NSString *)clientToken)
{
    self.braintreeClient = [[BTAPIClient alloc] initWithAuthorization: clientToken];
    NSLog(@"!!!INIT WITH AUTHORIZATION COMPLETED!!!", self.braintreeClient);
}


RCT_EXPORT_METHOD(showPayPalViewController:(RCTResponseSenderBlock)callback)
{
  self.callback = callback;

  BTPayPalDriver *payPalDriver = [[BTPayPalDriver alloc] initWithAPIClient:self.braintreeClient];
  payPalDriver.viewControllerPresentingDelegate = self;
  payPalDriver.appSwitchDelegate = self; // Optional

  // Start the Vault flow, or...
  [payPalDriver authorizeAccountWithCompletion:^(BTPayPalAccountNonce *tokenizedPayPalAccount, NSError *error) {
      NSArray *args = @[];
      if ( error == nil ) {
        args = @[[NSNull null], tokenizedPayPalAccount];
      } else {
        args = @[error.description, [NSNull null]];
      }

      NSLog(@"GOT Errors:", error);
      NSLog(@"GOT nonce:", tokenizedPayPalAccount);

      self.callback(args);
  }];
}

- (void)paymentDriver:(id)paymentDriver
requestsPresentationOfViewController:(UIViewController *)viewController {
  self.reactRoot = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
  [self.reactRoot presentViewController:viewController animated:YES completion:nil];
}

- (void)paymentDriver:(id)paymentDriver
requestsDismissalOfViewController:(UIViewController *)viewController {
  self.reactRoot = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
  [self.reactRoot dismissViewControllerAnimated:true completion:nil];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    if ([url.scheme localizedCaseInsensitiveCompare:URLScheme] == NSOrderedSame) {
        return [BTAppSwitch handleOpenURL:url sourceApplication:sourceApplication];
    }
    return NO;
}

@end
