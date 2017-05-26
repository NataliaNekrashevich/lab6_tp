//
//  ViewController.m
//  lab6-2
//
//  Created by admin on 25/05/17.
//  Copyright (c) 2017 admin All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refresh:(id)sender {

    NSString *zapros = [NSString stringWithFormat:@"%1$@%2$@%3$@", @"https://query.yahooapis.com/v1/public/yql?q=select%20item.condition.temp%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22", [self cityBox].text, @"%2C%20il%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys" ];
    
    NSURL *url = [[NSURL alloc] initWithString: zapros];
    
    NSData *contents = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *forcasting = [NSJSONSerialization JSONObjectWithData:contents options:NSJSONReadingMutableContainers error:nil];
    NSString *temperature = [NSString stringWithFormat:@"%1$@", forcasting[@"query"][@"results"][@"channel"][@"item"][@"condition"][@"temp"]];
    
   
    double tempCels = [temperature doubleValue];
    tempCels = (tempCels - 32.0) * 5.0 / 9.0;
    
    [self.indicator setText:[NSString stringWithFormat:@"%.1f", tempCels]];
    if(tempCels > 15) [[self indicator] setTextColor:[UIColor redColor]];
    else if(tempCels> 5) [[self indicator] setTextColor:[UIColor orangeColor]];
    else [[self indicator] setTextColor:[UIColor greenColor]];
}
@end
