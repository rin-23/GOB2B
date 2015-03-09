//
//  AppDelegate.m
//  GOB2B
//
//  Created by Rinat Abdrashitov on 2015-03-07.
//  Copyright (c) 2015 GOB2B. All rights reserved.
//

#import "AppDelegate.h"
#include "StartupViewController.h"
#include "SignupViewController.h"
#import <Crashlytics/Crashlytics.h>
#include "Keys.h"
#include "GOB2BQuestions.h"
#include "DataFactory.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Crashlytics startWithAPIKey:@"3c33801d279e506b0081fc68e59e9f00839ccff1"];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    BOOL key = [defaults boolForKey:kQuestionsCached];
    if (!key) {
        //need to read questinons from file and create initial cache
        GOB2BQuestions* gQuestions = [DataFactory createQuestionsFromBundle];
        if (gQuestions == nil) {
            NSLog(@"[ERROR] Couldnt create initial questions cache");
            [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Couldn't create initial  questions" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
        } else {
            if(![DataFactory writeQuestionsToCache:gQuestions]) {
                NSLog(@"[ERROR] Coudlnt write initial questions to cache");
                [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Couldn't write initial  questions to cache" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
            } else {
                [defaults setBool:YES forKey:kQuestionsCached];
                [defaults synchronize];
            }
        }
    } 
    
    StartupViewController* viewContr = [[StartupViewController alloc] init];
    self.window.rootViewController = viewContr;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
