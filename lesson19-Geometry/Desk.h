//
//  Desk.h
//  lesson19-Geometry
//
//  Created by Anatoly Ryavkin on 12/03/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Desk : NSObject
@property UIView*viewDesk;;
-(UIView*)viewPresent: (UIView*) controller andColorOne:(UIColor*) colorOne andColorSecond:(UIColor*) colorSecond andArray:(NSMutableArray**)array;
@end


