#import "SwipeButtonPlugin.h"
#import <swipe_button/swipe_button-Swift.h>

@implementation SwipeButtonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSwipeButtonPlugin registerWithRegistrar:registrar];
}
@end
