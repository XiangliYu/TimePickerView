//
//  ViewController.m
//  DataPicker
//
//  Created by Mac on 16/9/13.
//  Copyright © 2016年 LoveSpending. All rights reserved.
//

#import "ViewController.h"
#import "NSString.h"

#define kScreen_Height      ([UIScreen mainScreen].bounds.size.height)
#define kScreen_Width       ([UIScreen mainScreen].bounds.size.width)

@interface ViewController ()<UITextFieldDelegate>{

    UIAlertController *alert;
}

@property(nonatomic,strong) UITextField *time;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.time = [[UITextField alloc] initWithFrame:(CGRectMake(10, 200, kScreen_Width-20, 40))];
    self.time.textAlignment = NSTextAlignmentCenter;
    self.time.delegate = self;
    self.time.placeholder = @"输入日期";
    self.time.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:self.time];

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    alert = [UIAlertController alertControllerWithTitle:nil message:@"\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:(CGRectMake(0, 0, kScreen_Width-20, 200))];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [alert.view addSubview:datePicker];

    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    
        //点击确定按钮的事件处理
        NSDate *selectedDate = datePicker.date;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        NSString *dateString = [formatter stringFromDate:selectedDate];
        self.time.text = dateString;

        
    }];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];


    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
