//
//  Lotto.h
//  RPGmake
//
//  Created by Paul Park on 12/8/13.
//  Copyright (c) 2013 Paul Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lotto : NSObject

@property (strong, nonatomic) NSString * variableCalled;

- (int)winner:(NSArray *)tickets;

@end
