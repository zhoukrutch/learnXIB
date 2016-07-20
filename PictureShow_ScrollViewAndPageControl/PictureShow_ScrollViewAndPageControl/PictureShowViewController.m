//
//  PictureShowViewController.m
//  PictureShow_ScrollViewAndPageControl
//
//  Created by tao on 16/7/20.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "PictureShowViewController.h"

@interface PictureShowViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIPageControl *pageControl;

@end



@implementation PictureShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *imageArr = @[@"p1", @"p2", @"p3"];
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
//    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"p1"]];
//    [self.imageView setFrame:CGRectMake(0, 0, width, height)];
//    UIScrollView *zoomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
//    [zoomScrollView addSubview:self.imageView];
//    zoomScrollView.maximumZoomScale = 2.0;
//    zoomScrollView.minimumZoomScale = 0.5;
//    [zoomScrollView setContentSize:CGSizeMake(width, height)];
//    zoomScrollView.delegate = self;
//    [self.view addSubview:zoomScrollView];
    
    
    for (NSInteger i = 0; i <[imageArr count]; i++) {
        UIImageView *picture = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageArr[i]]];
        [picture setFrame:CGRectMake(i*width, 0, width, height)];
        [self.scrollView addSubview:picture];
    }
    [self.scrollView setContentSize:CGSizeMake([imageArr count] * width, height)];
    [self.scrollView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.view addSubview:_scrollView];
    _scrollView.delegate = self;
    //UIPageControl会覆盖在scrollView上 导致scrollView的滑动手势无法识别
    //[self.pageControl setFrame:CGRectMake(0, 0, width, height)];
    [self.pageControl setBounds:CGRectMake(0, 0, 200, 100)];
    [self.pageControl setCenter:CGPointMake(width / 2, height/ 2+200)];
    [self.pageControl setNumberOfPages:[imageArr count]];
    [self.pageControl setCurrentPage:0];
    [self.pageControl addTarget:self action:@selector(switchPage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.pageControl];
}

- (UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.backgroundColor = [UIColor clearColor];
        [_pageControl setCurrentPageIndicatorTintColor:[UIColor greenColor]];
        [_pageControl setPageIndicatorTintColor:[UIColor yellowColor]];
    }
    return _pageControl;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        CGFloat width = self.view.bounds.size.width;
        CGFloat height = self.view.bounds.size.height;
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        _scrollView.maximumZoomScale = 2.0;
        _scrollView.minimumZoomScale = 0.5;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.scrollEnabled = YES;
        _scrollView.pagingEnabled = YES;
        [self.scrollView setBounces:YES];  //弹性碰触边缘
        

    }
    return _scrollView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger currentPage = _scrollView.contentOffset.x / self.view.bounds.size.width;
    [self.pageControl setCurrentPage:currentPage];
}

- (void)switchPage:(UIPageControl *)pageControl {
    UIPageControl *currentControl = (UIPageControl *)pageControl;
    NSInteger currentPage = currentControl.currentPage;
    [_scrollView setContentOffset:CGPointMake(currentPage * self.view.bounds.size.width, 0)];
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _scrollView;
}


@end
