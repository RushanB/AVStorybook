//
//  Model.m
//  AVStorybook
//
//  Created by Rushan on 2017-05-19.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "Model.h"

@implementation Model

-(instancetype)initWithIndex:(int)index{
    if(self = [super init]){
        
        _pageIndex = index;
        
        NSString *audioURL = [NSString stringWithFormat:@"ProjectAudioFile%i.m4a", index];
        
        NSArray *pathComponents = [NSArray arrayWithObjects:
                                   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject], audioURL, nil];
        
        self.audioURL = [NSURL fileURLWithPathComponents:pathComponents];
    }
    return self;
}


@end
