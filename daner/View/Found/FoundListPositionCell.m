//
//  FoundListPositionCell.m
//  daner
//
//  Created by dnaer7 on 2018/10/25.
//  Copyright © 2018 dnaer7. All rights reserved.
//

#import "FoundListPositionCell.h"
#import "ZSConfig.h"
#import "UILabel+String.h"
@implementation FoundListPositionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UIImageView *)BGImage{
    if (!_BGImage) {
        _BGImage = [[UIImageView alloc]init];
        _BGImage.image = [UIImage imageNamed:@"map_icon"];
        _BGImage.userInteractionEnabled = YES;
    }
    return _BGImage;
}
-(UIButton *)headBtn{
    if (!_headBtn) {
        _headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_headBtn setImage:[UIImage imageNamed:@"head_icon"] forState:UIControlStateNormal];
        [_headBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
        [_headBtn.layer setBorderWidth:1];
        [_headBtn.layer setCornerRadius:20];
        [_headBtn.layer setMasksToBounds:YES];
        
    }
    return _headBtn;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"往事随风";
        _nameLabel.font = [UIFont boldSystemFontOfSize:13];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = DSColorFromHex(0x464646);
    }
    return _nameLabel;
}
-(UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.text = @"5分钟前";
        _dateLabel.font = [UIFont systemFontOfSize:13];
        _dateLabel.textAlignment = NSTextAlignmentLeft;
        _dateLabel.textColor = DSColorFromHex(0x464646);
    }
    return _dateLabel;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"上海·人民广场";
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = DSColorFromHex(0x969595);
    }
    return _titleLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.text = @"提到了:风息神泪、花花世界、阳光旅人";
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.textColor = DSColorFromHex(0x658AB3);
        
    }
    return _contentLabel;
}
-(UIButton *)musicBtn{
    if (!_musicBtn) {
        _musicBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_musicBtn setImage:[UIImage imageNamed:@"music_found"] forState:UIControlStateNormal];
        [_musicBtn setImage:[UIImage imageNamed:@"music_found"] forState:UIControlStateSelected];
        [_musicBtn addTarget:self action:@selector(pressMusic) forControlEvents:UIControlEventTouchUpInside];
    }
    return _musicBtn;
}
-(UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreBtn setImage:[UIImage imageNamed:@"more_black"] forState:UIControlStateNormal];
        [_moreBtn setImage:[UIImage imageNamed:@"more_black"] forState:UIControlStateSelected];
        [_moreBtn addTarget:self action:@selector(pressMore) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}
