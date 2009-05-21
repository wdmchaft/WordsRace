//
//  SpriteAdditions.h
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

@interface Sprite (Sprite_HitTest)

- (CGRect) rect;
- (BOOL) hitTest: (UITouch *)touch;
	
@end

@interface AtlasSprite (AtlasSprite_HitTest)

- (CGRect) rect;
- (BOOL) hitTest: (UITouch *)touch;

@end
