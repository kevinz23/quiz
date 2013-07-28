//
//  QuestionController.m
//  Quiz
//
//  Created by Kevin.Z on 7/28/13.
//  Copyright (c) 2013 Kevin. All rights reserved.
//
#import "QuestionView.h"
#import "QuestionModel.h"
#import "QuestionController.h"

@interface QuestionController ()
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (strong, nonatomic) QuestionModel *model;
@property (weak, nonatomic) IBOutlet QuestionView *questionView;
@property (strong ,nonatomic) id data;
@end

@implementation QuestionController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.model = [[QuestionModel alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getQuestionData:) name:@"getQuestionData" object:nil];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.model fetchQuestionData];
}

-(void)getQuestionData:(NSNotification *)notification
{
    self.data = notification.object;
}

-(void)setData:(id)data
{
    _data = data;
    self.question.text = [_data valueForKey:@"question"];
    NSArray *option = [_data valueForKey:@"option"];
    for(int i =0;i< option.count ;i++)
    {
        UIButton *button =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(30, 120+i*60, 200, 50);
        [button addTarget:self action:@selector(answer:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i + 1;
        [button setTitle:[option objectAtIndex:i] forState:UIControlStateNormal];
        [self.questionView addSubview:button];
    }
}
- (void)answer:(UIButton *)sender
{
    NSInteger answer = [[_data valueForKey:@"answer"] intValue];
    NSString *message;
    if (sender.tag == answer)
        message = @"correct";
    else
        message = @"incorrect";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
    [alert show];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
