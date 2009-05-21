//
//  GameLayer.m
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"


@implementation GameLayer

@synthesize letterSprites,letterPositions,currentWord;
@synthesize selectedLetter;
@synthesize letterSpritesManager;

- (id) init	{
	self = [super init];
	if (self != nil) {
		self.letterSpritesManager = [AtlasSpriteManager spriteManagerWithFile: @"lettres.png"]; 	
		self.letterSprites = [NSMutableArray arrayWithCapacity:6];
		self.letterPositions = [NSMutableArray arrayWithCapacity:6];
		self.currentWord = [Word node];
		[self addChild: self.letterSpritesManager];
		[self setRandomLetters];
		[self setIsTouchEnabled: YES];
	}
	return self;
}

- (void) dealloc	{
	[self.letterSpritesManager release];
	[self.currentWord release];
	[self.selectedLetter release];
	[self.letterSprites release];
	[self.letterPositions release];
	[super dealloc];
}

- (void) setRandomLetters	{
	NSArray *alphabet = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",
						 @"G",@"H",@"I",@"J",@"K",@"L",
						 @"M",@"N",@"O",@"P",@"Q",@"R",@"S",
						 @"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
	for (int i=0; i<6; i++) {
		int randomNumber = rand() % [alphabet count];
		CGPoint letterPosition = ccp((480 - (70*NORMAL_SCALE)*6)/2 + i * (70*NORMAL_SCALE) + (30.5*NORMAL_SCALE),50);
		LetterSprite *oLetter = [LetterSprite letterSpriteWithManager:self.letterSpritesManager andLetter:[alphabet objectAtIndex: randomNumber] andIndex: randomNumber];
		[letterSprites addObject: oLetter];
		[letterPositions addObject: [NSValue valueWithCGPoint:letterPosition]];
		[oLetter setPosition: letterPosition];
		[oLetter doAppearAnim:i*0.5];
		[self.letterSpritesManager addChild: oLetter];
	}
}

- (void) setSelectedLetterIndex:(int)index	{
	if (index > -1)	{
		[self.letterSprites removeObject: self.selectedLetter];
		[self.letterSprites insertObject: self.selectedLetter atIndex: index];
	}
	[self setLetterSpritesPositions];
	
}

- (void) setLetterSpritesTemporaryPosition:(int) index	{
	NSMutableArray *temporarySprites = [NSMutableArray arrayWithCapacity:6];
	if (index > -1)	{
		for(int i=0;i<[self.letterSprites count];i++)	{
			[temporarySprites addObject:[self.letterSprites objectAtIndex: i]];
		}
		[temporarySprites removeObject: self.selectedLetter];
		[temporarySprites insertObject: self.selectedLetter atIndex: index];
		for(int i=0;i<[temporarySprites count];i++)	{
			if (i != index) {
				LetterSprite *sprite = [temporarySprites objectAtIndex: i];
				CGPoint point = [[self.letterPositions objectAtIndex: i] CGPointValue];
				[sprite runAction: [EaseOut actionWithAction:[MoveTo actionWithDuration: 0.2 position: point] rate:2.0]];			
			}
		}
	}
}

- (void) setLetterSpritesPositions	{
	for (int i=0;i<[self.letterSprites count];i++)	{
		LetterSprite *sprite = [self.letterSprites objectAtIndex: i];
		CGPoint point = [[self.letterPositions objectAtIndex: i] CGPointValue];
		[sprite runAction: [MoveTo actionWithDuration: 0.2 position: point]];
	}
}


- (int) letterIndexForPosition:(CGPoint)point	{
	int i =0;
	if ((point.y > 20 && point.y<130) || self.selectedLetter == nil)	{
		for(NSValue *value in self.letterPositions)	{
			CGPoint letterPosition = [value CGPointValue];
			if (point.x < letterPosition.x)	{
				return i; 
			}
		i++;
		}
	}	else	{
		return -1;
	}
	return [self.letterPositions count]-1;	
}
		
- (BOOL) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event { 
	for(LetterSprite *letter in self.letterSprites)	{
		if ([letter hitTest:[touches anyObject]])	{
			self.selectedLetter = letter;
			[self.selectedLetter highLight];
			return kEventHandled;
		}
	}
	return kEventIgnored; 
} 

- (BOOL) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event { 
	UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView: [touch view]];
    CGPoint convertedLocation = [[Director sharedDirector] convertCoordinate:location];
	if (self.selectedLetter == nil) {
		[self.currentWord addLetterToWord: [self.letterSprites objectAtIndex:[self letterIndexForPosition: convertedLocation]]];
	}	else	{
		[self.selectedLetter setPosition: convertedLocation];
		[self setLetterSpritesTemporaryPosition: [self letterIndexForPosition: convertedLocation]];
	}
	return kEventHandled;
} 

- (BOOL) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event { 
	if (self.selectedLetter == nil) {
		[self.currentWord validate];
		return kEventHandled;
	}
	UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView: [touch view]];
    CGPoint convertedLocation = [[Director sharedDirector] convertCoordinate:location];
	[self setSelectedLetterIndex: [self letterIndexForPosition: convertedLocation]];
	[self.selectedLetter unHighLight];
	self.selectedLetter = nil;
	return kEventHandled;
} 
@end
