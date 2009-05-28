//
//  MenuLayer.h
//  WordsRace
//
//  Created by Gabriel Flory on 23/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "LetterSprite.h"

@interface MenuLayer : Layer {
	AtlasSpriteManager *letterSpritesManager;
}

@property (retain) AtlasSpriteManager *letterSpritesManager;

- (void) drawMenu;

@end
