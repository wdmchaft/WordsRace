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
		originPosition = self.position;
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

- (void) doSelectedAnim	{
	originPosition = self.position;
	float angle = (rand()%2 == 1 ? 7. : -7.);
	[self runAction:
	 [RepeatForever actionWithAction:
	  [Sequence actions:
	   [Spawn actions:
		[MoveBy actionWithDuration:0.1 position:ccp(0,2)],
		[RotateBy actionWithDuration:0.2 angle:angle],
		[ScaleTo actionWithDuration:0.1 scale:MEDIUM_SCALE],
		nil
		],
	   [Spawn actions:
		[[RotateBy actionWithDuration:0.2 angle:angle] reverse],
		[[MoveBy actionWithDuration:0.1 position:ccp(0,2)] reverse],
		[ScaleTo actionWithDuration:0.1 scale:NORMAL_SCALE],
		nil
		]
	   ]
	  ]
	 ];
}

- (void) undoSelectedAnim	{
	[self stopAllActions];
	[self runAction:
	 [Spawn actions:
	  [RotateTo actionWithDuration: 0.2 angle: 0.],
	  [MoveTo actionWithDuration: 0.1 position:originPosition],
	  [ScaleTo actionWithDuration: 0.1 scale:NORMAL_SCALE],
	  nil
	  ]
	 ];
}

- (void) doValidAnim: (float) aDelay	{
	[self runAction:
	 [Sequence actions:
	  [DelayTime actionWithDuration:aDelay],
	  [TintTo actionWithDuration:0.3 red:0 green:255 blue:0],
	  [TintTo actionWithDuration:0.3 red:255 green:255 blue:255],
	  nil
	 ]
	];
}

- (void) doNotValidAnim: (float) aDelay	{
	[self runAction:
	 [Sequence actions:
	  [DelayTime actionWithDuration:aDelay],
	  [TintTo actionWithDuration:0.3 red:255 green:0 blue:0],
	  [TintTo actionWithDuration:0.3 red:255 green:255 blue:255],
	  nil
	  ]
	 ];
}

- (void) doAppearAnim: (float) aDelay withScale: (float) aScale	{
	[self setOpacity:0.];
	[self setScale:BIG_SCALE];
	[self runAction: 
	 [Sequence actions:
	  [DelayTime actionWithDuration:aDelay],
	  [Spawn actions:
	   [FadeIn actionWithDuration:0.3],
	   [ScaleTo actionWithDuration:0.3 scale:aScale],
	   nil
	   ],
	  nil
	  ]
	 ];	
}
@end
