//
//  Book.h
//  KVC&KVO
//
//  Created by tao on 16/8/22.
//  Copyright © 2016年 tao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject
@property (strong, nonatomic) NSString *bookName;

@end

@interface Person : NSObject <NSCopying>
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) Book *book;


+ (Person *)sharedPerson;
@end