// 
//  APCWithdrawCompleteViewController.m 
//  APCAppCore 
// 
// Copyright (c) 2015, Apple Inc. All rights reserved. 
// 
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
// 
// 1.  Redistributions of source code must retain the above copyright notice, this
// list of conditions and the following disclaimer.
// 
// 2.  Redistributions in binary form must reproduce the above copyright notice, 
// this list of conditions and the following disclaimer in the documentation and/or 
// other materials provided with the distribution. 
// 
// 3.  Neither the name of the copyright holder(s) nor the names of any contributors 
// may be used to endorse or promote products derived from this software without 
// specific prior written permission. No license is granted to the trademarks of 
// the copyright holders even if such marks are included in this software. 
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE 
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL 
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, 
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. 
// 
 
#import "APCWithdrawCompleteViewController.h"
#import "APCAppCore.h"
#import "UIColor+APCAppearance.h"
#import "UIFont+APCAppearance.h"
#import "UIImage+APCHelper.h"
#import "APCWithdrawSurveyViewController.h"
#import "APCUser+Bridge.h"

@interface APCWithdrawCompleteViewController ()

@end

@implementation APCWithdrawCompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAppearance];
    
    self.navigationItem.hidesBackButton = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
  APCLogViewControllerAppeared();
}

- (void)setupAppearance
{
    [self.messageLabel setTextColor:[UIColor appSecondaryColor1]];
    [self.messageLabel setFont:[UIFont appRegularFontWithSize:19.0]];
    
    [self.surveyLabel setTextColor:[UIColor appSecondaryColor1]];
    [self.surveyLabel setFont:[UIFont appLightFontWithSize:17.0]];
    
    [self.logoImageVIew setImage:[UIImage imageNamed:@"logo_disease"]];
}

- (APCUser *) user {
    return ((APCAppDelegate *)[UIApplication sharedApplication].delegate).dataSubstrate.currentUser;
}

- (IBAction) takeSurvey: (id) __unused sender
{
    APCWithdrawSurveyViewController *viewController = [[UIStoryboard storyboardWithName:@"APCProfile" bundle:[NSBundle appleCoreBundle]] instantiateViewControllerWithIdentifier:@"APCWithdrawSurveyViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction) noThanks: (id) __unused sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
