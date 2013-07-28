//
//  QuestionModel.m
//  Quiz
//
//  Created by Kevin.Z on 7/28/13.
//  Copyright (c) 2013 Kevin. All rights reserved.
//

#import "QuestionModel.h"

@implementation QuestionModel

- (id)init
{
    self = [super init];
    if (self){
    }
    return self;
}
-(void)fetchQuestionData
{
    NSDictionary *questionData = @{@"question":@"question1",@"option":@[@"option1",@"option2",@"option3",@"option4"],@"answer":@"3"};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"getQuestionData" object:questionData];}
@end
