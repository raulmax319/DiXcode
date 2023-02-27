//
// DiscordActivityManager.h
//
// Created by Raul Max on 26/02/23.
// Copyright © 2023 Raul Max. All rights reserved.
//
  
#ifndef DISCORD_ACTIVITY_MANAGER_H
#define DISCORD_ACTIVITY_MANAGER_H

#ifdef __cplusplus
#include <iostream>
#include <string>

#include <thread>
#include <chrono>

#include "discord.h"
#include "ActivityManager.h"
#include "Constants.h"
#endif

#import <Foundation/Foundation.h>
#import "AppleScriptManager.h"


@interface DiscordActivityManager : NSObject

@property NSInteger clientId;
@property ActivityManager* manager;
@property AppleScriptManager* appleScript;

- (id) initWithClientId:(NSInteger)clientId;

/**
 Run the application
 */
- (int) run;

/**
 What are we doing.
 */
- (void) setDetails:(NSString*)detauls;

/**
 The workspace we are working in.
 */
- (void) setWorkspace:(NSString*)workspace;

- (void) setSmallImage:(NSString*)image;
- (void) setLargeImage:(NSString*)image;
- (void) setSmallText:(NSString*)text;
- (void) setLargeText:(NSString*)text;
- (void) startTimer;
- (void) setActivityType;

@end

#endif /* DISCORD_ACTIVITY_MANAGER_H */
