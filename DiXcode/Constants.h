//
// Constants.h
//
// Created by Raul Max on 26/02/23.
// Copyright © 2023 Raul Max. All rights reserved.
//
  

#import <Foundation/Foundation.h>

#ifndef CONSTANTS_H
#define CONSTANTS_H

//@interface Constants : NSObject
//
//@property NSDictionary<NSString*, NSString*>* fileName;
//
//- (NSString*) getDetailedNameFor:(NSString*)name;
//
//@end

class Constants {
public:
  static NSDictionary<NSString*, NSString*>* fileName;
  static NSString* getDetailedName(NSString*);
};

#endif /* CONSTANTS_H */
