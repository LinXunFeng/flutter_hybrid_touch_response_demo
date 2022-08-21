//
//  ViewController.m
//  OCProject
//
//  Created by LinXunFeng on 2022/4/12.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "LXFPopView.h"
#import "LXFFlutterViewController.h"

@interface ViewController ()

@property(nonatomic, strong) FlutterEngine *flutterEngine;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.flutterEngine run];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LXFFlutterViewController *flutterVc = [[LXFFlutterViewController alloc] initWithEngine:self.flutterEngine nibName:nil bundle:nil];
    [self.navigationController pushViewController:flutterVc animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2000 * NSEC_PER_MSEC), dispatch_get_main_queue(), ^{
        CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenH = [UIScreen mainScreen].bounds.size.height;

        LXFPopView *popView = [[LXFPopView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
        [flutterVc.view addSubview:popView];
    });
}

- (FlutterEngine *)flutterEngine {
    if (!_flutterEngine) {
        _flutterEngine = [[FlutterEngine alloc] initWithName:@"lxf"];
    }
    return _flutterEngine;
}

@end
