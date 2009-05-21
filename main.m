//
//  main.m
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	int retVal = UIApplicationMain(argc, argv, nil,
								   @"WordsRaceAppDelegate");
	[pool release];
	return retVal;
}