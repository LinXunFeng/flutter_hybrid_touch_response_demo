//
//  LXFPopView.m
//  OCProject
//
//  Created by LinXunFeng on 2022/4/12.
//

#import "LXFPopView.h"

@interface LXFPopView ()

@property(nonatomic, strong) UIView *bgView;

@property(nonatomic, strong) UIView *contentView;

@end

@implementation LXFPopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)initUI {
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.contentView];
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    self.bgView.frame = CGRectMake(0, 0, screenW, screenH);
    self.bgView.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    
    CGFloat contentViewW = 200;
    CGFloat contentViewH = 200;
    CGFloat contentViewX = (screenW - contentViewW) * 0.5;
    CGFloat contentViewY = (screenH - contentViewH) * 0.5;
    self.contentView.frame = CGRectMake(contentViewX, contentViewY, contentViewW, contentViewH);
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:closeBtn];
    closeBtn.frame = CGRectMake(10, 140, contentViewW - 20, 44);
    closeBtn.backgroundColor = [UIColor redColor];
    [closeBtn setTitle:@"close" forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(handleCloseBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleCloseBtnClick {
    [self removeFromSuperview];
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
    }
    return _contentView;
}

@end
