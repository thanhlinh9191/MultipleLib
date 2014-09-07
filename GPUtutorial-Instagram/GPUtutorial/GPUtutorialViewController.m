//
//  GPUtutorialViewController.m
//  GPUtutorial
//
//  Created by Nick Barrowclough on 3/26/13.
//  Copyright (c) 2013 iSoftware Developers. All rights reserved.
//

#import "GPUtutorialViewController.h"

@interface GPUtutorialViewController ()

@end

@implementation GPUtutorialViewController

@synthesize imageView, filtersTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    filterNames = [[NSMutableArray alloc] init];
    
    [self coolingLookup];
}


//get number of sections in tableView from challenges array
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

//get number of rows by counting number of challenges
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return filterNames.count;
}


//setup cells in tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //setup cell
    static NSString *CellIdentifier = @"GPUTutorialCell";
    GPUtutorialCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary *filteredDictionary = [filterNames objectAtIndex:indexPath.row];
    
    cell.imageFilename.text = [filteredDictionary objectForKey:@"filename"];
    cell.filteredImage.image = [filteredDictionary objectForKey:@"filteredImage"];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *filteredDictionary = [filterNames objectAtIndex:indexPath.row];
    imageView.image = [filteredDictionary objectForKey:@"filteredImage"];
}

- (void) applyFilter:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        [self coolingLookup];
    }
    
}

- (void) coolingLookup {
    UIImage *filteredimage;
    NSString *filename = @"lookup_cooling.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    
    [self invertImage];
}

- (void) invertImage {
    UIImage *filteredimage;
    NSString *filename = @"lookup_invert.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self sepiaLookup];
}

- (void) sepiaLookup {
    UIImage *filteredimage;
    NSString *filename = @"lookup_sepia.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupVibrance];
}

- (void) lookupVibrance {
    UIImage *filteredimage;
    NSString *filename = @"lookup_vibrance.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupCooling2];
}

- (void) lookupCooling2 {
    UIImage *filteredimage;
    NSString *filename = @"lookup_cooling2.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupSepia2];
}

- (void) lookupSepia2 {
    UIImage *filteredimage;
    NSString *filename = @"lookup_sepia2.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupInfrared];
}

- (void) lookupInfrared {
    UIImage *filteredimage;
    NSString *filename = @"lookup_infrared.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupHighkey];
}

- (void) lookupHighkey {
    UIImage *filteredimage;
    NSString *filename = @"lookup_highkey.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupFilter1];
}

- (void) lookupFilter1 {
    UIImage *filteredimage;
    NSString *filename = @"lookup_filter1.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupWarming];
}

- (void) lookupWarming {
    UIImage *filteredimage;
    NSString *filename = @"lookup_warming.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [self lookupFilter2];
}

- (void) lookupFilter2 {
    UIImage *filteredimage;
    NSString *filename = @"lookup_filter2.png";
    
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc] initWithImage:imageView.image];
    
    GPUImagePicture *lookupImageSource = [[GPUImagePicture alloc] initWithImage:[UIImage imageNamed:filename]];
    GPUImageLookupFilter *lookupFilter = [[GPUImageLookupFilter alloc] init];
    [stillImageSource addTarget:lookupFilter];
    [lookupImageSource addTarget:lookupFilter];
    
    [stillImageSource processImage];
    [lookupImageSource processImage];
    [lookupFilter imageFromCurrentlyProcessedOutput];
    filteredimage = [lookupFilter imageFromCurrentlyProcessedOutput];
    
    NSDictionary *filteredDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:filteredimage, @"filteredImage", filename, @"filename", nil];
    
    [filterNames insertObject:filteredDictionary atIndex:0];
    
    [filtersTable reloadData];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
