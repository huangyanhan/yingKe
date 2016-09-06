//
//  MHLiveChatViewController.m
//  yingKe
//
//  Created by ma c on 16/9/6.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHLiveChatViewController.h"

@interface MHLiveChatViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *liveSeeLabel;

@end

@implementation MHLiveChatViewController

- (void)setLive:(MHLive *)live{
    _live = live;
   [self.iconImage downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.iconImage.layer.cornerRadius = 15;
    self.iconImage.layer.masksToBounds = YES;
    [NSTimer scheduledTimerWithTimeInterval:1 block:^(NSTimer * _Nonnull timer) {
        self.liveSeeLabel.text = [NSString stringWithFormat:@"%d",arc4random_uniform(10000)];
    } repeats:YES ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
