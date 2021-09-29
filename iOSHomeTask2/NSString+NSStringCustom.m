//
//  NSString+NSStringCustom.m
//  Hometask2
//
//  Created by Aliaksei Safronau EPAM on 27.09.21.
//

#import "NSString+NSStringCustom.h"
#import <objc/runtime.h>

static void *PropertyKey = @"UUIDPropertyKey";

@implementation NSString (NSStringCustom)

-(NSUUID *) uuid{
    return objc_getAssociatedObject(self, PropertyKey);
}

-(void) setUuid:(NSUUID *)uuid{
    objc_setAssociatedObject(self, PropertyKey, uuid, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void) forwardInvocation: (NSInvocation *) anInvocation {
    NSLog(@"forwardInvocation called");
    if ([anInvocation selector] == @selector(shortValue)){
       NSLog(@"forwardInvocation: Unknow message catched");
    }
    return;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"methodSignatureForSelector called");
    if ([NSNumber instancesRespondToSelector: aSelector]) {
        NSLog(@"methodSignatureForSelector: It is NSNumber");
        return [NSNumber instanceMethodSignatureForSelector: aSelector];
    }
    return [super methodSignatureForSelector:aSelector];
}

@end
