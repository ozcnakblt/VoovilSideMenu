//
//  ViewController.m
//  VoovilSideMenu
//
//  Created by Özcan Akbulut on 23.10.13.
//  Copyright (c) 2013 Özcan Akbulut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic) NSArray *menuArray;

@end

@implementation ViewController
@synthesize menuArray, sideMenu, menuTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Modern Objective-C
    NSString *menuPlistPath = [[NSBundle mainBundle] pathForResource:@"sideMenu" ofType:@"plist"];
    menuArray = [[NSArray alloc] initWithContentsOfFile:menuPlistPath];
    
    // Begin Gesture
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
    // End Gesture
    
    // Begin - Custom Navigation,..
    self.navigationController.navigationBar.translucent = YES;
    [(UIView*)[self.navigationController.navigationBar.subviews objectAtIndex:0] setAlpha:0.8f];
    // End - Custom Navigation,..
}

#pragma mark - Actions -
- (IBAction)showMenuDown:(id)sender {
    
    if(sideMenu.frame.origin.x == 0) //only show the menu if it is not already shown
        [self showMenu];
    else
        [self hideMenu];
    
}

#pragma mark - animations -
-(void)showMenu{
    
    //slide the content view to the right to reveal the menu
    [UIView animateWithDuration:0.5 animations:^{
        self.navigationController.navigationBar.frame = CGRectMake(275, self.navigationController.navigationBar.frame.origin.y, self.navigationController.navigationBar.frame.size.width, self.navigationController.navigationBar.frame.size.height);

        [sideMenu setFrame:CGRectMake(menuTable.frame.size.width, sideMenu.frame.origin.y, sideMenu.frame.size.width, sideMenu.frame.size.height)];
    }];
}

-(void)hideMenu{
    
    //slide the content view to the left to hide the menu
    [UIView animateWithDuration:.5 animations:^{
        self.navigationController.navigationBar.frame = CGRectMake(0, self.navigationController.navigationBar.frame.origin.y, self.navigationController.navigationBar.frame.size.width, self.navigationController.navigationBar.frame.size.height);

        [sideMenu setFrame:CGRectMake(0, sideMenu.frame.origin.y, sideMenu.frame.size.width, sideMenu.frame.size.height)];
    }];
}

#pragma mark - Gesture handlers -

-(void)handleSwipeLeft:(UISwipeGestureRecognizer*)recognizer{
    
    if(sideMenu.frame.origin.x != 0)
        [self hideMenu];
}

-(void)handleSwipeRight:(UISwipeGestureRecognizer*)recognizer{
    if(sideMenu.frame.origin.x == 0)
        [self showMenu];
}

#pragma mark - UITableView Datasource -

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0)
        return 1;
    else
        return menuArray.count;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([indexPath section] == 0) {
        UITableViewCell *avatarCell = [tableView dequeueReusableCellWithIdentifier:@"avatarMenuCell"];
        UIImageView *imageAvatar = (UIImageView *) [avatarCell viewWithTag:301];
        imageAvatar.image = [UIImage imageNamed:@"avatar.png"];
        
        CALayer *imageLayer = imageAvatar.layer;
        [imageLayer setCornerRadius:60.0];
        [imageLayer setBorderWidth:0];
        [imageLayer setMasksToBounds:YES];
        return avatarCell;
    } else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
        
        NSDictionary *menuItem = [menuArray objectAtIndex:indexPath.row];
        
        UILabel *titleLabel = (UILabel *) [cell viewWithTag:300];
        titleLabel.text = menuItem[@"Title"];
        CALayer *separator = [CALayer layer];
        separator.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.25].CGColor;
        separator.frame = CGRectMake(31, 43, 200, .5);
        [cell.layer addSublayer:separator];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath section] == 0)
        return 150;
    else
        return 44;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    } else
        return @"Menu Items";
}

#pragma mark - UITableView Delegate -

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        NSLog(@"Pressed 0");
    }
    if (indexPath.row == 1) {
        NSLog(@"Pressed 1");
    }
    if (indexPath.row == 2) {
        NSLog(@"Pressed 2");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
