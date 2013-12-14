//
//  Character.m
//  RPGmake
//
//  Created by Paul Park on 12/8/13.
//  Copyright (c) 2013 Paul Park. All rights reserved.
//

#import "Character.h"


@implementation Character

// Generate random stats for monster----------------------------------------
-(void)randomMonster:(Character *)f
{
    //This Range does not work properly process of fixing it soon.
    int hpMax = MAX(150, 450);
    int mpMax = MAX(30, 80);
    int atkMax = MAX(10, 25);
    int defMax = MAX(10, 25);
    int mpwrMax = MAX(10, 25);
    int mdefMax = MAX(10, 25);
    
    [f setCharacterStatsHp:arc4random()%hpMax Mana:arc4random()%mpMax Atk:arc4random()%atkMax Def:arc4random()%defMax Mpwr:arc4random()%mpwrMax Mdef:arc4random()%mdefMax];
   
}
// Generate random stats for monster-----------------------------------------^

// Set Character stats ------------------------------------------------------
-(void) setCharacterStatsHp:(int)Hp Mana:(int)Mp  Atk:(int)Ad Def:(int)Dp Mpwr:(int)Md Mdef: (int)Mr;
{
    _healthPoints = Hp;
    _manaPoints = Mp;
    _attackPower = Ad;
    _defensePower = Dp;
    _magicPower = Md;
    _magicDefense = Mr;


}
//----------------------------------------------------------------------------^

// Print stats ---------------------------------------------------------------
-(void)listStats
{
    NSLog(@"\n Hp: %i \n Mp: %i \n Atk: %i \n Def: %i \n Matk: %i \n Mdef: %i", self.healthPoints, self.manaPoints, self.attackPower, self.defensePower, self.magicPower, self.magicDefense);
}
//----------------------------------------------------------------------------^

-(void)dmgCalc
{
    Character * f =[[Character alloc] init];
    int atkMod = arc4random() %10;
    int atkMod2 = arc4random() %5;
    if (self.attackPower > 20) {
        f.healthPoints = (f.healthPoints+f.defensePower) - (self.attackPower+atkMod);
    }else {
        f.healthPoints = (f.healthPoints +f.defensePower)-(self.attackPower+atkMod2);
    }
    
}

//Attack Mech-----------------------------------------------------------------

-(void)attackPlayer:(Character *)f;
{
    int critChance = arc4random()%99+1;
    if (critChance <= 25) {
        if (self.attackPower >30) {
            NSLog(@"Critical hard!");
            if (f.defensePower >= self.attackPower) {
                f.healthPoints = f.healthPoints-(1*critChance);
                NSLog(@"Defense is too great");
            } else {
                if (self.attackPower >30) {
                    int atkMod = arc4random()%10+1;
                    f.healthPoints= (f.healthPoints +f.defensePower)-(self.attackPower*atkMod);
                    NSLog(@"Crit damage for %i", (self.attackPower*atkMod)-f.defensePower);
                } else {
                    int atkMod2 = arc4random()%5+1;
                    f.healthPoints = (f.healthPoints +f.defensePower)-(self.attackPower*atkMod2);
                    NSLog(@"Crit damage for %i", (self.attackPower*atkMod2)-f.defensePower);
                }
            }
        } else if (self.attackPower <30) {
            NSLog(@"Critical hit!");
            if (f.defensePower>=self.attackPower) {
                f.healthPoints = f.healthPoints-(1*critChance);
                NSLog(@"Defense is too hight");
            }else {
                if (self.attackPower > 10) {
                    int atkMod = arc4random()%5+1;
                    f.healthPoints = (f.healthPoints + f.defensePower)-(self.attackPower*atkMod);
                    NSLog(@"Crit damage for %i", (self.attackPower*atkMod)-f.defensePower);
                }else{
                    int atkMod2 = arc4random()%3+1;
                    f.healthPoints = (f.healthPoints + f.defensePower)-(self.attackPower*atkMod2);
                }
            }
        }
    } else {
    if (self.attackPower >30) {
            if(f.defensePower >= self.attackPower) {
                f.healthPoints = f.healthPoints-1;
                NSLog(@"Defense is too great!");
            }else {
                if (self.attackPower > 30) {
                    int atkMod = arc4random() %10+1;
                    f.healthPoints = (f.healthPoints+f.defensePower) - (self.attackPower+atkMod);
                    NSLog(@"You damage for %i", (self.attackPower+atkMod) - f.defensePower );
                }else {
                    int atkMod2 = arc4random() %5+1;
                    f.healthPoints = (f.healthPoints +f.defensePower)-(self.attackPower+atkMod2);
                    NSLog(@"You damage for %i", (self.attackPower+atkMod2) - f.defensePower);
                }
            }
        }
    }
}
//----------------------------------------------------------------------------^

