//
//  ViewController.m
//  Animations
//
//  Created by Juan Pablo Marzetti on 11/10/15.
//  Copyright © 2015 Juan Pablo Marzetti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)tapped:(id)sender {
    CGPoint imageCenter = self.image.center;
    
    [UIView animateWithDuration:1 delay:0.2 usingSpringWithDamping:1 initialSpringVelocity:0 options:0
                     animations:^{
                         self.image.center = CGPointMake(imageCenter.x, imageCenter.y + 300);
                         self.image.transform = CGAffineTransformMakeScale(3, 3);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.image.transform = CGAffineTransformRotate(self.image.transform, 10 * M_PI / 100);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 delay:0.1
                                options:UIViewAnimationOptionAutoreverse+UIViewAnimationOptionRepeat+UIViewAnimationOptionCurveLinear
                             animations:^{
                                 self.image.transform = CGAffineTransformRotate(self.image.transform, -20 * M_PI / 100);
                             } completion:^(BOOL finished) {
                             }];
        }];
    }];
    
//    [UIView animateWithDuration:0.3 animations:^{
//        self.image.center = CGPointMake(imageCenter.x, imageCenter.y + 300);
//        self.image.transform = CGAffineTransformMakeScale(3, 3);
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.2 animations:^{
//            self.image.transform = CGAffineTransformRotate(self.image.transform, 10 * M_PI / 100);
//        } completion:^(BOOL finished) {
//            [UIView animateWithDuration:0.3 delay:0.1
//                                options:UIViewAnimationOptionAutoreverse+UIViewAnimationOptionRepeat+UIViewAnimationOptionCurveLinear
//                             animations:^{
//                self.image.transform = CGAffineTransformRotate(self.image.transform, -20 * M_PI / 100);
//            } completion:^(BOOL finished) {
//            }];
//        }];
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
