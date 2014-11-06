#import <Cordova/CDV.h>
#import "Microphone.h"

@implementation Microphone

@synthesize callbackId;

- (void)microphone:(CDVInvokedUrlCommand*)command {
  self.callbackId = command.callbackId;

  NSArray *vComp = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];

  if ([[vComp objectAtIndex:0] intValue] < 7) {
    [self performSelectorOnMainThread:@selector(doSuccessCallback:) withObject:@"on" waitUntilDone:NO];
  }
  else {
    @try {
      [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
        NSString * grantedString = (granted) ? @"on" : @"off";
        [self performSelectorOnMainThread:@selector(doSuccessCallback:) withObject:grantedString waitUntilDone:NO];
      }];

    }
    @catch (id exception) {
      NSLog(@"recordPermission try error");
      CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_JSON_EXCEPTION messageAsString:[exception reason]];
      NSString* javaScript = [pluginResult toErrorCallbackString:command.callbackId];
      [self writeJavascript:javaScript];
    }
  }
}

-(void) doSuccessCallback:(NSString*)granted {
  CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:granted];
  NSString* javaScript = [pluginResult toSuccessCallbackString:self.callbackId];
  [self writeJavascript:javaScript];
}

@end
