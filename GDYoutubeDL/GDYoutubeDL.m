//
//  GDYoutubeDL.m
//  GDYoutubeDL
//
//  Created by George Dan on 25/11/2015.
//  Copyright © 2015 George Dan. All rights reserved.
//

#import "GDYoutubeDL.h"

@implementation GDYoutubeDL

@synthesize arguments = _arguments;

+(BOOL)isYoutubeDLInstalled {
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/local/bin/youtube-dl"]) {
        return YES;
    }
    return NO;
}

-(GDYoutubeDL*)initWithURL:(NSURL*)url {
    self = [super init];
    if(self) {
        [self.arguments setObject:url forKey:@"URL"];
    }
    return self;
}

-(GDYoutubeDL*)initWithURL:(NSURL*)url atFilePath:(NSURL*)filePath {
    self = [super init];
    if(self) {
        [self.arguments setObject:url forKey:@"URL"];
        [self.arguments setObject:filePath forKey:@"filepath"];
    }
    return self;
}

-(void)addFileName:(NSString*)name {
    [self.arguments setObject:name forKey:@"filename"];
}

-(void)addStrictFileName:(BOOL)strict {
    [self.arguments setObject:[NSNumber numberWithBool:strict] forKey:@"strict"];
}

-(BOOL)beginDownload {
    NSTask *task = [[NSTask alloc] init];
    
    task.launchPath = @"/usr/local/bin/youtube-dl";
    task.arguments = [NSArray arrayWithObjects:@"-f", @"22", @"-o", [NSString stringWithFormat:@"%@", @"%(title)s.%(ext)s"], [self.arguments objectForKey:@"URL"], @"--restrict-filenames",nil];
    
    NSLog(@"youtube-dl %@", [task.arguments componentsJoinedByString:@" "]);
    
    NSPipe *outputPipe = [NSPipe pipe];
    [task setStandardOutput:outputPipe];
    [task setStandardError:outputPipe];
    NSFileHandle *readHandle = [outputPipe fileHandleForReading];
    
    [task launch];
    [task waitUntilExit];
    
    NSData *outputData = [readHandle readDataToEndOfFile];
    NSString *outputString = [[NSString alloc] initWithData:outputData encoding:NSUTF8StringEncoding];
    
    return NO;
}

-(NSMutableDictionary*)arguments {
    return self.arguments;
}


@end
