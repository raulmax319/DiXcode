//
// FileConstants.mm
//
// Created by Raul Max on 26/02/23.
// Copyright © 2023 Raul Max. All rights reserved.
//
  

#import "FileConstants.h"

//@implementation FileConstants
//
//+ (NSDictionary<NSString *,NSString *> *) fileName {
//  return  @{
//    @"xcodeproj": @"Xcode Project",
//    @"swift": @"Swift",
//    @"m": @"Objective-C",
//    @"mm": @"Objective-C++",
//    @"c": @"C",
//    @"cpp": @"C++",
//    @"cxx": @"C++",
//    @"h": @"C Header",
//    @"hpp": @"C++ Header",
//    @"hxx": @"C++ Header",
//  };
//}
//
//+ (NSString *) getDetailedNameFor:(NSString *)name {
//  return [[FileConstants fileName] objectForKey:name];
//}
//
//@end

NSDictionary<NSString*, NSString*>* Constants::fileName = @{
  @"xcodeproj": @"Xcode Project",
  @"swift": @"Swift",
  @"m": @"Objective-C",
  @"mm": @"Objective-C++",
  @"c": @"C",
  @"cpp": @"C++",
  @"cxx": @"C++",
  @"h": @"C Header",
  @"hpp": @"C++ Header",
  @"hxx": @"C++ Header",
};

NSString* Constants::getDetailedName(NSString* name) {
  return [Constants::fileName objectForKey:name];
}