-(UIButton *)playBtn{
    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setImage:[UIImage imageNamed:@"stop_gray"] forState:UIControlStateNormal];
        [_playBtn setImage:[UIImage imageNamed:@"play_gray"] forState:UIControlStateSelected];
        [_playBtn addTarget:self action:@selector(pressPlay:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}
-(UILabel *)musicLabel{
    if (!_musicLabel) {
        _musicLabel = [[UILabel alloc]init];
        _musicLabel.text = @"12''";
        _musicLabel.font = [UIFont systemFontOfSize:10];
        _musicLabel.textAlignment = NSTextAlignmentRight;
        _musicLabel.textColor = DSColorFromHex(0x969696);
        
    }
    return _musicLabel;
}

-(UIButton *)likeBtn{
    if (!_likeBtn) {
        _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_likeBtn setImage:[UIImage imageNamed:@"like_found"] forState:UIControlStateNormal];
        [_likeBtn setImage:[UIImage imageNamed:@"like_selected"] forState:UIControlStateSelected];
        [_likeBtn addTarget:self action:@selector(pressLike:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeBtn;
}
-(UIButton *)zanBtn{
    if (!_zanBtn) {
        _zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zanBtn setImage:[UIImage imageNamed:@"like_found"] forState:UIControlStateNormal];
        [_zanBtn setImage:[UIImage imageNamed:@"like_selected"] forState:UIControlStateSelected];
        [_zanBtn addTarget:self action:@selector(pressZan:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zanBtn;
}
-(UIButton *)hateBtn{
    if (!_hateBtn) {
        _hateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_hateBtn setImage:[UIImage imageNamed:@"nolike_found"] forState:UIControlStateNormal];
        [_hateBtn setImage:[UIImage imageNamed:@"nolike_found_selected"] forState:UIControlStateSelected];
        [_hateBtn addTarget:self action:@selector(pressHate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _hateBtn;
}
-(UIButton *)shareBtn{
    if (!_shareBtn) {
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareBtn setImage:[UIImage imageNamed:@"share_icon"] forState:UIControlStateNormal];
        [_shareBtn setImage:[UIImage imageNamed:@"share_icon"] forState:UIControlStateSelected];
        [_shareBtn addTarget:self action:@selector(pressShare) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}
-(UIButton *)messageBtn{
    if (!_messageBtn) {
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageBtn setImage:[UIImage imageNamed:@"message_icon"] forState:UIControlStateNormal];
        [_messageBtn setImage:[UIImage imageNamed:@"message_icon"] forState:UIControlStateSelected];
        [_messageBtn addTarget:self action:@selector(pressMessage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageBtn;
}
-(UILabel *)likeLabel{
    if (!_likeLabel) {
        _likeLabel = [[UILabel alloc]init];
        _likeLabel.text = @"1.2w";
        _likeLabel.font = [UIFont systemFontOfSize:13];
        _likeLabel.textAlignment = NSTextAlignmentLeft;
        _likeLabel.textColor = DSColorFromHex(0x454545);
    }
    return _likeLabel;
}
-(UILabel *)zanLabel{
    if (!_zanLabel) {
        _zanLabel = [[UILabel alloc]init];
        _zanLabel.text = @"153";
        _zanLabel.font = [UIFont systemFontOfSize:12];
        _zanLabel.textAlignment = NSTextAlignmentLeft;
        _zanLabel.textColor = DSColorFromHex(0x454545);
    }
    return _zanLabel;
}
-(UILabel *)hateLabel{
    if (!_hateLabel) {
        _hateLabel = [[UILabel alloc]init];
        _hateLabel.text = @"535";
        _hateLabel.font = [UIFont systemFontOfSize:13];
        _hateLabel.textAlignment = NSTextAlignmentLeft;
        _hateLabel.textColor = DSColorFromHex(0x454545);
    }
    return _hateLabel;
}
-(UILabel *)shareLabel{
    if (!_shareLabel) {
        _shareLabel = [[UILabel alloc]init];
        _shareLabel.text = @"642";
        _shareLabel.font = [UIFont systemFontOfSize:13];
        _shareLabel.textAlignment = NSTextAlignmentLeft;
        _shareLabel.textColor = DSColorFromHex(0x454545);
    }
    return _shareLabel;
}
-(UILabel *)messageLabel{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc]init];
        _messageLabel.text = @"125";
        _messageLabel.font = [UIFont systemFontOfSize:13];
        _messageLabel.textAlignment = NSTextAlignmentLeft;
        _messageLabel.textColor = DSColorFromHex(0x454545);
    }
    return _messageLabel;
}
-(UIImageView *)lineImage{
    if (!_lineImage) {
        _lineImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"comment_up"]];
    }
    return _lineImage;
}
-(UILabel *)lineLabel{
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc]init];
        _lineLabel.backgroundColor = DSColorFromHex(0xDCDCDC);
    }
    
    return  _lineLabel;
}
-(UIButton *)reviewerBtn{
    if (!_reviewerBtn) {
        _reviewerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_reviewerBtn setImage:[UIImage imageNamed:@"head2"] forState:UIControlStateNormal];
        [_reviewerBtn.layer setCornerRadius:20];
        [_reviewerBtn.layer setMasksToBounds:YES];
    }
    return _reviewerBtn;
}
-(UILabel *)reviewerName{
    if (!_reviewerName) {
        _reviewerName = [[UILabel alloc]init];
        _reviewerName.text = @"风息神泪";
        _reviewerName.font = [UIFont boldSystemFontOfSize:13];
        _reviewerName.textAlignment = NSTextAlignmentLeft;
        _reviewerName.textColor = DSColorFromHex(0x454545);
    }
    return _reviewerName;
}
-(UILabel *)commentLabel{
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc]init];
        _commentLabel.text = @"现在的数据安全问题确实比较严重。";
        _commentLabel.font = [UIFont systemFontOfSize:13];
        _commentLabel.textAlignment = NSTextAlignmentLeft;
        _commentLabel.textColor = DSColorFromHex(0x454545);
    }
    return _commentLabel;
}
-(UIView *)BGView{
    if (!_BGView) {
        _BGView = [[UIView alloc]init];
        [_BGView.layer setBorderColor:DSColorFromHex(0xDCDCDC).CGColor];
        [_BGView.layer  setBorderWidth:1];
        [_BGView.layer setMasksToBounds:YES];
        [_BGView.layer setCornerRadius:3];
    }
    return _BGView;
}
-(UIButton *)fouceBtn{
    if (!_fouceBtn) {
        _fouceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_fouceBtn setImage:[UIImage imageNamed:@"fouce_add"] forState:UIControlStateNormal];
        [_fouceBtn setImage:[UIImage imageNamed:@"fouce_dui"] forState:UIControlStateSelected];
        [_fouceBtn addTarget:self action:@selector(pressFouce:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _fouceBtn;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self  addSubview:self.BGImage];
        [self addSubview:self.headBtn];
        [self addSubview:self.nameLabel];
        [self addSubview:self.dateLabel];
        [self  addSubview:self.titleLabel];
        [self  addSubview:self.contentLabel];
        [self  addSubview:self.likeBtn];
        [self  addSubview:self.likeLabel];
        [self  addSubview:self.hateBtn];
        [self  addSubview:self.hateLabel];
        [self  addSubview:self.shareBtn];
        [self  addSubview:self.shareLabel];
        [self  addSubview:self.messageBtn];
        [self  addSubview:self.messageLabel];
        [self addSubview:self.lineImage];
        [self addSubview:self.reviewerBtn];
        [self addSubview:self.reviewerName];
        [self addSubview:self.commentLabel];
        [self addSubview:self.zanBtn];
        [self addSubview:self.zanLabel];
         [self addSubview:self.fouceBtn];
        [self addSubview:self.lineLabel];
        [self addSubview:self.lineImage];
        [self addSubview:self.moreBtn];
        [self setContentLayout];
    }
    return self;
}
-(void)setContentLayout{
    
    [self.headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(13);
         make.top.equalTo(self).offset(13);
        make.width.height.mas_equalTo(40);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headBtn.mas_right).offset(10);
        make.centerY.equalTo(self.headBtn);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(5);
        make.centerY.equalTo(self.headBtn);
    }];
    [self.fouceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headBtn.mas_bottom).offset(-9);
        make.width.height.mas_equalTo(18);
        make.centerX.equalTo(self.headBtn);
    }];
    [self.BGImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(13);
        make.right.equalTo(self).offset(-13);
        make.height.mas_equalTo(131);
        make.top.equalTo(self.headBtn.mas_bottom).offset(21);
        
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(13);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.BGImage.mas_bottom).offset(15);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(13);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(7);
    }];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(13);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(19);
        make.height.mas_equalTo(16);
    }];
    [self.likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.likeBtn.mas_right).offset(6);
        make.centerY.equalTo(self.likeBtn);
        make.width.mas_equalTo(60);
    }];
    [self.hateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.likeLabel.mas_right).offset(5);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(17);
        make.height.mas_equalTo(17);
    }];
    [self.hateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.hateBtn.mas_right).offset(6);
        make.centerY.equalTo(self.hateBtn);
        make.width.mas_equalTo(60);
    }];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.hateLabel.mas_right).offset(5);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(17);
        make.height.mas_equalTo(17);
    }];
    [self.shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shareBtn.mas_right).offset(6);
        make.centerY.equalTo(self.shareBtn);
        make.width.mas_equalTo(60);
    }];
    [self.messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shareLabel.mas_right).offset(5);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(17);
        make.height.mas_equalTo(16);
    }];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.messageBtn.mas_right).offset(6);
        make.centerY.equalTo(self.messageBtn);
        make.width.mas_equalTo(60);
    }];
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(13);
        make.right.equalTo(self).offset(-13);
        make.height.mas_equalTo(0.3);
        make.top.equalTo(self.messageBtn.mas_bottom).offset(16);
    }];
    [self.lineImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.messageBtn.mas_bottom).offset(12);
        make.height.mas_equalTo(5);
        make.centerX.equalTo(self.messageBtn);
    }];
    [self.reviewerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(13);;
        make.top.equalTo(self.lineLabel.mas_bottom).offset(13);
        make.width.height.mas_equalTo(40);
    }];
    [self.reviewerName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.reviewerBtn.mas_right).offset(10);
        make.top.equalTo(self.reviewerBtn.mas_top);
        
    }];
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.reviewerBtn.mas_right).offset(10);
        make.bottom.equalTo(self.reviewerBtn.mas_bottom);
        
    }];
    [self.zanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-14);
        make.top.equalTo(self.reviewerBtn.mas_top);
        make.width.mas_equalTo(19);
        make.height.mas_equalTo(16);
    }];
    [self.zanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-14);
        make.top.equalTo(self.zanBtn.mas_bottom).offset(7);
    }];
    
    
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-14);
        make.centerY.equalTo(self.headBtn);
    }];
    
}

-(void)pressLike:(UIButton*)sender{
    sender.selected = !sender.selected;
}
-(void)pressHate:(UIButton*)sender{
    sender.selected = !sender.selected;
}
-(void)pressShare{
    
}
-(void)pressMessage{
    
}
-(void)pressMusic{
    
}
-(void)pressMore{
    
}
-(void)pressZan:(UIButton *)sender{
    sender.selected = !sender.selected;
}
-(void)pressPlay:(UIButton *)sender{
    sender.selected = !sender.selected;
}
-(void)pressFouce:(UIButton*)sender{
    sender.selected = !sender.selected;
}
@end
