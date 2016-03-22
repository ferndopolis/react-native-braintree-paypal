# react-native-braintree-paypal

A react native interface for handling Braintree's paypal nonce creation,
when using a custom credit paypal UI.

For those using the Braintree's v.zero SDK, check out [react-native-braintree](https://github.com/alawong/react-native-braintree).

## Usage

### Setup
```js
// outside of your componet
import BraintreeCardClient from 'react-native-braintree-paypal';

// in your componentDidMount() block
BraintreeCardClient.initWithAuthorization(<token>);

// handle form submit event after user inputs paypal detail
BraintreeCardClient.getCardNonce( paypal, expMonth, expYear, cvv, (error, nonce) => {
   // if error handle accordingly or pass nonce to your server
});
```

## Installation
1. Run `npm install react-native-braintree-paypal --save` to add the package
2. Inside the ``ios/`` directory, create a Podfile:

  ```ruby
  # Podfile for cocoapods 1.0
  source 'https://github.com/CocoaPods/Specs.git'
  target 'yourAppTarget' do
    pod 'React', :path => '../node_modules/react-native', :subspecs => [
      'Core',
      'RCTImage',
      'RCTNetwork',
      'RCTText',
      'RCTWebSocket'
    ]
    pod 'react-native-braintree-paypal', :path => '../node_modules/react-native-braintree-paypal'
  end
  ```

  Or if you use an older CocoaPods version:
  ```ruby
  source 'https://github.com/CocoaPods/Specs.git'
  pod 'React', :path => '../node_modules/react-native', :subspecs => [
    'Core',
    'RCTImage',
    'RCTNetwork',
    'RCTText',
    'RCTWebSocket'
  ]
  pod 'react-native-braintree-paypal', :path => '../node_modules/react-native-braintree-paypal'
  ```

3. Run `pod install`.  This installs the Braintree iOS SDK and a new workspace is created.

4. Open your workspace.

5. Under your app target -> build settings, look for `Other Linker Flags` and add `$(inherited)`

6. Build and run project!  If it fails the first time, clean and rebuild.

Because React Native's iOS code is now pulled in via CocoaPods, you also need to remove the ``React``, ``RCTImage``, etc. subprojects from your app's Xcode project.

## Requirements

Tested with:
* Node 5.6.0
* npm 3.6.0
* react-native 0.17.0
