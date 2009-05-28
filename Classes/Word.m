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
	if (![self.selectedLetters containsObject: letter] && letter != nil) {
		[self.selectedLetters addObject: letter];
		[letter doSelectedAnim];
	}
}

- (BOOL) validate	{
	BOOL isWordValid = [[WordsDictionary sharedInstance] isValidWord: self];
	int i=0;
	for (LetterSprite *letter in self.selectedLetters)	{
		[letter undoSelectedAnim];
		if (isWordValid) [letter doValidAnim:0.1*i];
		else  [letter doNotValidAnim:0.1*i];
		i++;
	}
	[self.selectedLetters removeAllObjects];
	return isWordValid;
}

- (NSString *) description	{
	NSString *string = @"";
	for(LetterSprite *letter in self.selectedLetters)	{
		string = [string stringByAppendingString:letter.letter];
	}
	return string;
}

@end
