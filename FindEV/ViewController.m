//
//  ViewController.m
//  FindEV
//
//  Created by Francis Kurupacheril on 11/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize displayGas, displayMiles, displayElec, displayFinalResult, displayResultString;


/*
 * Display functions for each slider movement
 */

-(void) processGasExpensesLabel:(float) gasExpenses
{
	NSString* myNewString = [NSString stringWithFormat:@"$%.2f", gasExpenses];
	[displayGas setText: myNewString];	
}

-(void) processElectricityExpensesLabel:(float) electricExpenses 
{
	NSString* myNewString = [NSString stringWithFormat:@"$%.2f", electricExpenses];
	[displayElec setText: myNewString];	
}

-(void) processTotalMilesDailyLabel:(float) totalMiles
{
	NSString* myNewString = [NSString stringWithFormat:@"%.2f", totalMiles];
    [displayMiles setText: myNewString];	
}

/*
 * Assign values when the sliders are moved
 */

-(void) processGasExpensesPerMonth:(float) gasExpenses
{
	gasperMonth = gasExpenses ;
}

-(void) processElectricityExpensesPerMonth:(float) electricExpenses 
{
	elecperMonth = electricExpenses ;
}

-(void) processTotalMilesDrivenDaily:(float) totalMiles
{
	milesperDay = totalMiles ;
}

/*
 * The method that processes the button. 
 */

-(void) processAppropriateEV 
{
	total_current_savings = INITIAL_VALUE_SETTING ; 
	total_cost_to_charge_EV_per_month = AVERAGE_DAYS_PER_MONTH * milesperDay * average_charge_per_mile_cost;
	cost_savings_per_month = gasperMonth - total_cost_to_charge_EV_per_month;
	total_current_savings = cost_savings_per_month * average_breakeven_years;
	total_electricity_bill_per_month = total_cost_to_charge_EV_per_month + elecperMonth ;
	
	/*
	 * Display the correct messages depending on the ranges calculated above. May have to 
     * add more EV's and also correspondingly adjust the ranges.
	 */
	
	if (total_current_savings <= 0) {
        [displayResultString setString:[NSString stringWithFormat:@"---------------Invalid entries----------------and all the three slider values have to make sense"]];
        [displayFinalResult setText:displayResultString];
    }
    
    else if ((total_current_savings) > 0 && (total_current_savings < LEAST_COST_SAVINGS)) {
        [displayResultString setString:[NSString stringWithFormat:@"Over 10 years, you save only $%.2f and No EV is affordable with such cost savings", total_current_savings]];
        [displayFinalResult setText: displayResultString];
	} 
    
    else if ((total_current_savings) > LEAST_COST_SAVINGS_NEEDED_FOR_TESLA) {
        [displayResultString setString:[NSString stringWithFormat:@"Over 10 years, you save $%.2f and Your Affordable EV = Tesla Model S and New monthly Electric bill = $%.2f",
           total_current_savings, total_electricity_bill_per_month]];
        [displayFinalResult setText: displayResultString];

    } 
    
    else if ((total_current_savings >= LEAST_COST_SAVINGS_NEEDED_FOR_VOLT) && (total_current_savings < LEAST_COST_SAVINGS_NEEDED_FOR_FOCUS_ELECTRIC )) {
        [displayResultString setString:[NSString stringWithFormat:@"Over 10 years, you save $%.2f and Your Affordable EV = Chevrolet Volt and New monthly Electric bill = $%.2f",
           total_current_savings, total_electricity_bill_per_month]];
        [displayFinalResult setText: displayResultString];
    }
          
    else if ((total_current_savings >= LEAST_COST_SAVINGS_NEEDED_FOR_FOCUS_ELECTRIC) && (total_current_savings < LEAST_COST_SAVINGS_NEEDED_FOR_LEAF )) {
        [displayResultString setString:[NSString stringWithFormat:@"Over 10 years, you save $%.2f and Your Affordable EV = Ford Focus Electric and New monthly Electric bill = $%.2f",
           total_current_savings, total_electricity_bill_per_month]];
        [displayFinalResult setText: displayResultString];
    }
    
    else if ((total_current_savings >= LEAST_COST_SAVINGS_NEEDED_FOR_LEAF) && (total_current_savings < LEAST_COST_SAVINGS_NEEDED_FOR_CODA )) {
        [displayResultString setString:[NSString stringWithFormat:@"Over 10 years, you save $%.2f and Your Affordable EV = Nissan Leaf and New monthly Electric bill = $%.2f",
          total_current_savings, total_electricity_bill_per_month]];
        [displayFinalResult setText: displayResultString];
    }
         
    else if ((total_current_savings >= LEAST_COST_SAVINGS_NEEDED_FOR_CODA) && (total_current_savings < LEAST_COST_SAVINGS_NEEDED_FOR_TESLA )) {
        [displayResultString setString:[NSString stringWithFormat:@"Over 10 years, you save $%.2f and Your Affordable EV = CODA Coda and New monthly Electric bill = $%.2f",
          total_current_savings, total_electricity_bill_per_month]];
        [displayFinalResult setText: displayResultString];

    } 
	
	total_current_savings = INITIAL_VALUE_SETTING ; 
	total_cost_to_charge_EV_per_month = INITIAL_VALUE_SETTING;
	cost_savings_per_month = INITIAL_VALUE_SETTING;
	total_electricity_bill_per_month = INITIAL_VALUE_SETTING;
}


-(IBAction) gasBar: (UISlider *) sender
{
	UISlider *slider = (UISlider*)sender;
    float sliderValue = [slider value];
	[self processGasExpensesPerMonth:sliderValue];
	[self processGasExpensesLabel:sliderValue];
}

-(IBAction) electricityBar: (UISlider *) sender
{
	UISlider *slider = (UISlider*)sender;
    float sliderValue = [slider value];
	[self processElectricityExpensesPerMonth:sliderValue];
	[self processElectricityExpensesLabel:sliderValue];
}

-(IBAction) milesBar: (UISlider *) sender
{
	UISlider *slider = (UISlider*)sender;
    float sliderValue = [slider value];
	[self processTotalMilesDrivenDaily:sliderValue];
	[self processTotalMilesDailyLabel:sliderValue];
}

-(IBAction) clickFindEV: (id) sender
{
	[self processAppropriateEV];
}

/*===========================================================
 * Code Added by Xcode. To be implemented.
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    /*
     * Set all the initial values. 
     */
    
    cost_savings_per_month = INITIAL_COST_SAVINGS;
	average_breakeven_years = AVERAGE_BREAKEVEN_YEARS; // Ask Francis Kurupacheril if you wanna know how this was calculated :)
	total_current_savings = TOTAL_CURRENT_SAVINGS;
	average_charge_per_mile_cost = AVERAGE_CHARGE_PER_MILE_COST; // It costs around 3-5 cents to charge an EV for it to drive a mile
	self.displayFinalResult = [NSMutableString stringWithCapacity: LENGTH_OF_DISPLAY_STRINGS];
    gasperMonth = INITIAL_GAS_PER_MONTH;
    milesperDay = INITIAL_MILES_PER_DAY;
    elecperMonth = INITIAL_ELEC_PER_MONTH;
    
    /*
     * Display the initial slider values.
     */
    
    [self processGasExpensesLabel:gasperMonth];
    [self processElectricityExpensesLabel:elecperMonth];
    [self processTotalMilesDailyLabel:milesperDay];
    
    
   // [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    return YES;

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
