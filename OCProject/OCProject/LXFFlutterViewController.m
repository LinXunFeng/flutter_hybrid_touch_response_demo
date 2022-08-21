//
//  LXFFlutterViewController.m
//  OCProject
//
//  Created by LinXunFeng on 2022/4/12.
//

#import "LXFFlutterViewController.h"
#import "FlutterForbidResponseTouchProtocol.h"

@interface LXFFlutterViewController()

@property(nonatomic, assign) BOOL isForbidFlutterResponseTouch;

@end

@implementation LXFFlutterViewController

- (void)dealloc {
    NSLog(@"dealloc -- LXFFlutterViewController");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self isForbidResponseTouch]) {
        self.isForbidFlutterResponseTouch = YES;
        return;
    }
    NSLog(@"touchesBegan");
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.isForbidFlutterResponseTouch) {
        return;
    }
    NSLog(@"touchesMoved");
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.isForbidFlutterResponseTouch) {
        self.isForbidFlutterResponseTouch = NO;
        return;
    }
    NSLog(@"touchesEnded");
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.isForbidFlutterResponseTouch) {
        self.isForbidFlutterResponseTouch = NO;
        return;
    }
    NSLog(@"touchesCancelled");
    [super touchesCancelled:touches withEvent:event];
}


- (BOOL)isForbidResponseTouch {
    NSArray<UIView *> *subViews = self.view.subviews;
    
    for (NSInteger i = subViews.count - 1; i >= 0; i--) {
        UIView *subView = subViews[i];
        if ([self haveForbidResponseView:subView]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)haveForbidResponseView:(UIView *)view {
    if ([view conformsToProtocol:@protocol(FlutterForbidResponseTouchProtocol)]) {
        return YES;
    }
    
    NSArray<UIView *> *subViews = view.subviews;
    for (int i = 0; i < subViews.count; i++) {
        UIView *subView = subViews[i];
        if ([self haveForbidResponseView:subView]) {
            return YES;
        }
    }
    return NO;
}

@end
