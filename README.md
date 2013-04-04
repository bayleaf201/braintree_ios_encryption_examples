# Braintree iOS Encryption Integration Examples

This project contains examples of integrating with the [Braintree](http://www.braintreepaymentsolutions.com)
payment gateway using the [Braintree iOS library](https://github.com/braintree/braintree_ios).

## example.xcodeproj
This is an xcode project that you can open and build with Xcode.

### Getting started
* Configure your client side encryption public key in `src/MainViewController.m`.
* Set the example Merchant Server url in `src/HTTPClient.m`.

## Server
An example ruby (sinatra) server that receives requests with encrypted fields from the iOS example application and forwards them to Braintree's payment gateway using the server-to-server API
See server/README.md for instructions on running the example.

