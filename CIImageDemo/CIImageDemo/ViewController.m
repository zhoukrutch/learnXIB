//
//  ViewController.m
//  CIImageDemo
//
//  Created by tao on 12/21/16.
//  Copyright © 2016 tao. All rights reserved.
//
#import <CoreImage/CoreImage.h>
#import "ViewController.h"



@interface ViewController ()
@property (strong, nonatomic) UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imgView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, [UIScreen mainScreen].bounds.size.width/2.0, [UIScreen mainScreen].bounds.size.width/2.0)];
    
    //[self.view addSubview:_imgView];
    
    //[self erweima];
    UIImage *image = [[self class] qrImageForString:@"www.baidu.com" imageSize:51 logoImageSize:0.0f];
//    UIImage *colorImage = [self imageBlackToTransparent:image withRed:255 andGreen:0 andBlue:0];
   self.imgView.image = image;
    
    CGFloat leftMargin = 63;
    CGFloat positionY = 32;
    CGFloat imageWidth = 375;
    CGFloat labelWidth = imageWidth - leftMargin - 42;
    UIView *pictureView = [[UIView alloc] init];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    backgroundImage.backgroundColor = [UIColor clearColor];
    [backgroundImage setFrame:CGRectMake(0, 0, imageWidth, 128)];
    [pictureView addSubview:backgroundImage];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.numberOfLines = 3;
    [titleLabel setBaselineAdjustment:UIBaselineAdjustmentAlignCenters];
    titleLabel.text = @"对于体验护士服务收入高娥温柔的说法而我认为是对方手温柔的说法而我认为";
    [titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    CGSize size;
    size.height = 1024;
    size.width  = labelWidth;
    size = [titleLabel sizeThatFits:size];
    [titleLabel setFrame:CGRectMake(leftMargin, positionY, labelWidth, size.height)];
    [pictureView addSubview:titleLabel];
    positionY += size.height;
    
    UIImageView *contentMarkIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mark"]];
    [contentMarkIcon setFrame:CGRectMake((leftMargin - 18)/2, positionY, 18, 15)];
    //contentMarkIcon.backgroundColor = [UIColor clearColor];
    [pictureView addSubview:contentMarkIcon];
    
    positionY = 128 ;
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.text = @"大异龟。六臂道人养的龟，法宝为十八颗碧神，太古莽牛的异种，种族秘技为莽牛吼玄犀：异种犀牛南离神火犀：缭绕南离火的犀牛九头蛇：有九头的神蛇蛇：上古飞蛇，可腾云驾雾肥遗：通晓火道宝术的太古遗种，形如怪蛇，通体赤红鳞甲，一首两躯，6腿4翅玄武：四灵神兽之一，曹雨生师傅为该族盖世强者玄龟：玄武遗种，强大异龟。六臂道人养的龟，法宝为十八颗碧神，太古莽牛的异种，种族秘技为莽牛吼玄犀：异种犀牛南离神火犀：缭绕南离火的犀牛九头蛇：有九头的神蛇蛇：上古飞蛇";
    contentLabel.numberOfLines = 0;
    [contentLabel setFont:[UIFont systemFontOfSize:17]];
    size.height = 1024;
    size.width  = labelWidth;
    size = [contentLabel sizeThatFits:size];
    [contentLabel setFrame:CGRectMake(leftMargin, positionY, labelWidth, size.height)];
    [pictureView addSubview:contentLabel];
    
    NSInteger sepWidth = 3;
    UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake((leftMargin - sepWidth)/2, positionY, sepWidth,  size.height)];
    [borderView setBackgroundColor:[self colorWithRGBInt:0xeff6ff]];
    [pictureView addSubview:borderView];
    //长图和短图区分样式
    BOOL isLargeImage = NO;
    if (positionY >= 500) {
        isLargeImage = YES;
    }
    UIImageView *QRCodeImageView = [[UIImageView alloc] initWithImage:image];
    UIImageView *logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    UILabel *hintLabel = [[UILabel alloc] init];
    [hintLabel setText:@"长按二维码阅读原文"];
    if (isLargeImage) {
        positionY += size.height + 65;
        [QRCodeImageView setFrame:CGRectMake((imageWidth - 125)/2 , positionY, 125, 125)];
        positionY += size.height + 125 + 10;
        [hintLabel setFont:[UIFont systemFontOfSize:13]];
        [hintLabel sizeToFit];
        CGSize hintLabelSize = hintLabel.frame.size;
        [hintLabel setFrame:CGRectMake((imageWidth - hintLabelSize.width)/2, positionY, hintLabelSize.width, hintLabelSize.height)];
        positionY += hintLabelSize.height + 45;
        [logoView setFrame:CGRectMake((imageWidth -88)/2, positionY, 88, 21)];
        positionY += 21 + 30;
        
    } else {
        positionY += size.height + 31;
        [QRCodeImageView setFrame:CGRectMake(imageWidth - 44 - 20 , positionY, 44, 44)];
        [logoView setFrame:CGRectMake(QRCodeImageView.frame.origin.x - 15 -88, positionY, 88, 21)];
        positionY += 25;
        [hintLabel setFont:[UIFont systemFontOfSize:13]];
        [hintLabel sizeToFit];
        CGSize hintLabelSize = hintLabel.frame.size;
        [hintLabel setFrame:CGRectMake(logoView.frame.origin.x, positionY, hintLabelSize.width, hintLabelSize.height)];
        positionY += hintLabelSize.height + 20;
        
    }
    
    [pictureView addSubview:QRCodeImageView];
    [pictureView addSubview:logoView];
    [pictureView addSubview:hintLabel];
    [hintLabel setFont:[UIFont systemFontOfSize:10]];
    
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"1.jpg"];
    //NSData* data = [NSData dataWithContentsOfFile:path];
    UIImage *image222 = [UIImage imageWithContentsOfFile:path];
    UIImage * image1 = [self makeImageWithView:pictureView withSize:CGSizeMake(imageWidth,positionY)];
    UIImageWriteToSavedPhotosAlbum(image222, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);

    UIImageView *view = [[UIImageView alloc] initWithImage:image222];
    view.frame = [UIScreen mainScreen].bounds;
    [view setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:view];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}

