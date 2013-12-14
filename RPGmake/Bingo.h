//
//  Bingo.h
//  RPGmake
//
//  Created by Paul Park on 12/8/13.
//  Copyright (c) 2013 Paul Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bingo : NSObject

@property (strong, nonatomic) NSString *letter;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) bingoLetters;
+ (NSUInteger) maxRank;

@end
