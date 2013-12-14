//
//  BingoCaller.m
//  RPGmake
//
//  Created by Paul Park on 12/8/13.
//  Copyright (c) 2013 Paul Park. All rights reserved.
//

#import "BingoCaller.h"
@interface BingoCaller ()

@property (strong, nonatomic)NSMutableArray *lottoNumbers;

@end

@implementation BingoCaller

-(NSMutableArray *)lottoNumbers
{
    if (!_lottoNumbers) {
        _lottoNumbers = [[NSMutableArray alloc]init];
    
    }
    return _lottoNumbers;
}

-(Lotto *) drawRandomNumbers
{
    Lotto *randomNumber = nil;
    if ([self.lottoNumbers count]) {
        unsigned index = arc4random()%[self.lottoNumbers count];
        randomNumber = self.lottoNumbers[index];
        [self.lottoNumbers removeObjectAtIndex:index];
    }
    return randomNumber;
}

@end
