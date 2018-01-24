//
//  CollectionViewCell.h
//  CollectionView
//
//  Created by Ivan Ken Tiu on 23/01/2018.
//  Copyright © 2018 Ivan Ken Tiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong , nonatomic) UIImageView *selectionImage;
@property (nonatomic) BOOL Editing;

@end
