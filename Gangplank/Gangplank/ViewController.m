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
@property (nonatomic, strong) ZZAlbumViewController *albumVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];

    [self.view addSubview:self.albumButton];

    // 添加手势
    UISwipeGestureRecognizer *pullOtherViewController = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(pullOthterViewController:)];
    pullOtherViewController.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:pullOtherViewController];
}

- (void)pullOthterViewController:(UISwipeGestureRecognizer *)recognizer
{
    [self presentViewController:self.albumVC animated:YES completion:nil];
}

- (ZZAlbumViewController *)albumVC
{
    if (!_albumVC) {
        _albumVC = [[ZZAlbumViewController alloc] init];
    }
    return _albumVC;
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
    [self presentViewController:self.albumVC animated:YES completion:nil];
}

@end
