//
//  SpriteAdditions.m
//  WordsRace
//
//  Created by Gabriel Flory on 21/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SpriteAdditions.h"


@implementation Sprite (Sprite_HitTest)

- (CGRect) rect	{
	CGRect myRect = CGRectMake(position.x - (transformAnchor.x * scaleX), position.y - (transformAnchor.y * scaleY), self.contentSize.width * scaleX, self.contentSize.height * scaleY);
	
	return myRect;
}

- (BOOL) hitTest: (UITouch *)touch	{
	CGRect rect = [self rect];
	CGPoint point = [touch locationInView: [touch view]];
	point = [[Director sharedDirector] convertCoordinate: point];
	
	return CGRectContainsPoint(rect, point);
}

@end

@implementation AtlasSprite (AtlasSprite_HitTest)

- (CGRect) rect	{
	CGRect myRect = CGRectMake(position.x - (transformAnchor.x * scaleX), position.y - (transformAnchor.y * scaleY), self.contentSize.width * scaleX, self.contentSize.height * scaleY);
	
	return myRect;
}

- (BOOL) hitTest: (UITouch *)touch	{
	CGRect rect = [self rect];
	CGPoint point = [touch locationInView: [touch view]];
	point = [[Director sharedDirector] convertCoordinate: point];
	
	return CGRectContainsPoint(rect, point);
}

@end
