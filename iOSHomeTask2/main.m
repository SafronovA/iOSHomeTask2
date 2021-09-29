//
//  main.m
//  iOSHomeTask2
//
//  Created by Aliaksei Safronau EPAM on 27.09.21.
//

#import <Foundation/Foundation.h>
#import "NSString+NSStringCustom.h"
#import <objc/message.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str = @"My String";
        [str setUuid:[NSUUID UUID]];
        NSLog(@"UUID = %@", [str uuid]);
        objc_msgSend(str, @selector(shortValue));
    }
    return 0;
}
