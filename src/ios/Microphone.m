#import "Microphone.h"
#import <Cordova/CDV.h>

@implementation Microphone
  - (void)recordPermission:(CDVInvokedUrlCommand*)command {
    AVAudioSession *session = [AVAudioSession sharedInstance];
      if ([session respondsToSelector:@selector(requestRecordPermission:)]) {
          [session performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
              if (granted) {
                  // Microphone enabled code
                  NSLog(@"Microphone is enabled..");
              }
              else {
                  // Microphone disabled code
                  NSLog(@"Microphone is disabled..");

                  // We're in a background thread here, so jump to main thread to do UI work.
                  dispatch_async(dispatch_get_main_queue(), ^{
                      [[[[UIAlertView alloc] initWithTitle:@"Microphone Access Denied"
                        message:@"This app requires access to your device's Microphone.\n\nPlease enable Microphone access for this app in Settings / Privacy / Microphone"
                        delegate:nil
                        cancelButtonTitle:@"Dismiss"
                        otherButtonTitles:nil] autorelease] show];
                  });
              }
          }];
      }
  }
@end