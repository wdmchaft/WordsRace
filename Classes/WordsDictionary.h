//
//  WordsDictionary.h
//  WordsRace
//
//  Created by Sébastien Flory on 23/05/09.
//  Copyright 2009 Boostr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

@interface WordsDictionary : NSObject {
	NSMutableArray *words;
}

@property (retain) NSMutableArray *words;

+ (WordsDictionary*)sharedInstance;
- (BOOL) isValidWord: (Word*) word;

@end
