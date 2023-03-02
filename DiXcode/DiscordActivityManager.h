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

@property unsigned int sleepTime;
@property NSInteger clientId;
@property ActivityManager* manager;
@property AppleScriptManager* appleScript;

@property (nonatomic) NSString* activeWindow;
@property (nonatomic) NSString* activeFile;
@property (nonatomic) NSString* workspace;
@property (nonatomic) NSString* fileExtension;
@property (nonatomic) NSString* fileName;

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
- (void) sleepFor:(unsigned int)milliseconts;
- (void) updateActivityForSimulator;
- (void) updateActivityForIdling;
- (void) updateActivityForEditing;
- (void) updateActivity;

@end

#endif /* DISCORD_ACTIVITY_MANAGER_H */
