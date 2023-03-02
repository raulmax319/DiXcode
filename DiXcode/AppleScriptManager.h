//
// AppleScriptManager.h
//
// Created by Raul Max on 26/02/23.
// Copyright © 2023 Raul Max. All rights reserved.
//
  
#ifndef APPLE_SCRIPT_MANAGER_H
#define APPLE_SCRIPT_MANAGER_H

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface AppleScriptManager : NSObject

- (NSArray*) runAppScriptForValue:(NSString*)value;
- (NSString*) getActiveFileName;
- (NSString*) getActiveWorkspace;
- (NSString*) getActiveWindow;
- (BOOL) hasCharacter:(const char*)character forString:(NSString*)str;

@end

#endif /* APPLE_SCRIPT_MANAGER_H */
