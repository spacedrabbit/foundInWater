//
//  Character.h
//  RPGmake
//
//  Created by Paul Park on 12/8/13.
//  Copyright (c) 2013 Paul Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject

@property int healthPoints;
@property int manaPoints;
@property int attackPower;
@property int defensePower;
@property int magicPower;
@property int magicDefense;
@property int experiencePoints;


-(void)randomMonster:(Character *)f;
-(void)magicAttack:(Character *)f;
-(void)attackPlayer:(Character *)f;
-(void)heal;
-(void) setCharacterStatsHp:(int)Hp Mana:(int)Mp  Atk:(int)Ad Def:(int)Dp Mpwr:(int)Md Mdef: (int)Mr;
-(void)fightSequence:(Character *)f;
-(void)listStats;
-(void)dmgCalc;
-(void)expGain:(Character *)f;
-(void)gameEncounter:(Character *)f;



@end
