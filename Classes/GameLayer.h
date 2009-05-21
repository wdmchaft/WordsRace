//
//  GameLayer.h
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "Word.h"

@interface GameLayer : Layer {
	NSMutableArray *letterSprites,*letterPositions;
	LetterSprite *selectedLetter;
	AtlasSpriteManager *letterSpritesManager;
	Word *currentWord;
}

@property (retain) NSMutableArray *letterSprites,*letterPositions;
@property (retain) LetterSprite *selectedLetter;
@property (retain) AtlasSpriteManager *letterSpritesManager;
@property (retain) Word *currentWord;

- (void) setRandomLetters;
- (void) setSelectedLetterIndex:(int)index;
- (void) setLetterSpritesPositions;
- (void) setLetterSpritesTemporaryPosition:(int) index;

- (int) letterIndexForPosition:(CGPoint)point;

@end
