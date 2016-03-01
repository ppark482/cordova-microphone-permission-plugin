#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Cordova/CDVPlugin.h>

@interface Microphone : CDVPlugin

- (void)recordPermission:(CDVInvokedUrlCommand*)command;

@end
