//
//  CustomTableViewCell.h
//  CustomTable
//
//  Created by Hemant V. Torsekar on 2015-04-14.
//  Copyright (c) 2015 Hemant V. Torsekar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreImage/CoreImage.h>



@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *backgroundImageView;

@end
