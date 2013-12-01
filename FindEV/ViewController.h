//
//  ViewController.h
//  FindEV
//
//  Created by Francis Kurupacheril on 11/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define INITIAL_COST_SAVINGS                            0
#define INITIAL_VALUE_SETTING                           0
#define AVERAGE_BREAKEVEN_YEARS                     10.69
#define TOTAL_CURRENT_SAVINGS                           0
#define AVERAGE_CHARGE_PER_MILE_COST                 0.05
#define LENGTH_OF_DISPLAY_STRINGS                     500
#define INITIAL_GAS_PER_MONTH                          10
#define INITIAL_MILES_PER_DAY                           1
#define INITIAL_ELEC_PER_MONTH                         20
#define AVERAGE_DAYS_PER_MONTH                      30.14
#define LEAST_COST_SAVINGS_NEEDED_FOR_VOLT           7000
#define LEAST_COST_SAVINGS_NEEDED_FOR_FOCUS_ELECTRIC 8000
#define LEAST_COST_SAVINGS_NEEDED_FOR_LEAF          12000
#define LEAST_COST_SAVINGS_NEEDED_FOR_CODA          20000
#define LEAST_COST_SAVINGS_NEEDED_FOR_TESLA         25000
#define LEAST_COST_SAVINGS                           7000

@interface ViewController : UIViewController {
  	UILabel *displayGas;
	UILabel *displayMiles;
	UILabel *displayElec;
	UILabel *displayFinalResult;
	float cost_savings_per_month;
	float average_breakeven_years;
	float average_charge_per_mile_cost;
	float total_cost_to_charge_EV_per_month;
	float total_current_savings;
	float total_electricity_bill_per_month;
	float gasperMonth;
	float elecperMonth;
	float milesperDay;
	NSMutableString  *displayResultString;
}

@property (nonatomic, retain) IBOutlet UILabel *displayFinalResult;
@property (nonatomic, retain) IBOutlet UILabel *displayGas;
@property (nonatomic, retain) IBOutlet UILabel *displayElec;
@property (nonatomic, retain) IBOutlet UILabel *displayMiles;
@property (nonatomic, retain) NSMutableString  *displayResultString;

-(void) processGasExpensesPerMonth: (float) gasExpenses;
-(void) processElectricityExpensesPerMonth: (float) electricExpenses;
-(void) processTotalMilesDrivenDaily: (float) totalMiles;
-(void) processAppropriateEV;
-(void) processGasExpensesLabel:(float) gasExpenses;
-(void) processElectricityExpensesLabel:(float) electricExpenses;
-(void) processTotalMilesDailyLabel:(float) totalMiles;

// Each Action corresponds to each bar and the final calculate button

-(IBAction) gasBar: (UISlider *) sender;
-(IBAction) electricityBar: (UISlider *) sender;
-(IBAction) milesBar: (UISlider *) sender;
-(IBAction) clickFindEV: (id) sender;

@end
