//
// ActivityManager.cpp
//
// Created by Raul Max on 26/02/23.
// Copyright © 2023 Raul Max. All rights reserved.
//

#include "ActivityManager.h"

namespace {
volatile bool interrupted { false };
}

ActivityManager::ActivityManager(long int clientId): clientId(clientId) {}

void ActivityManager::createState() {
  discord::Core::Create(clientId, DiscordCreateFlags_Default, &core);

  state.core.reset(core);

  if (!state.core) {
    std::cout << "Failed to create a Discord instance.";
    std::exit(-1);
  }
}

void ActivityManager::updateActivity() {
  state.core->ActivityManager().UpdateActivity(activity, [](discord::Result result) {
    std::cout << ((result == discord::Result::Ok) ? "Succeeded in " : "Failed") << "updating activity." << std::endl;
    interrupted = true;
  });

  runCallbacks();
}

void ActivityManager::runCallbacks() {
  signal(SIGINT, [](int) {
    interrupted = true;
  });

  if (!interrupted) {
    core->RunCallbacks();
    std::this_thread::sleep_for(std::chrono::milliseconds(16));
  }
}

void ActivityManager::setDetails(char const* details) {
  activity.SetDetails(details);
}

void ActivityManager::setWorkspace(char const* state) {
  activity.SetState(state);
}

void ActivityManager::setLargeText(char const* text) {
  activity.GetAssets().SetLargeText(text);
}

void ActivityManager::setSmallText(char const* text) {
  activity.GetAssets().SetSmallText(text);
}

void ActivityManager::setLargeImage(char const* name) {
  activity.GetAssets().SetLargeImage(name);
}

void ActivityManager::setSmallImage(char const* name) {
  activity.GetAssets().SetSmallImage(name);
}

void ActivityManager::startTimer() {
  std::time_t currentTime = std::time(0);
  activity.GetTimestamps().SetStart(currentTime);
}

void ActivityManager::setActivityType() {
  activity.SetType(discord::ActivityType::Playing);
}
