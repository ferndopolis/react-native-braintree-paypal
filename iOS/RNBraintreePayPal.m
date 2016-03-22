#import "RNBraintreePayPal.h"

@implementation RNBraintreePayPal

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(initWithAuthorization: (NSString *)clientToken)
{
    self.braintreeClient = [[BTAPIClient alloc] initWithAuthorization: clientToken];
}

RCT_EXPORT_METHOD(showPayPalViewController:(RCTResponseSenderBlock)callback)
{
  BTPayPalDriver *payPalDriver = [[BTPayPalDriver alloc] initWithAPIClient:self.braintreeClient];
  payPalDriver.viewControllerPresentingDelegate = self;
  payPalDriver.appSwitchDelegate = self; // Optional

  // Start the Vault flow, or...
  [payPalDriver authorizeAccountWithCompletion:^(BTPayPalAccountNonce *tokenizedPayPalAccount, NSError *error) {
    ...
      NSArray *args = @[];
      if ( error == nil ) {
        args = @[[NSNull null], tokenizedPayPalAccount];
      } else {
        args = @[error.description, [NSNull null]];
      }

      callback(args);
  }];
}

@end
