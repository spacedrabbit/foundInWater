//
//  main.m
//  RPGmake
//
//  Created by Paul Park on 12/8/13.
//  Copyright (c) 2013 Paul Park. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"


int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        //Start of program
        NSLog(@"Welcome! choose your class! 1. Warrior 2. Mage 3. Rogue ");
        int a;
        scanf("%i", &a);
      
        //Make character classes
        Character * warrior = [[Character alloc]init];
        Character * mage = [[Character alloc]init];
        Character * rogue = [[Character alloc]init];
        [warrior setCharacterStatsHp:175 Mana:20 Atk:35 Def:75 Mpwr:10 Mdef:10];
        [mage setCharacterStatsHp:80 Mana:120 Atk:5 Def:10 Mpwr:90 Mdef:40];
        [rogue setCharacterStatsHp:95 Mana:55 Atk:55 Def:25 Mpwr:25 Mdef:10];
     
        //Generate monster to fight
        Character * monster = [[Character alloc] init];
        [monster randomMonster:monster];
        
        if (a == 1) {
            NSLog(@"Warrior you are about to engage a monster");
            [warrior gameEncounter:monster];
            
        } else if (a == 2) {
            NSLog(@"Mage you are about to engage a monster");
            [mage gameEncounter:monster];
            
        }else if (a == 3) {
            NSLog(@"Rogue you are about to engage a monster");
            [rogue gameEncounter:monster];
        } else {
            NSLog(@"Invalid Number Please choose");
            scanf("%i", &a);
        }
        if (a==1) {
             NSLog(@"You gained %i exp", warrior.experiencePoints);
        } else if (a==2) {
            NSLog(@"You gained %i exp", mage.experiencePoints);
        }else{
            NSLog(@"You gained %i exp", rogue.experiencePoints);
        }
       
        NSLog(@"You have won!");
     
        NSLog(@"Fight another? 1. Yes");
        int b;
        scanf("%i", &b);
        if (a==1 & b ==1) {
            NSLog(@"Current Exp %i", warrior.experiencePoints);
            [monster randomMonster:monster];
            NSLog(@"Get ready for another fight");
            [warrior gameEncounter:monster];
        } else if (a==2 & b == 1) {
            NSLog(@"Current Exp %i", mage.experiencePoints);
            [monster randomMonster:monster];
            NSLog(@"Get ready for another fight");
            [mage gameEncounter:monster];
        }
        
        NSLog(@"You have %i exp", warrior.experiencePoints);
    }
    
    
    return 0;
}

