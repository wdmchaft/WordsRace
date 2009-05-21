//
//  LetterSprite.m
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LetterSprite.h"

@implementation LetterSprite

@synthesize letter;

- (id) initWithManager: (AtlasSpriteManager*) mgr andLetter: (NSString *) aLetter andIndex: (int) index {
	int row = index/13;
	int col = index%13;
	CGRect rect = CGRectMake(col*61, row*62, 61, 62);
	self = [super initWithRect: rect spriteManager: mgr];
	if (self != nil) {
		self.letter = aLetter;
	}
	return self;
}

+ (LetterSprite*) letterSpriteWithManager: (AtlasSpriteManager*) mgr andLetter: (NSString *) aLetter andIndex: (int) index {
	return [[[LetterSprite alloc] initWithManager: mgr andLetter: aLetter andIndex: index] autorelease];
}

- (void) dealloc	{
	[self.letter release];
	[super dealloc];
}

- (void) highLight	{
	[[self parent] reorderChild:self z:1];
	[self runAction: [ScaleTo actionWithDuration:0.1 scale:BIG_SCALE]];
}

- (void) unHighLight	{
	[self runAction: [ScaleTo actionWithDuration:0.1 scale:NORMAL_SCALE]];
}

-(void) doAppearAnim: (float) aDelay	{
	[self setOpacity:0.];
	[self setScale:BIG_SCALE];
	[self runAction: 
	 [Sequence actions:
	  [DelayTime actionWithDuration:aDelay],
	  [Spawn actions:
	   [FadeIn actionWithDuration:0.5],
	   [ScaleTo actionWithDuration:0.5 scale:NORMAL_SCALE],
	   nil
	   ],
	  nil
	  ]
	 ];	
}
@end
