//
//  Desk.m
//  lesson19-Geometry
//
//  Created by Anatoly Ryavkin on 12/03/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "Desk.h"

@implementation Desk

-(UIView*)viewPresent: (UIView*) controller andColorOne:(UIColor*) colorOne andColorSecond:(UIColor*) colorSecond  andArray:(NSMutableArray**)array{
    CGFloat side;
    CGFloat height = controller.frame.size.height;
    CGFloat width = controller.frame.size.width;
    CGRect rect;
    if(height<=width){
        side = height;
        rect.origin.x=(width-height)/2;
        rect.origin.y=0;
    }
    else{
        side=width;
        rect.origin.x=0;
        rect.origin.y=(height-width)/2;
    }
        rect.size.height=rect.size.width=side;
    UIView* view = [[UIView alloc]initWithFrame:rect];
    view.backgroundColor=[UIColor redColor];
    for(int i=0;i<8;i++){
        for(int j=0;j<8;j++){
            CGRect rectCell;
            rectCell.size.height=rectCell.size.width=side/8;
            rectCell.origin.x=view.bounds.origin.x+j*(side/8);
            rectCell.origin.y=view.bounds.origin.y+i*(side/8);
            UIView*viewCell = [[UIView alloc]initWithFrame:rectCell];
            viewCell.backgroundColor = ((i+j)%2 == 0) ? [colorOne colorWithAlphaComponent:0.7] : [colorSecond colorWithAlphaComponent:0.7];
            [(*array) addObject:viewCell];
            self.viewDesk=viewCell;
            [view addSubview:viewCell];
        }
    }
    NSLog(@"END!!!");
    return view;
}

@end;
