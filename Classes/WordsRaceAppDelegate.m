//
//  WordsRaceAppDelegate.m
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//


#import "WordsRaceAppDelegate.h"
#import "MenuLayer.h"

@implementation WordsRaceAppDelegate

@synthesize MenuScene;

- (void)applicationDidFinishLaunching:(UIApplication *)app {    	
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window setUserInteractionEnabled:YES];
    [window setMultipleTouchEnabled:YES];
    [[Director sharedDirector] setLandscape: YES];
    [[Director sharedDirector] attachInWindow:window];
	
    [window makeKeyAndVisible];
	self.MenuScene = [Scene node];
    [[Director sharedDirector] runWithScene: self.MenuScene];
	[self.MenuScene addChild:[MenuLayer node]];
}

- (void) dealloc	{
	[self.MenuScene release];
	[super dealloc];
}




@end
