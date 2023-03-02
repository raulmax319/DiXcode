//
// AppleScriptManager.m
//
// Created by Raul Max on 26/02/23.
// Copyright © 2023 Raul Max. All rights reserved.
//
  

#import "AppleScriptManager.h"

@implementation AppleScriptManager

- (NSArray*) runAppScriptForValue:(NSString *)value {
  NSString* scriptStr = @"tell application \"Xcode\"\n";
  scriptStr = [scriptStr stringByAppendingString:value];
  scriptStr = [scriptStr stringByAppendingString:@"\n"];
  scriptStr = [scriptStr stringByAppendingString:@"end tell"];

  NSDictionary* errorInfo = nil;

  NSAppleScript* script = [[NSAppleScript alloc] initWithSource:scriptStr];
  NSAppleEventDescriptor* descriptor = [script executeAndReturnError:&errorInfo];
  NSInteger numberOfItems = [descriptor numberOfItems];

  if (numberOfItems == 0) {
    return [[NSArray alloc] init];
  }

  NSMutableArray<NSString*>* values = [[NSMutableArray alloc] init];

  for (size_t i = 0; i <= numberOfItems; ++i) {
    NSAppleEventDescriptor* innerDescriptor = [descriptor descriptorAtIndex:i];
    NSString* stringValue = [innerDescriptor stringValue];
    NSString* suffix = @" — Edited";

    if (stringValue == nil) {
      continue;
    }

    if ([stringValue length] == 0) {
      continue;
    }

    BOOL hasSpaceCharacter = [self hasCharacter:" " forString:stringValue];
    BOOL hasDotCharacter = [self hasCharacter:"." forString:stringValue];
    BOOL hasEditedSuffix = [stringValue hasSuffix:suffix];

    if (hasEditedSuffix) {
      stringValue = [stringValue componentsSeparatedByString:suffix].firstObject;
      NSLog(@"edited: %@", stringValue);
    }

    if (hasSpaceCharacter) {
      NSString* newValue = [stringValue componentsSeparatedByString:@" "].lastObject;
      [values addObject:newValue];
      continue;
    }

    if (hasDotCharacter) {
      [values addObject:stringValue];
    }
  }

  return values;
}

- (NSString*) getActiveFileName {
  NSArray<NSString*>* values = [self runAppScriptForValue:@"return name of windows"];

  return [values firstObject];
}

- (NSString *) getActiveWorkspace {
  NSArray<NSString*>* values = [self runAppScriptForValue:@"return active workspace document"];

  for (id value : values) {
    if ([self hasCharacter:"." forString:value]) {
      return [value componentsSeparatedByString:@"."].firstObject;
    }
  }

  return [[NSString alloc] init];
}

- (NSString *) getActiveWindow {
  NSString* scriptStr = @"tell application \"System Events\"\n"
  @"get the name of every application process whose frontmost is true\n"
  @"end tell";

  NSDictionary* errorInfo = nil;

  NSAppleScript* script = [[NSAppleScript alloc] initWithSource:scriptStr];
  NSAppleEventDescriptor* descriptor = [script executeAndReturnError:&errorInfo];
  NSInteger numberOfItems = [descriptor numberOfItems];

  if (numberOfItems == 0) {
    NSLog(@"Couldn't get active window.");
    return @"";
  }

  for (size_t i = 1; i <= numberOfItems; ++i) {
    NSAppleEventDescriptor* inner = [descriptor descriptorAtIndex:i];

    if (inner != nil) {
      return [inner stringValue];
    }
  }

  return @"";
}

- (BOOL) hasCharacter:(const char *)character forString:(NSString *)str {
  return [str rangeOfString:[NSString stringWithFormat:@"%s", character]].location != NSNotFound;
}

@end
