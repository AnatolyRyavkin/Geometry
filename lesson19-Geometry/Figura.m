//
//  Figura.m
//  lesson19-Geometry
//
//  Created by Anatoly Ryavkin on 12/03/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "Figura.h"

@implementation Figura

-(UIView*)setSabFrame:(UIView*)sView{
    CGRect rect;
    rect.size.height=rect.size.width=sView.frame.size.height-sView.frame.size.height*0.5;
    rect.origin.x=sView.bounds.origin.x+sView.frame.size.height*0.25;
    rect.origin.y=sView.bounds.origin.y+sView.frame.size.height*0.25;
    UIView*viewFig = [[UIView alloc]initWithFrame:rect];
    viewFig.backgroundColor=[UIColor redColor];
    return viewFig;
}
@end;
