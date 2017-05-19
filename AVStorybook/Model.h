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

@property (nonatomic) UIImage *anImage;
@property (nonatomic, assign) int pageIndex;
@property (nonatomic) NSURL *audioURL;

-(instancetype)initWithIndex:(int)index;

@end
