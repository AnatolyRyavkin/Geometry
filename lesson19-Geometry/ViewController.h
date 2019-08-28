//
//  ViewController.h
//  lesson19-Geometry
//
//  Created by Anatoly Ryavkin on 12/03/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Desk.h"
#import "Figura.h"

@interface ViewController : UIViewController

@property (readwrite,strong,nonatomic) Desk*desk;
@property NSMutableArray* arrayViewCell;
@property NSMutableArray* arrayViewFigurs;
-(void)drawingDeskAndFigurs;
-(void)delFigursAtCountRotation;
-(void)drawingFigursAtNewPosition;
@end;

