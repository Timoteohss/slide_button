#import "SlideButtonPlugin.h"
#import <slide_button/slide_button-Swift.h>

@implementation SlideButtonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSlideButtonPlugin registerWithRegistrar:registrar];
}
@end
