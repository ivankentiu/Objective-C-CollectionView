//
//  ViewController.m
//  CollectionView
//
//  Created by Ivan Ken Tiu on 23/01/2018.
//  Copyright © 2018 Ivan Ken Tiu. All rights reserved.
//
#define cellId @"collectionViewCell"
#import "ViewController.h"
#import "CollectionViewCell.h"
#import "DetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectionData = [NSMutableArray array];
    [_collectionData addObjectsFromArray: @[@"1 📲", @"2 🌲", @"3 🐙", @"4 🏀", @"5 🎤"]];
    
    _addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target: self action: @selector(addItem)];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier: cellId];
    
    CGFloat width = (self.view.frame.size.width - 20) / 3;
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(width, width);
    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action:@selector(refresh) forControlEvents: UIControlEventValueChanged];
    self.collectionView.refreshControl = refresh;
    
    self.navigationItem.rightBarButtonItem = _addButton;
//    self.view.backgroundColor = [UIColor whiteColor];
//    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10.0f, 30.0f, 300.0f, 30.0f)];
//    self.textField.borderStyle = UITextBorderStyleRoundedRect;
//    [self.view addSubview:self.textField];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) addItem {
    [self.collectionView performBatchUpdates:^{
        for (int i=0; i<2; i++) {
            NSString *text = [NSString stringWithFormat:@"%lu", _collectionData.count + 1];
            [_collectionData addObject: text];
            NSIndexPath *index = [NSIndexPath indexPathForRow: _collectionData.count - 1 inSection:0];
            [self.collectionView insertItemsAtIndexPaths: @[index]];
        }
    } completion: nil];
}

- (void) refresh {
    [self.collectionView.refreshControl endRefreshing];
    [self addItem];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier: cellId forIndexPath: indexPath];
    cell.titleLabel.text = [_collectionData objectAtIndex: indexPath.item];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_collectionData count];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DetailsViewController *detailsViewController = [[DetailsViewController alloc] init];
    detailsViewController.selection = [_collectionData objectAtIndex: indexPath.item];
    [self.navigationController pushViewController: detailsViewController animated: true];
}

@end
