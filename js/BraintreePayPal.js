'use strict';

var RNBraintreePayPal = require('react-native').NativeModules.RNBraintreeCard;

var BraintreePayPal = {
    initWithAuthorization(clientToken) {
      RNBraintreePayPal.initWithAuthorization(clientToken);
    },

    showPayPalViewController(callback) {
      RNBraintreePayPal.showPayPalViewController(callback);
    }
};

module.exports = BraintreePayPal;
