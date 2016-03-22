Pod::Spec.new do |s|

  s.name             = "react-native-braintree-paypal"
  s.version          = "0.0.1"
  s.summary          = "A react native interface for integrating Braintree PayPal UI."
  s.homepage         = "https://github.com/ferndopolis/react-native-braintree-paypal"
  s.license          = 'MIT'
  s.author           = { "Fernando Marcheselli" => "fmarcheselli@gmail.com" }
  s.source           = { :git => "https://github.com/ferndopolis/react-native-braintree-paypal.git", :tag => "0.0.1" }

  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'iOS/*'

  s.dependency 'Braintree/PayPal', '~> 4.0'
  s.dependency 'React'
end
