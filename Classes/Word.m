//
//  Word.m
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Word.h"
#import "WordsDictionary.h"

@implementation Word

@synthesize selectedLetters;

- (id) init
{
	self = [super init];
	if (self != nil) {
		self.selectedLetters = [NSMutableArray arrayWithCapacity:6];
	}
	return self;
}

- (void) dealloc
{
	[self.selectedLetters release];
	[super dealloc];
}


- (void) addLetterToWord: (LetterSprite *)letter	{
	if (![self.selectedLetters containsObject: letter]) {
		[self.selectedLetters addObject: letter];
	}
}

- (BOOL) validate	{
	[[WordsDictionary sharedInstance] isValidWord: self];
	[self.selectedLetters removeAllObjects];
	return NO;
}

- (NSString *) description	{
	NSString *string = @"";
	for(LetterSprite *letter in self.selectedLetters)	{
		string = [string stringByAppendingString:letter.letter];
	}
	return string;
}

@end
