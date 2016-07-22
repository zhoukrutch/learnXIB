//
//  ClotherPriceListViewController.m
//  ClotherPriceList_tableView
//
//  Created by tao on 16/7/22.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "ClotherPriceListViewController.h"
#import "ClotherTableViewCell.h"

@interface ClotherPriceListViewController ()<UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>
{
    NSArray *imageArr ;
    NSArray *blandArr ;
    NSMutableArray *clotherList;
}
@property (weak, nonatomic) IBOutlet UITableView *clotherListTableView;

@end

@implementation Clother


@end

@implementation ClotherPriceListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imageArr = [[NSArray alloc] initWithObjects:@"ic", @"p2", @"p3", nil ];
    blandArr = [[NSArray alloc] initWithObjects:@"七匹狼", @"森马", @"美邦", @"nike", @"阿迪", nil ];;
    clotherList = [NSMutableArray arrayWithCapacity:30];
    for (NSInteger i = 0; i < 4; i++) {
        Clother *clother = [[Clother alloc] init];
        clother.brandName = blandArr[arc4random_uniform(5)];
        clother.clotherImage = imageArr[arc4random_uniform(3)];
        clother.clotherPrice = [NSString stringWithFormat:@"促销价：%i",arc4random_uniform(1000)];
        [clotherList addObject:clother];
    }
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ia"]];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setFrame:CGRectMake(10, 10, 50, 50)];
    [self.view addSubview:image];
    [self.view bringSubviewToFront:image];
    self.clotherListTableView.delegate = self;
    self.clotherListTableView.dataSource = self;
    //[self.clotherListTableView registerNib:[UINib nibWithNibName:@"ClotherTableViewCell" bundle:nil] forCellReuseIdentifier:@"ClotherTableViewCell"];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [clotherList count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - UITableViewDelegate



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ClotherTableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ClotherTableViewCell"];
    }
    ClotherTableViewCell *clotherCell = (ClotherTableViewCell *)cell;

    if (clotherCell) {
        [clotherCell setTitle:[clotherList[indexPath.item] brandName]];
        [clotherCell setDetailInfo:[clotherList[indexPath.item] clotherPrice]];
        [clotherCell setImageView:[clotherList[indexPath.item] clotherImage]];
    }
    return clotherCell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"服装价格：" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"修改", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    ClotherTableViewCell *cell = [self.clotherListTableView cellForRowAtIndexPath:indexPath];
    UITextField *textField = [alert textFieldAtIndex:0];
    [textField setText:cell.detailLabel.text];
    [alert show];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        UITextField *textField = [alertView textFieldAtIndex:0];
        Clother *clother = clotherList[[[self.clotherListTableView indexPathForSelectedRow] item]];
        clother.clotherPrice = textField.text;
        [self.clotherListTableView reloadRowsAtIndexPaths:[self.clotherListTableView indexPathsForSelectedRows] withRowAnimation:UITableViewRowAnimationRight];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


@end
