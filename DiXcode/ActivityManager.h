//
// ActivityManager.h
//
// Created by Raul Max on 26/02/23.
// Copyright © 2023 Raul Max. All rights reserved.
//
  

#ifndef ACTIVITY_MANAGER_H
#define ACTIVITY_MANAGER_H

#include <iostream>
#include <thread>

#include "DiscordState.h"

class ActivityManager {
  long int clientId;
  discord::Core* core {};
  DiscordState state {};

  ActivityManager() = default;
  ~ActivityManager() = default;
public:
  ActivityManager(long int clientId);
  discord::Activity activity {};

  /**
   Creates the state needed to run the RPC Server.
   */
  void createState();

  /**
   What are we doing.
   */
  void setDetails(char const*);

  /**
   The workspace we are working in.
   */
  void setWorkspace(char const*);

  /**
   The image presented in the current activity.
   */
  void setLargeImage(char const*);

  /**
   The image presented in the bottom right of the current activity.
   */
  void setSmallImage(char const*);

  /**
   The text decoration for the current activity.
   */
  void setLargeText(char const*);

  /**
   The text decoration for the small image of the current activity.
   */
  void setSmallText(char const*);

  /**
   Starts the timer for the current activity.
   */
  void startTimer();

  /**
   Set the activity type (defaults to Playing).
   I don't intent to change this unless they add a new type.
   */
  void setActivityType();

  /**
   Updates the current activity with a new updated data.
   */
  void updateActivity();

  /**
   Run all callbacks in order to update the new activity.
   */
  void runCallbacks();
};

#endif /* ACTIVITY_MANAGER_H */
