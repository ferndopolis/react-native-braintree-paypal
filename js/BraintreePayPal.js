'use strict';

var RNBraintreePayPal = require('react-native').NativeModules.RNBraintreePayPal;

var BraintreePayPal = {
    initWithAuthorization(clientToken) {
      RNBraintreePayPal.initWithAuthorization(clientToken);
    },

    showPayPalViewController(callback) {
      RNBraintreePayPal.showPayPalViewController(callback);
    }
};

module.exports = BraintreePayPal;
