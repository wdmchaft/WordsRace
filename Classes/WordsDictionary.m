//
//  WordsDictionary.m
//  WordsRace
//
//  Created by Sébastien Flory on 23/05/09.
//  Copyright 2009 Boostr. All rights reserved.
//

#import "WordsDictionary.h"


@implementation WordsDictionary

@synthesize words;

static WordsDictionary *sharedInst = nil;

- (id)init
{
    if ( sharedInst != nil )
	{
        [NSException raise:NSInternalInconsistencyException
					format:@"[%@ %@] cannot be called; use +[%@ %@] instead",
		NSStringFromClass([self class]), NSStringFromSelector(_cmd), 
		NSStringFromClass([self class]),
		NSStringFromSelector(@selector(sharedInstance))];
	} else if ( self = [super init] ) {
		sharedInst = self;

		self.words = [NSMutableArray arrayWithCapacity: 5000];
		
		// Load the file
		NSString *path = [[NSBundle mainBundle] pathForResource: @"ods4" ofType: @"txt"];
		NSString *list = [NSString stringWithContentsOfFile: path];
		NSArray *tmpArray = [list componentsSeparatedByString: @"\n"];
		
		for(NSString *word in tmpArray)
		{
			// TODO: use a #define for the max letters in the whole game.
			if ( [word length] > 1 && [word length] <= 6 )
			{
				[words addObject: word];
			}
		}
	}
	
	return sharedInst;
}
	
- (void) dealloc
{
	[self.words release];
	[super dealloc];
}

+ (WordsDictionary*)sharedInstance
{
	if ( sharedInst == nil )
	{
            [[self alloc] init];
	}
	
    return sharedInst;
}

- (BOOL) isValidWord: (Word*) word
{
	BOOL valid = [self.words containsObject: [word description]];
	
	NSLog(@"Checking %@... is valid ? [%d]", word, valid);
	
	return valid;
}

/*- (NSString) getRandomWord: (int)letterQty {
	NSMutableArray *matchingWords =[NSMutableArray arrayWithCapacity:1000];
	for (NSString *word in self.words)	{
		if ( [word length] == letterQty ) {
			[matchingWords addObject: word];
		}
	}
	int num = rand()%[matchingWords count];
	return [matchingWords objectAtIndex:num];
}*/
@end