- (UIImage *)makeImageWithView:(UIView *)view withSize:(CGSize)size
{
    
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数 [UIScreen mainScreen].scale。
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}

- (UIColor*)colorWithRGBInt:(NSInteger)rgb
{
    int r = (rgb >> 16) & 0xFF;
    int g = (rgb >> 8) & 0xFF;
    int b = (rgb) & 0xFF;
    
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f];
}


-(void)erweima

{
    //master update
    //develop update
    //二维码滤镜
    
    CIFilter *filter=[CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    //恢复滤镜的默认属性
    
    [filter setDefaults];
    
    //将字符串转换成NSData
    NSData *data=[@"www.baidu.com" dataUsingEncoding:NSUTF8StringEncoding];
    
    //通过KVO设置滤镜inputmessage数据
    
    [filter setValue:data forKey:@"inputMessage"];
    
    //获得滤镜输出的图像
    
    CIImage *outputImage=[filter outputImage];
    
    //将CIImage转换成UIImage,并放大显示
    
    _imgView.image=[self createNonInterpolatedUIImageFormCIImage:outputImage withSize:100.0];
    
    //如果还想加上阴影，就在ImageView的Layer上使用下面代码添加阴影
    
    _imgView.layer.shadowOffset=CGSizeMake(0, 0.5);//设置阴影的偏移量
    
    _imgView.layer.shadowRadius=1;//设置阴影的半径
    
    _imgView.layer.shadowColor=[UIColor blackColor].CGColor;//设置阴影的颜色为黑色
    
    _imgView.layer.shadowOpacity=0.3;
    
}

+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    string = @"https://www.yidianzixun.com/n/0FFdnmWR?utk=666lnfu2&appid=yidian&ver=4.3.5.8&f=ios";
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];//通过kvo方式给一个字符串，生成二维码
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];//设置二维码的纠错水平，越高纠错水平越高，可以污损的范围越大
    CIImage *outPutImage = [filter outputImage];//拿到二维码图片
    return [UIImage imageWithCIImage:outPutImage];
    return [[self alloc] createNonInterpolatedUIImageFormCIImage:outPutImage withSize:Imagesize waterImageSize:waterImagesize];
}

- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size waterImageSize:(CGFloat)waterImagesize{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    //创建一个DeviceGray颜色空间
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    //CGBitmapContextCreate(void * _Nullable data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef  _Nullable space, uint32_t bitmapInfo)
    //width：图片宽度像素
    //height：图片高度像素
    //bitsPerComponent：每个颜色的比特值，例如在rgba-32模式下为8
    //bitmapInfo：指定的位图应该包含一个alpha通道。
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    //创建CoreGraphics image
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    //原图
    UIImage *outputImage = [UIImage imageWithCGImage:scaledImage];
    //给二维码加 logo 图
    UIGraphicsBeginImageContextWithOptions(outputImage.size, NO, [[UIScreen mainScreen] scale]);
    [outputImage drawInRect:CGRectMake(0,0 , size, size)];
    //logo图
    UIImage *waterimage = [UIImage imageNamed:@"icon_imgApp"];
    //把logo图画到生成的二维码图片上，注意尺寸不要太大（最大不超过二维码图片的%30），太大会造成扫不出来
    [waterimage drawInRect:CGRectMake((size-waterImagesize)/2.0, (size-waterImagesize)/2.0, waterImagesize, waterImagesize)];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [UIImage imageWithCGImage:scaledImage];
}

- (UIImage*)imageBlackToTransparent:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue{
    const int imageWidth = image.size.width;
    const int imageHeight = image.size.height;
    size_t bytesPerRow = imageWidth * 4;
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage); // 遍历像素
    int pixelNum = imageWidth * imageHeight;
    uint32_t* pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixelNum; i++, pCurPtr++){
        if ((*pCurPtr & 0xFFFFFF00) < 0x99999900) // 将白色变成透明
        {
            // 改成下面的代码，会将图片转成想要的颜色
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[3] = red; //0~255
            ptr[2] = green;
            ptr[1] = blue;
        } else {
            uint8_t* ptr = (uint8_t*)pCurPtr;
            ptr[0] = 0;
        }
    }
    // 输出图片
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, nil);
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace, kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider, NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef]; // 清理空间
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return resultUIImage;
}

- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
