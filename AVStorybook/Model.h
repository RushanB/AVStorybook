//
//  Model.h
//  AVStorybook
//
//  Created by Rushan on 2017-05-19.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@import AVFoundation;

@interface Model : NSObject

-(instancetype)initWith:(int)page;

-(void)setAudioFilePath:(NSURL *)audioFilePath;
-(void)setImageFilePath:(NSURL *)imageFilePath;
-(int)getPage;

-(NSURL *)getAudioFilePath;
-(NSURL *)getImageFilePath;

@end
