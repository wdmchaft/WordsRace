//
//  LetterSprite.h
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#define NORMAL_SCALE 0.75
#define BIG_SCALE 1.25


@interface LetterSprite : AtlasSprite {
	NSString *letter;
}

@property (retain) NSString *letter;

- (id) initWithManager: (AtlasSpriteManager*) mgr andLetter: (NSString*) aLetter andIndex: (int) index;
+ (LetterSprite*) letterSpriteWithManager: (AtlasSpriteManager*) mgr andLetter: (NSString*) aLetter andIndex: (int) index;

- (void) doAppearAnim: (float) aDelay;
- (void) highLight;
- (void) unHighLight;
	

@end
