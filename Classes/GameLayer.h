//
//  GameLayer.h
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "LetterSprite.h"


@interface GameLayer : Layer {
	NSMutableArray *letterSprites,*letterPositions;
	LetterSprite *selectedLetter;
	AtlasSpriteManager *letterSpritesManager;
}

@property (retain) NSMutableArray *letterSprites,*letterPositions;
@property (retain) LetterSprite *selectedLetter;
@property (retain) AtlasSpriteManager *letterSpritesManager;

- (void) setRandomLetters;
- (void) setSelectedLetterIndex:(int)index;
- (void) setLetterSpritesPositions;

- (int) letterIndexForPosition:(CGPoint)point;

@end
