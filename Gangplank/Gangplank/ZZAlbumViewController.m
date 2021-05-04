//
//  ZZAlbumViewController.m
//  Gangplank
//
//  Created by Zhihao Zhang on 2021/4/27.
//

#import "ZZAlbumViewController.h"
#import "KVOTest.h"
#import "ZZSystemMethodWrapper.h"
#import "ZZPerson.h"

@interface ZZAlbumViewController ()
@property (nonatomic, strong) KVOTest  *kvoTest;
@property (nonatomic, strong) UIButton *testButton;

@end

@implementation ZZAlbumViewController

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    printClasses([ZZPerson class]);
    _kvoTest = [KVOTest new];
    printClasses([ZZPerson class]);
    _testButton = [UIButton new];
    _testButton.backgroundColor = [UIColor grayColor];
    _testButton.frame = CGRectMake(100, 200, 44, 44);
    [self.view addSubview:_testButton];
    [_testButton addTarget:self action:@selector(clickTestButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickTestButton {
    _kvoTest.person.age ++;
}




@end
