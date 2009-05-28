//
//  Word.h
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "LetterSprite.h"



@interface Word : CocosNode {
	NSMutableArray *selectedLetters;
}

@property (retain) NSMutableArray *selectedLetters;

- (void) addLetterToWord: (LetterSprite *)letter;
- (BOOL) validate;

@end
