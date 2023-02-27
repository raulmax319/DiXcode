//
// main.m
//
// Created by Raul Max on 26/02/23.
// Copyright © 2023 Raul Max. All rights reserved.
//
  

#import <Foundation/Foundation.h>
#import "DiscordActivityManager.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    return [[[DiscordActivityManager alloc] initWithClientId:967118433265274900] run];
  }
}
