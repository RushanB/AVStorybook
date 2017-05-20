//
//  MyPageViewController.m
//  AVStorybook
//
//  Created by Rushan on 2017-05-20.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "MyPageViewController.h"
#import "StoryPartViewController.h"
#import "Model.h"

@interface MyPageViewController () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property(nonatomic) NSMutableArray *pageArray;
@property (nonatomic, strong) NSArray *storyViewArray;

@end

@implementation MyPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = self;
    self.delegate = self;
    
    StoryPartViewController *s1 = [self.storyboard instantiateViewControllerWithIdentifier:@"story"];
    StoryPartViewController *s2 = [self.storyboard instantiateViewControllerWithIdentifier:@"story"];
    StoryPartViewController *s3 = [self.storyboard instantiateViewControllerWithIdentifier:@"story"];
    StoryPartViewController *s4 = [self.storyboard instantiateViewControllerWithIdentifier:@"story"];
    StoryPartViewController *s5 = [self.storyboard instantiateViewControllerWithIdentifier:@"story"];
    
    self.storyViewArray = @[s1, s2, s3, s4, s5];
    self.pageArray = [NSMutableArray new];
    
    for(int i=0; i<5 ; i++) {
        Model *newPage = [[Model alloc] initWith:i];
        [self.pageArray addObject:newPage];
    }
    
    [s1 setThisPage:self.pageArray[0]];
    [self setViewControllers:@[self.storyViewArray[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished){
    }];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    StoryPartViewController *currentPage = (StoryPartViewController *)viewController;
    
    int currentPageN = [currentPage.thisPage getPage];
    
    switch (currentPageN) {
        case 0:
            return nil;
        default:{
            Model *prevPage = [self.pageArray objectAtIndex:currentPageN-1];
            [self.storyViewArray[currentPageN-1] setThisPage:prevPage];
            return self.storyViewArray[currentPageN-1];
            break;
        }
    }
    
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    StoryPartViewController *currentPage = (StoryPartViewController *)viewController;
    
    int currentPageN = [currentPage.thisPage getPage];
    
    switch (currentPageN) {
        case 0:
            return nil;
            break;
        default:{
            Model *nextPage = [self.pageArray objectAtIndex:currentPageN+1];
            [self.storyViewArray[currentPageN+1] setThisPage:nextPage];
            return self.storyViewArray[currentPageN+1];
            break;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
