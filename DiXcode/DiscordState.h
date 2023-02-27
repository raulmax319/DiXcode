//
// DiscordState.h
//
// Created by Raul Max on 26/02/23.
// Copyright © 2023 Raul Max. All rights reserved.
//
  
#ifndef DISCORD_STATE_H
#define DISCORD_STATE_H

#include <stdio.h>

#include "discord.h"

struct DiscordState {
  std::unique_ptr<discord::Core> core;
};

#endif /* DISCORD_STATE_H */
