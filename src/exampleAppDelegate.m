#import "exampleAppDelegate.h"
#import "MainViewController.h"

@implementation exampleAppDelegate

@synthesize window = _window;
@synthesize mainViewController = _mainViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  self.window.rootViewController = self.mainViewController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)dealloc {
  [_window release];
  [_mainViewController release];
  [super dealloc];
}

@end
