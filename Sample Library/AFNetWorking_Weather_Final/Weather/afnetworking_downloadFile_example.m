//
//  afnetworking_downloadFile_example.m
//  Weather
//
//  Created by admin on 8/27/14.
//  Copyright (c) 2014 Scott Sherwood. All rights reserved.
//

#import "afnetworking_downloadFile_example.h"

@implementation afnetworking_downloadFile_example
- (IBAction)downloadFile:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://www.hulkshare.com/dl/qw30o7x373a8/stan_courtois_&_felly_vs_cutting_crew_-_die_in_your_arms_(x-centrik_mix)_%5B_www.themusix.net_%5D.mp3"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    NSString *fullPath = [NSTemporaryDirectory() stringByAppendingPathComponent:[url lastPathComponent]];
    
    [operation setOutputStream:[NSOutputStream outputStreamToFileAtPath:fullPath append:NO]];
    
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        NSLog(@"bytesRead: %u, totalBytesRead: %lld, totalBytesExpectedToRead: %lld", bytesRead, totalBytesRead, totalBytesExpectedToRead);
    }];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"RES: %@", [[[operation response] allHeaderFields] description]);
        
        NSError *error;
        NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:fullPath error:&error];
        
        if (error) {
            NSLog(@"ERR: %@", [error description]);
        } else {
            NSNumber *fileSizeNumber = [fileAttributes objectForKey:NSFileSize];
            long long fileSize = [fileSizeNumber longLongValue];
            
           // [[_downloadFile titleLabel] setText:[NSString stringWithFormat:@"%lld", fileSize]];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"ERR: %@", [error description]);
    }];
    
    [operation start];
}
@end
