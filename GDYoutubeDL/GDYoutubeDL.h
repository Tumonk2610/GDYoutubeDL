//
//  GDYoutubeDL.h
//  GDYoutubeDL
//
//  Created by George Dan on 25/11/2015.
//  Copyright © 2015 George Dan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GDYoutubeDL : NSObject
+(BOOL)isYoutubeDLInstalled;
-(GDYoutubeDL*)initWithURL:(NSURL*)url;
-(GDYoutubeDL*)initWithURL:(NSURL*)url atFilePath:(NSURL*)filePath;
-(void)addFileName:(NSString*)name;
-(void)addStrictFileName:(BOOL)strict;
-(BOOL)beginDownload;
@property (strong, nonatomic) NSMutableDictionary* arguments;
-(NSMutableDictionary*)arguments;
@end
