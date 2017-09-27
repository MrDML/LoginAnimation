//
//  ViewController.m
//  Animation
//
//  Created by 戴明亮 on 2017/9/26.
//  Copyright © 2017年 戴明亮. All rights reserved.
//

#import "ViewController.h"
#define  KDscreenWidth   [UIScreen mainScreen].bounds.size.width
#define  KDscreenHeight  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, strong) UIView *viewOne;
@property (nonatomic, strong) UIView *viewTwo;
@property (nonatomic, strong) UILabel *la_one;
@property (nonatomic, strong) UILabel *la_Two;
@property (nonatomic, strong) UITextField *tf_One;
@property (nonatomic, strong) UITextField *tf_Two;


@property (nonatomic, strong) UIView *viewLine;

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) BOOL completeAnimation;
@end






@implementation ViewController


- (UIView *)contentView
{
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_contentView];
    }
    return _contentView;
}

- (UIView *)viewOne
{
    if (_viewOne == nil) {
        _viewOne = [[UIView alloc] init];
        _viewOne.backgroundColor = [UIColor whiteColor];
        //[UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
        [self.contentView addSubview:_viewOne];
    }
    return _viewOne;
}

- (UIView *)viewTwo
{
    if (_viewTwo == nil) {
        _viewTwo = [[UIView alloc] init];
        _viewTwo.backgroundColor = [UIColor whiteColor];
        //[UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
        [self.contentView addSubview:_viewTwo];
    }
    return _viewTwo;
}


- (UIView *)viewLine
{
    if (_viewLine == nil) {
        _viewLine = [[UIView alloc] init];
        _viewLine.backgroundColor = [UIColor blackColor];
    }
    return _viewLine;
}

- (UILabel *)la_one
{
    if (_la_one == nil) {
        _la_one = [[UILabel alloc] init];
        _la_one.text = @"验证码";
        _la_one.textColor = [UIColor blackColor];
        [self.viewOne addSubview:_la_one];
    }
    return _la_one;
}

- (UILabel *)la_Two
{
    if (_la_Two == nil) {
        _la_Two = [[UILabel alloc] init];
        _la_Two.text = @"密码";
        _la_Two.textColor = [UIColor blackColor];
        [self.viewTwo addSubview:_la_Two];
    }
    return _la_Two;
}



- (UITextField *)tf_One
{
    if (_tf_One == nil) {
        _tf_One = [[UITextField alloc] init];
        _tf_One.placeholder = @"请输入验证码";
        _tf_One.font = [UIFont systemFontOfSize:14];
        [self.viewOne addSubview:_tf_One];
    }
    return _tf_One;
}

- (UITextField *)tf_Two
{
    if (_tf_Two == nil) {
        _tf_Two = [[UITextField alloc] init];
        _tf_Two.placeholder = @"请输入密码";
        _tf_Two.font = [UIFont systemFontOfSize:14];
        [self.viewTwo addSubview:_tf_Two];
    }
    return _tf_Two;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    
    self.contentView.frame = CGRectMake(0, 100, 3 * KDscreenWidth, 50);
    
    self.button.selected = YES;
    self.viewOne.frame = CGRectMake(0, 0, KDscreenWidth, 50);
    self.viewTwo.frame = CGRectMake(KDscreenWidth, 0, KDscreenWidth, 50);
    
    self.la_one.frame = CGRectMake(10, 0, 100, 50);
    self.la_Two.frame = CGRectMake(10, 0, 100, 50);
    
   
    self.tf_One.frame = CGRectMake(CGRectGetMaxX(self.la_one.frame), 0, KDscreenWidth - CGRectGetMaxX(self.la_one.frame) - 10, 50);
     self.tf_Two.frame = CGRectMake(CGRectGetMaxX(self.la_Two.frame), 0, KDscreenWidth - CGRectGetMaxX(self.la_one.frame) - 10, 50);
    self.completeAnimation = YES;
   
}
- (IBAction)actionClick:(UIButton *)sender {
    // 0.05 0.1
    // 0.1 0.15
    //[self animation:sender];
    [self animationStart];
    sender.selected = !sender.selected;
    
}



- (void)animationStart
{
    if (self.completeAnimation == NO) {
        return;
    }
    
    static int i = 0;
    i ++;
    
    int dex = i % 2;
    
    NSLog(@"-------->%d",dex);
    
    CGFloat X = - i *[UIScreen mainScreen].bounds.size.width;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.completeAnimation = NO;
        CGRect frame = self.contentView.frame;
        frame.origin.x = X;
        self.contentView.frame = frame;
        
    } completion:^(BOOL finished) {
        self.completeAnimation = YES;
        if (dex == 1) {
            self.viewOne.frame = CGRectMake(CGRectGetMaxX(self.viewTwo.frame), 0, KDscreenWidth, 50);
        }else{
            self.viewTwo.frame = CGRectMake(CGRectGetMaxX(self.viewOne.frame), 0, KDscreenWidth, 50);
        }
        self.contentView.frame = CGRectMake(X , 100, (i + 1)*KDscreenWidth, 50);
    
    }];
    
    
}

- (void)animation:(UIButton *)sender{
    if (sender.selected == YES) {
        [UIView animateWithDuration:0.1 animations:^{
            self.viewOne.frame = CGRectMake(-[UIScreen mainScreen].bounds.size.width, 100, [UIScreen mainScreen].bounds.size.width, 50);
        } completion:^(BOOL finished) {
            
            
            [UIView animateWithDuration:0.12 animations:^{
                self.viewTwo.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50);
            } completion:^(BOOL finished) {
                self.viewOne.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 100, [UIScreen mainScreen].bounds.size.width, 50);
            }];
        }];
        
    }else{
        
        [UIView animateWithDuration:0.1 animations:^{
            self.viewTwo.frame = CGRectMake(-[UIScreen mainScreen].bounds.size.width, 100, [UIScreen mainScreen].bounds.size.width, 50);
        } completion:^(BOOL finished) {
            
            
            [UIView animateWithDuration:0.12 animations:^{
                self.viewOne.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50);
            } completion:^(BOOL finished) {
                self.viewTwo.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 100, [UIScreen mainScreen].bounds.size.width, 50);
            }];
        }];
        
        
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
