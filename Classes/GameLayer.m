//
//  GameLayer.m
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"


@implementation GameLayer

@synthesize letterSprites,letterPositions;
@synthesize selectedLetter;
@synthesize letterSpritesManager;

- (id) init	{
	self = [super init];
	if (self != nil) {
		self.letterSpritesManager = [AtlasSpriteManager spriteManagerWithFile: @"lettres.png"]; 	
		[self addChild: self.letterSpritesManager];
		[self setRandomLetters];
		[self setIsTouchEnabled: YES];
	}
	return self;
}

- (void) dealloc	{
	[self.letterSpritesManager release];
	[self.selectedLetter release];
	[self.letterSprites release];
	[self.letterPositions release];
	[super dealloc];
}

- (void) setRandomLetters	{
	self.letterSprites = [NSMutableArray arrayWithCapacity:6];
	self.letterPositions = [NSMutableArray arrayWithCapacity:6];
	NSArray *alphabet = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",
						 @"G",@"H",@"I",@"K",@"L",@"M",
						 @"N",@"O",@"P",@"Q",@"R",@"S",
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

- (void) setLetterSpritesPositions	{
	for (int i=0;i<[self.letterSprites count];i++)	{
		LetterSprite *sprite = [self.letterSprites objectAtIndex: i];
		CGPoint point = [[self.letterPositions objectAtIndex: i] CGPointValue];
		[sprite runAction: [MoveTo actionWithDuration: 0.2 position: point]];
	}
}

- (int) letterIndexForPosition:(CGPoint)point	{
	int i =0;
	for(NSValue *value in self.letterPositions)	{
		CGPoint letterPosition = [value CGPointValue];
		if (point.y > 20 && point.y<130)	{
			if (point.x < letterPosition.x)	{
				return i; 
			}
		}	else	{
			return -1;
		}
		i++;
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
	if (self.selectedLetter == nil) return kEventIgnored; 
	UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView: [touch view]];
    CGPoint convertedLocation = [[Director sharedDirector] convertCoordinate:location];
	[self.selectedLetter setPosition: convertedLocation];
	return kEventHandled;
} 

- (BOOL) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event { 
	if (self.selectedLetter == nil) return kEventIgnored; 
	UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView: [touch view]];
    CGPoint convertedLocation = [[Director sharedDirector] convertCoordinate:location];
	[self setSelectedLetterIndex: [self letterIndexForPosition: convertedLocation]];
	[self.selectedLetter unHighLight];
	self.selectedLetter = nil;
	return kEventHandled;
} 
@end
