//
//  LetterSprite.h
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#define SMALL_SCALE 0.55
#define NORMAL_SCALE 0.75
#define MEDIUM_SCALE 0.80
#define BIG_SCALE 1.00


@interface LetterSprite : AtlasSprite {
	NSString *letter;
	CGPoint originPosition;
}

@property (retain) NSString *letter;

- (id) initWithManager: (AtlasSpriteManager*) mgr andLetter: (NSString*) aLetter andIndex: (int) index;
+ (LetterSprite*) letterSpriteWithManager: (AtlasSpriteManager*) mgr andLetter: (NSString*) aLetter andIndex: (int) index;

- (void) doAppearAnim: (float) aDelay withScale: (float) aScale;
- (void) doValidAnim: (float) aDelay;
- (void) doNotValidAnim: (float) aDelay;
- (void) highLight;
- (void) unHighLight;
- (void) doSelectedAnim;
- (void) undoSelectedAnim;
	

@end
