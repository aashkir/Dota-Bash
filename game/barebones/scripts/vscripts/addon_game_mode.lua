-- This is the entry-point to your game mode and should be used primarily to precache models/particles/sounds/etc

require('internal/util')
require('gamemode')
require('events')
require('timers')

function Precache( context )
  print("[BAREBONES] Performing pre-load precache")
--[[
  This function is used to precache resources/units/items/abilities that will be needed
  for sure in your game and that will not be precached by hero selection.  When a hero
  is selected from the hero selection screen, the game will precache that hero's assets,
  any equipped cosmetics, and perform the data-driven precaching defined in that hero's
  precache{} block, as well as the precache{} block for any equipped abilities.

  See GameMode:PostLoadPrecache() in gamemode.lua for more information
  ]]

  DebugPrint("[BAREBONES] Performing pre-load precache")

  -- Particles can be precached individually or by folder
  -- It it likely that precaching a single particle system will precache all of its children, but this may not be guaranteed
  PrecacheResource("particle", "particles/econ/generic/generic_aoe_explosion_sphere_1/generic_aoe_explosion_sphere_1.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_venomancer/venomancer_venomous_gale.vpcf", context)
  PrecacheResource("particle_folder", "particles/test_particle", context)
  PrecacheResource( "particle_folder", "particles/units/heroes/wisp", context)
  PrecacheResource( "particle_folder", "particles/units/heroes/techies", context)
  PrecacheResource( "particle_folder", "particles/units/heroes/omniknight", context)
  PrecacheResource("particle", "particles/units/heroes/hero_wisp/wisp_relocate_channel.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_wisp/wisp_relocate_timer.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_wisp", context)
  PrecacheResource("particle", "particles/units/heroes/hero_techies/techies_suicide_base.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_omniknight/omniknight_guardian_angel_wings_buff.vpcf", context)
  PrecacheResource("particle", "particles/units/heroes/hero_wisp_spirit.pcf", context)
  PrecacheResource( "model_folder", "models/heroes/wisp/", context )

  -- Models can also be precached by folder or individually
  -- PrecacheModel should generally used over PrecacheResource for individual models
  PrecacheResource("model_folder", "particles/heroes/antimage", context)
  PrecacheResource( "model_folder", "particles/heroes/wisp/", context )
  PrecacheResource( "model", "particles/heroes/wisp/", context )
  PrecacheResource("model", "particles/heroes/viper/viper.vmdl", context)
  PrecacheModel("models/heroes/viper/viper.vmdl", context)
  PrecacheModel("models/heroes/wisp/wisp.vmdl", context)

  -- Sounds can precached here like anything else
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_gyrocopter.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_omniknight.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_wisp.vsndevts", context) 

  -- Entire items can be precached by name
  -- Abilities can also be precached in this way despite the name
  PrecacheItemByNameSync("example_ability", context)
  PrecacheItemByNameSync("item_example_item", context)
  PrecacheItemByNameSync("reincarnate", context)
  PrecacheItemByNameSync("item_alch", context)

  -- Entire heroes (sound effects/voice/models/particles) can be precached with PrecacheUnitByNameSync
  -- Custom units from npc_units_custom.txt can also have all of their abilities and precache{} blocks precached in this way
  PrecacheUnitByNameSync("npc_dota_hero_ancient_apparition", context)
  PrecacheUnitByNameSync("npc_dota_hero_enigma", context)
end

-- Create the game mode when we activate
function Activate()
  GameRules.GameMode = GameMode()
  GameRules.GameMode:InitGameMode()
end

GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_GOODGUYS, 1 )
GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_BADGUYS, 1 )
GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_1, 1 )
GameRules:SetCustomGameTeamMaxPlayers( DOTA_TEAM_CUSTOM_2, 1 )