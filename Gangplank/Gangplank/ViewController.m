//
//  ViewController.m
//  Gangplank
//
//  Created by Zhihao Zhang on 2021/4/22.
//

#import "ViewController.h"
#import "ZZAlbumViewController.h"
#import "KVOTest.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *albumButton;
@property (nonatomic, strong) KVOTest  *kvoTest;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.albumButton];
    
    // kvo test
    _kvoTest = [[KVOTest alloc] init];
    
    NSString *testStr = @"helloworld";
    NSLog(@"%@", [testStr capitalizedString]);
}

- (UIButton *)albumButton {
    if (!_albumButton) {
        _albumButton = [[UIButton alloc] init];
        _albumButton.backgroundColor = [UIColor yellowColor];
        _albumButton.frame = CGRectMake(100, 100, 44, 44);
        [_albumButton addTarget:self action:@selector(clickAlbumButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _albumButton;
}

- (void)clickAlbumButton:(UIButton *)button
{
    ZZAlbumViewController *albumVC = [[ZZAlbumViewController alloc] init];
    [self.navigationController presentViewController:albumVC animated:YES completion:nil];
//    _kvoTest.person.age ++;
}

@end
