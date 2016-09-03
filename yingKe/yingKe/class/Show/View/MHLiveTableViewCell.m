//
//  MHLiveTableViewCell.m
//  yingKe
//
//  Created by ma c on 16/9/2.
//  Copyright © 2016年 DuanXN. All rights reserved.
//

#import "MHLiveTableViewCell.h"

@interface MHLiveTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;//小头像
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;//昵称
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;//城市
@property (weak, nonatomic) IBOutlet UILabel *onLineLabel;//在线人数
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;//大头像

@end

@implementation MHLiveTableViewCell

- (void)setLive:(MHLive *)live{
    _live = live;
    [_headImageView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
    [_bigImageView downloadImage:[NSString stringWithFormat:@"%@%@",IMAGE_HOST,live.creator.portrait] placeholder:@"default_room"];
    _nameLabel.text = live.creator.nick;
    _onLineLabel.text = [@(live.onlineUsers)stringValue];
    _locationLabel.text = live.city;
}

- (void)awakeFromNib {
//    self.headImageView.layer.cornerRadius = 25;
//    self.headImageView.layer.masksToBounds = YES;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
