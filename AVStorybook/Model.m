//
//  Model.m
//  AVStorybook
//
//  Created by Rushan on 2017-05-19.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "Model.h"

@interface Model()

@property (nonatomic) NSURL *audioFilePath;
@property (nonatomic) NSURL *imageFilePath;
@property (nonatomic) int page;

@end

@implementation Model

-(instancetype)init{
    if(self = [super init]){
        _audioFilePath = [NSURL new];
        _imageFilePath = [NSURL new];
        _page = -1;
    }
    return self;
}

-(instancetype)initWith:(int)page{
    if(self = [super init]){
        _audioFilePath = [NSURL new];
        _imageFilePath = [NSURL new];
        _page = page;
    }
    return self;
}

-(void)setAudioFilePath:(NSURL *)audioFilePath{
    _audioFilePath = audioFilePath;
}

-(void)setImageFilePath:(NSURL *)imageFilePath{
    _imageFilePath = imageFilePath;
}

-(int)getPage{
    return _page;
}

-(NSURL *)getAudioFilePath{
    return _audioFilePath;
}

-(NSURL *)getImageFilePath{
    return _imageFilePath;
}

@end
