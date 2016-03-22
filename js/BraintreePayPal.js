'use strict';

var RNBraintreePayPal = require('react-native').NativeModules.RNBraintreePayPal;

var BraintreePayPal = {
    initWithURLScheme(clientToken, urlScheme) {
      RNBraintreePayPal.initWithURLScheme(clientToken, urlScheme);
    },

    initWithAuthorization(clientToken) {
      RNBraintreePayPal.initWithAuthorization(clientToken);
    },

    showPayPalViewController(callback) {
      RNBraintreePayPal.showPayPalViewController(callback);
    }
};

module.exports = BraintreePayPal;
