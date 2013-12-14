//
//  Bingo.m
//  RPGmake
//
//  Created by Paul Park on 12/8/13.
//  Copyright (c) 2013 Paul Park. All rights reserved.
//

#import "Bingo.h"

@implementation Bingo

- (NSString *) variableCalled
{
    NSArray *simpleRank = [Bingo simpleRank];
    return [simpleRank [self.rank] stringByAppendingString:self.letter];
}

@synthesize letter = _letter;

-(NSString *)letter
{
    return _letter ? _letter : @"?";
}

+(NSArray *)simpleRank
{
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
}

+ (NSArray *) bingoLetters
{
    return @[@"1",@"2",@"3",@"4",@"5"];
}

+(NSUInteger) maxRank
{
    return [[self simpleRank] count]-1;
}

-(void)setLetter:(NSString *)letter
{
    if([[Bingo bingoLetters]containsObject:letter]) {
        _letter = letter;
    }
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [Bingo maxRank]) {
        _rank = rank;
    }
}

@end
