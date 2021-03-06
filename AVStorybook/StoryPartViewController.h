//
//  StoryPartViewController.h
//  AVStorybook
//
//  Created by Rushan on 2017-05-19.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "Model.h"

@interface StoryPartViewController : UIViewController <UIImagePickerControllerDelegate, AVAudioRecorderDelegate, UINavigationBarDelegate>

@property (nonatomic) Model *thisPage;

@end
