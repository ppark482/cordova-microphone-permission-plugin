#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <Cordova/CDVPlugin.h>

@interface Microphone : CDVPlugin {
  NSString* callbackId;
}

@property (nonatomic, retain) NSString* callbackId;

- (void)microphone:(NSArray*)arguments ;

@end
