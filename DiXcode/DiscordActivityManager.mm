//
// DiscordActivityManager.mm
//
// Created by Raul Max on 26/02/23.
// Copyright © 2023 Raul Max. All rights reserved.
//
  

#import "DiscordActivityManager.h"

@implementation DiscordActivityManager

- (id) initWithClientId:(NSInteger)clientId {
  _manager = new ActivityManager(clientId);
  _appleScript = [[AppleScriptManager alloc] init];

  return self;
}

- (int) run {
  _manager->createState();

  [self startTimer];

  while(true) {
    NSString* activeWindow = [_appleScript getActiveFileName];
    NSString* workspace = [_appleScript getActiveWorkspace];
    NSString* fileExtension = [activeWindow componentsSeparatedByString:@"."].lastObject;
    NSString* fileName = Constants::getDetailedName(fileExtension);

    NSLog(@"File extension: %@", fileExtension);
    NSLog(@"File name: %@", fileName);

    [self setDetails:[[NSString alloc] initWithFormat:@"Editing %@", activeWindow]];
    [self setWorkspace:[[NSString alloc] initWithFormat:@"Workspace: %@", workspace]];
    [self setLargeText:[[@"Editing " stringByAppendingString:fileName] stringByAppendingString:@" file."]];

    [self setSmallText:@"Xcode"];
    [self setSmallImage:@"xcode"];
    [self setLargeImage:fileExtension];

    _manager->updateActivity();
    std::this_thread::sleep_for(std::chrono::milliseconds(1000));
  }

  return 0;
}

- (void) setDetails:(NSString*)details {
  _manager->setDetails([details cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (void) setWorkspace:(NSString*)workspace {
  _manager->setWorkspace([workspace cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (void) setSmallImage:(NSString*)image {
  _manager->setSmallImage([image cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (void) setLargeImage:(NSString*)image {
  _manager->setLargeImage([image cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (void) setSmallText:(NSString*)text {
  _manager->setSmallText([text cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (void) setLargeText:(NSString*)text {
  _manager->setLargeText([text cStringUsingEncoding:NSUTF8StringEncoding]);
}

- (void) startTimer {
  _manager->startTimer();
}

- (void) setActivityType {
  _manager->setActivityType();
}

@end
