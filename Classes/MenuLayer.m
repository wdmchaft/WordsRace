//
//  MenuLayer.m
//  WordsRace
//
//  Created by Gabriel Flory on 23/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"
#import "GameLayer.h"


@implementation MenuLayer

@synthesize letterSpritesManager;
- (id) init
{
	self = [super init];
	if (self != nil) {
		self.letterSpritesManager = [AtlasSpriteManager spriteManagerWithFile: @"lettres.png"]; 	
		[self addChild: self.letterSpritesManager];
		[self setIsTouchEnabled: YES];
		[self drawMenu];
	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

- (void) drawMenu {
	int numbers[] = {22,14,17,3,18,-1,17,0,2,4};
	
	for (int i=0; i<10; i++)
	{		
		if (numbers[i] > -1)	{
		LetterSprite *letter = [LetterSprite letterSpriteWithManager:self.letterSpritesManager andLetter:@"A" andIndex: numbers[i]];
		CGPoint letterPosition = ccp((480 - (70*SMALL_SCALE)*10)/2 + i * (70*SMALL_SCALE) + (35*SMALL_SCALE),270-(((i-4.5)*(i-4.5)))*1);
		float angle = (i-4.5)*3;	
		[letter setPosition: letterPosition];
		[letter setRotation:angle];
		[letter setScale:SMALL_SCALE];
		[letter doValidAnim:i*0.1+1],
		[letter doNotValidAnim:(10-i)*0.1+1],
		[self.letterSpritesManager addChild: letter];
		}
	}
	
	[MenuItemFont setFontSize:20];
	[MenuItemFont setFontName:@"Helvetica"];
	MenuItem *start = [MenuItemFont itemFromString:@"Start Game"
											target:self
										  selector:@selector(startGame:)];
	Menu *menu = [Menu menuWithItems:start, nil];	
	[menu alignItemsVertically];
	[self addChild:menu];
	
}

-(void)startGame: (id)sender {
	Scene * GameScene = [Scene node];
	[[Director sharedDirector] replaceScene:[FadeTransition transitionWithDuration:0.5 scene: GameScene]];
	[GameScene addChild:[GameLayer node]];
}


@end
