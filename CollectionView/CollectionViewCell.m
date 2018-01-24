//
//  CollectionViewCell.m
//  CollectionView
//
//  Created by Ivan Ken Tiu on 23/01/2018.
//  Copyright © 2018 Ivan Ken Tiu. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (void)setEditing:(BOOL)Editing {
    _Editing = Editing;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor greenColor];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(91, 15, 0, 0)];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        _selectionImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
        _selectionImage.image = [UIImage imageNamed:@"Unchecked.png"];
        _selectionImage.contentMode = UIViewContentModeScaleAspectFit;
        _selectionImage.translatesAutoresizingMaskIntoConstraints = false;
        
        [self addSubview: _titleLabel];
        [self addSubview: _selectionImage];
        [self setupLayout];
    }
    return self;
}

-  (void) setupLayout {
    [[_titleLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor] setActive:true];
    [[_titleLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] setActive:true];
    
    [[_selectionImage.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-8] setActive:true];
    [[_selectionImage.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-8] setActive:true];
    [[_selectionImage.widthAnchor constraintEqualToConstant:22] setActive:true];
    [[_selectionImage.heightAnchor constraintEqualToConstant:22] setActive:true];
}
@end