//Heal is broken must fix-----------------------------------------------------
-(void)heal
{
    self.healthPoints = self.healthPoints + 20;

}
//-----------------------------------------------------------------------------^

//Magic attack mech------------------------------------------------------------
-(void)magicAttack:(Character *)f
{
    if (self.manaPoints >=10) {
        if (f.magicDefense >= self.magicPower) {
            f.healthPoints = f.healthPoints-1;
            NSLog(@"Magic Defense is too great!");
        }else{
            if (self.magicPower > 20) {
                int magMod = (arc4random()%3)+1;
                f.healthPoints = (f.healthPoints + f.magicDefense) - self.magicPower*magMod;
                NSLog(@"Magic Damage for %i", self.magicPower*magMod);
            }else{
                int magMod2 = arc4random()%10;
                f.healthPoints = (f.healthPoints + f.magicDefense) - self.magicPower+magMod2;
                NSLog(@"Magic Damage for %i", self.magicPower+magMod2);
            }
            
        }
        self.manaPoints = (self.manaPoints - 10);
        
    }else{
        NSLog(@"You don't enough have mana");
    }
    
}
//-----------------------------------------------------------------------------^

//Fight Sequence----------------------------------------------------------------
-(void)fightSequence:(Character *)f
{
    
    while (f.healthPoints >= 0) {
        if (self.healthPoints <= 0) {
            NSLog(@"You have died a dishonorable death. Game over");
            break;
        }else{
            NSLog(@"What do you do 1. Attack 2. Heal 3.Magic 4.Inventory 5.Run");
            int b;
            int c = arc4random()%3;
            scanf("%i", &b);
            
            if (b == 1) {
                if (c == 0) {
                    NSLog(@"Monster Attacks!");
                    [f attackPlayer:self];
                    NSLog(@"You have %i hp", self.healthPoints);
                }else if (c == 1) {
                    [f heal];
                    NSLog(@"Monster heals and has %i", f.healthPoints);
                }else{
                    NSLog(@"Monster does Magic!");
                    [f magicAttack:self];
                    NSLog(@"You have %i hp", self.healthPoints);                }
                NSLog(@"You attack!");
                [self attackPlayer:f];
                NSLog(@"Monster has %i hp", f.healthPoints);
            }else if (b == 2) {
                if (c == 0) {
                    NSLog(@"Monster Attacks!");
                    [f attackPlayer:self];
                    NSLog(@"You have %i hp",self.healthPoints);
                }else if (c == 1) {
                    [f heal];
                    NSLog(@"Monster heals and has %i", f.healthPoints);
                }else{
                    NSLog(@"Monster does Magic");
                    [f magicAttack:self];
                    NSLog(@"You have %i hp", self.healthPoints);                }
                [self heal];
                NSLog(@"You heal to %i", self.healthPoints);
            }else if (b == 3) {
                if (c == 0) {
                    NSLog(@"Monster Attacks!");
                    [f attackPlayer:self];
                    NSLog(@"You have %i hp", self.healthPoints);
                }else if (c == 1) {
                    [f heal];
                    NSLog(@"Monster heals and has %i", f.healthPoints);
                }else{
                    NSLog(@"Monster does magic!");
                    [f magicAttack:self];
                    NSLog(@"You have %i hp", self.healthPoints);
                }
                NSLog(@"You attack with Magic!");
                [self magicAttack:f];
                NSLog(@"You have %i mana, Monster has %i hp", self.manaPoints, f.healthPoints);
            }
        }
    }
}

//----------------------------------------------------------------------------^

//ExperiencePoints working on it----------------------------------------------
-(void)expGain:(Character *)f
{
    self.experiencePoints = self.experiencePoints+(f.healthPoints+f.defensePower+f.attackPower+f.defensePower+f.magicDefense+f.magicPower)/2.25;
}
//----------------------------------------------------------------------------

//Game Encounter--------------------------------------------------------------
-(void)gameEncounter:(Character *)f
{
    NSLog(@"Your Stats");
    [self listStats];
    NSLog(@"Monster Stats:");
    [f listStats];
    [self expGain:f];
    [self fightSequence:f];

}
//----------------------------------------------------------------------------^


@end
