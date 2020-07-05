//
//  ViewController.m
//  ScrollViewProperty
//
//  Created by 李煜 on 2020/7/5.
//  Copyright © 2020 李煜. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIImageView *header;
@property (nonatomic,strong) UIView *blueView;
@property (nonatomic,strong) UIView *greenView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect SCREENBOUNS = [UIScreen mainScreen].bounds;
    CGFloat SCREENWIDTH = SCREENBOUNS.size.width;
    self.scrollView = [[UIScrollView alloc]initWithFrame:SCREENBOUNS];
    [self.view addSubview:self.scrollView];
    self.scrollView.delegate = self;
    
    UIImageView *gray = [[UIImageView alloc]initWithFrame:CGRectMake(0, -200, SCREENWIDTH, 200)];
    gray.contentMode = UIViewContentModeScaleToFill;
    gray.image = [UIImage imageNamed:@"bg.jpeg"];
    [self.scrollView addSubview:gray];
    self.header = gray;
    
    UIView *blue = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(gray.frame), SCREENWIDTH, 500)];
    blue.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:blue];
    self.blueView = blue;
    
    UIView *green = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.blueView.frame), SCREENWIDTH, 500)];
    green.backgroundColor = [UIColor greenColor];
    self.greenView = green;
    [self.scrollView addSubview:green];
    
    self.scrollView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, CGRectGetMaxY(self.greenView.frame));
    CGPoint contentOffset = self.scrollView.contentOffset;
    NSLog(@"contentOffset:%@",NSStringFromCGPoint(contentOffset));

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset= scrollView.contentOffset;
    if (offset.y < -200) {
        CGRect frame = self.header.frame;
        frame.origin.y = offset.y;
        frame.size.height = -offset.y;
        self.header.frame = frame;
        
        CGRect bF = self.blueView.frame;
        bF.origin.y = CGRectGetMaxY(frame);
        self.blueView.frame = bF;
        
        CGRect gF = self.greenView.frame;
        gF.origin.y = CGRectGetMaxY(bF);
        self.greenView.frame = gF;
    }
}
@end
