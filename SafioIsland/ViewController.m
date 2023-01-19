//
//  ViewController.m
//  SafioIsland
//
//  Created by Safio on 2023/1/18.
//

#import "ViewController.h"
#import "SafioIsland-Swift.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (IBAction)startAcion:(id)sender {
    YGActivityManager *manager = [[YGActivityManager alloc]init];
    [manager startActivityWithLeftPic:@"pic_1" rightPic:@"pic_2"];
}
- (IBAction)endAction:(id)sender {
    YGActivityManager *manager = [[YGActivityManager alloc]init];
    [manager stopActivity];

}

@end
