//
// Constants.mm
//
// Created by Raul Max on 26/02/23.
// Copyright © 2023 Raul Max. All rights reserved.
//
  

#import "Constants.h"

NSDictionary<NSString*, NSString*>* Constants::fileName = @{
  @"xcodeproj": @"a Xcode Project",
  @"swift": @"a Swift",
  @"m": @"an Objective-C",
  @"mm": @"an Objective-C++",
  @"c": @"a C",
  @"cpp": @"a C++",
  @"cxx": @"a C++",
  @"h": @"a C Header",
  @"hpp": @"a C++ Header",
  @"hxx": @"a C++ Header",
};

NSString* Constants::getDetailedName(NSString* name) {
  return [Constants::fileName objectForKey:name];
}
