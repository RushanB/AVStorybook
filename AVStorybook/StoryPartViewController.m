//
//  StoryPartViewController.m
//  AVStorybook
//
//  Created by Rushan on 2017-05-19.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "StoryPartViewController.h"

@interface StoryPartViewController () <UIImagePickerControllerDelegate, AVAudioPlayerDelegate, AVAudioPlayerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIButton *choosePicture;


@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *playAudio;

@property (nonatomic) AVAudioPlayer *audioPlayer;
@property (nonatomic) AVAudioRecorder *audioRecorder;

@end

@implementation StoryPartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imageView setUserInteractionEnabled:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (IBAction)recordButton:(UIButton *)sender {
    
}


- (IBAction)playButton:(UIButton *)sender {
}


@end
