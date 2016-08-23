//
//  xklProgressView.h
//  testForTableViewCell
//
//  Created by iOS Tedu on 16/8/23.
//  Copyright © 2016年 huaxu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xklProgressView : UIView
/** 完成时的颜色 */
@property (nonatomic, strong) UIColor *finishColor;
/** 未完成时的颜色 */
@property (nonatomic, strong) UIColor *unfinishColor;
/** 整个画面的背景色 */
@property (nonatomic, strong) UIColor *backColor;
/** 进度条的颜色 */
@property (nonatomic, strong) UIColor *progressColor;
/** 进度提示文字的颜色 */
@property (nonatomic, strong) UIColor *frontTextColor;

/** 完成进度百分比 */
@property (nonatomic, assign) CGFloat percent;
/** 进度条宽度 */
@property (nonatomic, assign) NSInteger width;
@end
