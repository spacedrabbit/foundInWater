//
//  lotto.m
//  RPGmake
//
//  Created by Paul Park on 12/8/13.
//  Copyright (c) 2013 Paul Park. All rights reserved.
//

#import "lotto.h"

@implementation lotto

-(lotto *) lottoGame
{
    double lottoNumber = arc4random()%10000;
    double selectedNumber;
    scanf("%lf", selectedNumber);
    
    if (selectedNumber == lottoNumber) {
        NSLog(@"You're a winner");
    }else{
        NSLog(@"you're a loser");
    }
    return 0;
}


@end
