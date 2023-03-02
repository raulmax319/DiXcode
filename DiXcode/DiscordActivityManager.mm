//
// DiscordActivityManager.mm
//
// Created by Raul Max on 26/02/23.
// Copyright © 2023 Raul Max. All rights reserved.
//
  

#import "DiscordActivityManager.h"

@implementation DiscordActivityManager

- (id) initWithClientId:(NSInteger)clientId {
  _sleepTime = 1000;
  _manager = new ActivityManager(clientId);
  _appleScript = [[AppleScriptManager alloc] init];

  return self;
}

- (int) run {
  _manager->createState();

  [self startTimer];

  while(true) {
    _activeWindow = [_appleScript getActiveWindow];
    _activeFile = [_appleScript getActiveFileName];
    _workspace = [_appleScript getActiveWorkspace];
    _fileExtension = [_activeFile componentsSeparatedByString:@"."].lastObject;
    _fileName = Constants::getDetailedName(_fileExtension);

    [self updateActivityForSimulator];
    [self updateActivityForIdling];
    [self updateActivityForEditing];

    [self updateActivity];
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

- (void) sleepFor:(unsigned int)milliseconts {
  std::this_thread::sleep_for(std::chrono::milliseconds(milliseconts));
}

- (void) updateActivityForIdling {
  while (_fileName == nil) {
    [self setDetails:@"Idling."];
    [self setWorkspace:[[NSString alloc] initWithFormat:@"Workspace: %@", _workspace]];
    [self setLargeText:@"Xcode"];
    [self setLargeImage:@"xcode-icon"];

    [self updateActivity];
  }
}

- (void) updateActivityForEditing {
  [self setDetails:[[NSString alloc] initWithFormat:@"Editing %@", _activeFile]];
  [self setWorkspace:[[NSString alloc] initWithFormat:@"Workspace: %@", _workspace]];
  [self setLargeText:[[@"Editing " stringByAppendingString:_fileName] stringByAppendingString:@" file."]];
  [self setSmallText:@"Xcode"];
  [self setSmallImage:@"xcode-icon"];
  [self setLargeImage:_fileExtension];
}

- (void) updateActivityForSimulator {
  while ([_activeWindow isEqualToString:@"Simulator"]) {
    _activeWindow = [_appleScript getActiveWindow];

    [self setDetails:[@"Using " stringByAppendingString:_activeWindow]];
    [self setLargeText:@"iOS Simulator"];
    [self setLargeImage:@"ios-simulator"];

    [self updateActivity];
  }
}

- (void) updateActivity {
  _manager->updateActivity();
  [self sleepFor:_sleepTime];
}

@end
