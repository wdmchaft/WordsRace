//
//  WordsRaceAppDelegate.m
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//


#import "WordsRaceAppDelegate.h"
#import "GameLayer.h"

@implementation WordsRaceAppDelegate

@synthesize ms;

- (void)applicationDidFinishLaunching:(UIApplication *)app {    	
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window setUserInteractionEnabled:YES];
    [window setMultipleTouchEnabled:YES];
    [[Director sharedDirector] setLandscape: YES];
    [[Director sharedDirector] attachInWindow:window];
	
    [window makeKeyAndVisible];
	self.ms = [Scene node];
    [[Director sharedDirector] runWithScene: self.ms];
	[self.ms addChild:[GameLayer node]];
}

- (void) dealloc	{
	[self.ms release];
	[super dealloc];
}




@end
