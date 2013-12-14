//
//  Lotto.m
//  RPGmake
//
//  Created by Paul Park on 12/8/13.
//  Copyright (c) 2013 Paul Park. All rights reserved.
//

#import "Lotto.h"

@implementation Lotto

-(int)winner:(NSArray *)tickets
{
    int money = 0;
    
    for (Lotto *lotto in tickets) {
        if ([lotto.variableCalled isEqualToString:self.variableCalled]){
            money = 5;
        }
    }
    return money;
}

@end
