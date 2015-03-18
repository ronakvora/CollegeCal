//
//  CCEventsTableViewController.m
//  CollegeCal
//
//  Created by Ronak Vora on 4/13/14.
//  Copyright (c) 2014 Ronak. All rights reserved.
//

#import "CCEventsTableViewController.h"

@interface CCEventsTableViewController ()

@end

@implementation CCEventsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([CCEvent savedEvents]) {
        
        return [[CCEvent savedEvents] count];
        
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"EventCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSData *eventData = [[CCEvent savedEvents] objectAtIndex:indexPath.row];
    CCEvent *event = [NSKeyedUnarchiver unarchiveObjectWithData:eventData];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    
    NSString *dateString = [dateFormatter stringFromDate:event.eventStartDate];
    
    cell.textLabel.text = event.eventName;
    cell.detailTextLabel.text = dateString;
    

    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"segue" sender:indexPath];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSMutableArray *savedEvents = [NSMutableArray arrayWithArray:[CCEvent savedEvents]];
        [savedEvents removeObjectAtIndex:indexPath.row];
        [[NSUserDefaults standardUserDefaults] setObject:savedEvents forKey:@"EventsKey"];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationAutomatic];
        
    }
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"segue"]) {
        
        CCEventDetailsViewController *viewController = [segue destinationViewController];
        
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        viewController.index = indexPath.row;
        
    }
    
    
}


@end
