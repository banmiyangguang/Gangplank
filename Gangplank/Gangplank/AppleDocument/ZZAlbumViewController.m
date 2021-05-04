//
//  ZZAlbumViewController.m
//  Gangplank
//
//  Created by Zhihao Zhang on 2021/4/27.
//

#import "ZZAlbumViewController.h"
#import "ZZCollectionViewCell.h"
#import "ZZCollectionReusableView.h"
#import "ZZCollectionViewFlowLayout.h"

static NSString * const ZZCollectionViewCellIdentifier = @"ZZCollectionViewCellIdentifier";
static NSString * const ZZCollectionReusableViewIdentifier = @"ZZCollectionReusableViewIdentifier";

@interface ZZAlbumViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger sectionCount;

@end

@implementation ZZAlbumViewController

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 设置 flowLayout
    ZZCollectionViewFlowLayout *flowLayout = [[ZZCollectionViewFlowLayout alloc] init];
    
    
    // 添加 collectionView, 设置 delegate 和 dataSource 的代理对象
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_collectionView];
    
    
    // 注册 cell
    [_collectionView registerClass:[ZZCollectionViewCell class] forCellWithReuseIdentifier:ZZCollectionViewCellIdentifier];
    // 注册 Supplementary View
    [_collectionView registerClass:[ZZCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:ZZCollectionReusableViewIdentifier];
    
    // tableView
    _tableView = [UITableView new];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    ZZCollectionViewCell *cell = (ZZCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:ZZCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.num = [NSString stringWithFormat:@"%ld", (long)indexPath.item];
    [cell refreshData];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(nonnull NSString *)kind
                                 atIndexPath:(nonnull NSIndexPath *)indexPath {
    ZZCollectionReusableView *reusableView = (ZZCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:ZZCollectionReusableViewIdentifier forIndexPath:indexPath];
    [reusableView refreshData];
    return reusableView;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    ZZCollectionViewCell *cell = (ZZCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"%@", cell);
}

- (BOOL)collection:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)addItem:(id)sender {
    [self.collectionView performBatchUpdates:^{
        [self.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:2 inSection:0]]];
         [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:5 inSection:0]]];
    } completion:NULL];
}

@end
