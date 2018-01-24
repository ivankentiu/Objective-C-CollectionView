//
//  DetailsViewController.m
//  CollectionView
//
//  Created by Ivan Ken Tiu on 24/01/2018.
//  Copyright © 2018 Ivan Ken Tiu. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(91, 15, 0, 0)];
    _detailLabel.translatesAutoresizingMaskIntoConstraints = false;
    _detailLabel.text = _selection;
    [self.view addSubview:_detailLabel];
    [self setupLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setupLayout {
    [[_detailLabel.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor] setActive: true];
    [[_detailLabel.centerYAnchor constraintEqualToAnchor: self.view.centerYAnchor] setActive: true];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
