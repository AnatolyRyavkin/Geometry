//
//  ViewController.m
//  lesson19-Geometry
//
//  Created by Anatoly Ryavkin on 12/03/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end;

@implementation ViewController
-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    NSLog(@"orientation!!!!");
  return UIInterfaceOrientationMaskAll;
}

-(void)drawingDeskAndFigurs{
    self.view.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.8];
    self.desk = [[Desk alloc]init];
    NSMutableArray* array1 = [[NSMutableArray alloc]init];
    self.desk.viewDesk = [self.desk viewPresent:self.view andColorOne:[UIColor yellowColor] andColorSecond:[UIColor blueColor] andArray:&array1];
    self.arrayViewCell=[NSMutableArray arrayWithArray:array1];
    [self.view addSubview:self.desk.viewDesk];
    self.desk.viewDesk.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    self.arrayViewFigurs=[[NSMutableArray alloc]init];
    int i =0,j=0;
    for(UIView*viewCelll in array1){
        if(i<24 && (i+j)%2==0){
            UIView*v1=[[[Figura alloc]init]setSabFrame:viewCelll];
            v1.backgroundColor=[UIColor blackColor];
            [viewCelll addSubview:v1];
            [self.arrayViewFigurs addObject:v1];
        }
        if(i>=40 && (i+j)%2==0){
            UIView*v1=[[[Figura alloc]init] setSabFrame:viewCelll];
            v1.backgroundColor=[UIColor whiteColor];
            [viewCelll addSubview:v1];
            [self.arrayViewFigurs addObject:v1];
        }
        i++;
        if(i%8==0 && i!=0)j++;
    }
}
-(void)delFigursAtCountRotation{
    for(UIView*viewCell in self.arrayViewCell){
        if(viewCell.subviews.count!=0){
            UIView*tempView=[viewCell.subviews objectAtIndex:0];
            UIView*tempView1=[[UIView alloc]init];
            [tempView addSubview:tempView1];
            [tempView removeFromSuperview];
        }
    }
}
-(void)drawingFigursAtNewPosition{
    NSMutableSet*set=[[NSMutableSet alloc]init];
    for(UIView*figura in self.arrayViewFigurs){
        //NSLog(@"\n frame1 = %@",NSStringFromCGRect([figura convertRect:figura.bounds toView:self.view]));
        BOOL b = YES;
        while (b) {
              int i = arc4random()%64;
            if(![set containsObject:[NSNumber numberWithInt:i]]){
                  [[self.arrayViewCell objectAtIndex:i] addSubview:figura];
                  [set addObject:[NSNumber numberWithInt:i]];
                  b=NO;
              }
        }
        // NSLog(@"\n frame2 = %@",NSStringFromCGRect([figura convertRect:figura.bounds toView:self.view]));
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawingDeskAndFigurs];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    NSLog(@"rotation");
    static NSInteger a = 0;
    a++;
    NSLog(@"a=%li",a);
    [self delFigursAtCountRotation];
    if(a%2==0) [self drawingFigursAtNewPosition];
    else if(a%3==0)[self drawingDeskAndFigurs];
}
@end;
