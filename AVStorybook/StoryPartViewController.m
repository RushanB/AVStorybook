//
//  StoryPartViewController.m
//  AVStorybook
//
//  Created by Rushan on 2017-05-19.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "StoryPartViewController.h"

@interface StoryPartViewController () 

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;
@property (weak, nonatomic) IBOutlet UILabel *pageLabel;

@property (nonatomic, strong) UIImagePickerController *imagePicker;
//@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *playAudio;

@property (nonatomic) AVAudioSession *session;
@property (nonatomic) AVAudioRecorder *audioRecorder;
@property (nonatomic) AVAudioPlayer *audioPlayer;

-(IBAction)getCamera:(id)sender;

@end

@implementation StoryPartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.cameraButton setTitle:@"Get Picture" forState:UIControlStateNormal];
    [self.recordButton setTitle:@"Record Audio" forState:UIControlStateNormal];
    
    if(!self.thisPage) {
        self.thisPage = [Model new]; //new model
    }
    self.pageLabel.text = [NSString stringWithFormat:@"%i", [self.thisPage getPage]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)viewDidAppear:(BOOL)animated{
    [self.audioPlayer stop];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    if(self.imagePicker.sourceType == UIImagePickerControllerSourceTypeCamera){
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil); //save img
    }
    
    if(!self.thisPage) {
        [self.thisPage setImageFilePath: [info objectForKey:UIImagePickerControllerMediaURL]];
    }
    
    self.imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    if(flag){
        [self.thisPage setAudioFilePath:recorder.url];
    }else{
        NSLog(@"Unable to record audio");
    }
}

-(void)playAudio{
    if([self.audioPlayer isPlaying]){
        [self.audioPlayer stop];
    }else{
        self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[self.thisPage getAudioFilePath] error:nil];
        [self.audioPlayer play];
    }
}
- (IBAction)getCamera:(UIButton *)sender {
    self.imagePicker = [[UIImagePickerController alloc]init];
    self.imagePicker.delegate = self;
    self.imagePicker.allowsEditing = YES;
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    self.imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:self.imagePicker.sourceType];
    [self presentViewController:self.imagePicker animated:NO completion:nil]; //present the view
}

- (IBAction)recordAudio:(UIButton *)sender {
    if([self.recordButton.titleLabel.text isEqualToString:@"Start Recording"]){
        [self.recordButton setTitle:@"Stop Recording" forState:UIControlStateNormal];
        
        //document path
        NSString *directoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE)[0];
        NSString *recordingName = @"avstorybookaudio_";
        recordingName = [recordingName stringByAppendingString:[NSString stringWithFormat:@"%i",[self.thisPage getPage]]];
        NSArray *pathArray = @[directoryPath, recordingName];
        NSURL *filePath = [NSURL fileURLWithPathComponents:pathArray];
        
        self.session = [AVAudioSession sharedInstance];
        [self.session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
        
        NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];  //holds record settings
        
        [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
        [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
        [recordSetting setValue:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
        [recordSetting setValue:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
        [recordSetting setValue:[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
        [recordSetting setValue:[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];
        
        //create recorder
        self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:filePath settings:recordSetting error:nil];
        self.audioRecorder.delegate = self;
        self.audioRecorder.meteringEnabled = YES;
        [self.audioRecorder prepareToRecord];
        [self.audioRecorder record];
    }else{
        [self.recordButton setTitle:@"Record Audio" forState:UIControlStateNormal];
        [self.audioRecorder stop];
        [self.session setActive:NO error:nil];
    }
}

- (IBAction)tapDetected:(UITapGestureRecognizer *)sender {
    [self playAudio];
}


@end
