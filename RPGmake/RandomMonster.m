//
//  RandomMonster.m
//  RPGmake
//
//  Created by Paul Park on 12/11/13.
//  Copyright (c) 2013 Paul Park. All rights reserved.
//

#import "RandomMonster.h"
#import "Character.h"

@implementation RandomMonster



-(Character *)randomMonster
{
    Character * randomMonster = [[Character alloc]init];
    [randomMonster setCharacterStatsHp:arc4random()%80-100 Mana:arc4random()%80-100 Atk:arc4random()%80-100 Def:arc4random()%80-100 Mpwr:arc4random()%80-100 Mdef:arc4random()%80-100];
    return self;

}



@end
