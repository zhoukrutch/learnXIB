//
//  ViewController.m
//  KVC&KVO
//
//  Created by tao on 16/8/22.
//  Copyright © 2016年 tao. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [Person sharedPerson];
    Person *sharedPerson =[Person sharedPerson];
    NSLog(@"address:%p-address%p",self.person,sharedPerson);
    [self.person setValue:@"krutch" forKey:@"name"];
    Book *rentBook = [[Book alloc] init];
    self.person.book = rentBook;
    [self.person setValue:@"冰与火之歌" forKeyPath:@"book.bookName"];  //设置属性的属性 需要用forKeyPath函数
    //[person setValue:@"冰与火之歌" forKey:@"book.bookName"]; //error
    NSLog(@"%@",self.person.name);
    NSLog(@"%@",self.person.book.bookName);
    
    
    //KVO
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)personObserver:(id)sender {
    [self.person setValue:@"kris" forKey:@"name"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if([keyPath isEqualToString:@"name"]){
        [_textField setText:_person.book.bookName];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [self.person removeObserver:self forKeyPath:@"name"];
    // Dispose of any resources that can be recreated.
}

@end
