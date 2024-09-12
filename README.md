Working dotnet 6 version of compLexity Demo Player.

compLexity Demo Player is the official Counter-Strike demo player of compLexity Gaming.

# Features

    * Play any 1.0 to 1.6 demo with the current version of 1.6.
    * Detailed demo analysis: view events, player information, scores and player network statistics.
    * A built-in server browser to assist in monitoring and joining HLTV and SourceTV servers. Includes scraping of Gotfrag's scoreboard page.

Playback of demos from games other than Counter-Strike is also supported:

Steam, Half-Life engine

    * Counter-Strike
    * Team Fortress Classic
    * Day of Defeat
    * Deathmatch Classic
    * Half-Life: Opposing Force
    * Ricochet
    * Half-Life
    * Counter-Strike: Condition Zero
    * Counter-Strike: Condition Zero Deleted Scenes
    * Half-Life: Blue Shift

Steam, Source engine

    * Half-Life 2
    * Counter-Strike: Source
    * Half-Life: Source
    * Day of Defeat: Source
    * Half-Life 2: Lost Coast
    * Half-Life: Source Deathmatch
    * Half-Life 2: Episode One
    * Portal
    * Team Fortress 2
    * Garry's Mod
    * Left 4 Dead

Pre-Steam

    * Half-Life and all mods (Half-Life engine version 1.0.0.4 and later).

# Development

## Installing Prerequisites

Only the .NET 8 SDK is required to compile the project.  The following instructions will be using Chocolatey as a package manager for Windows, which makes installing software much easier as it can be done by a single command.  Chocolatey can be installed using the [Chocolatey install guide](https://chocolatey.org/install#individual) if it isn't already installed.

### dotnet SDK

```powershell
choco install dotnet-sdk --version=8.0.100
```

### Git

Additionally, if Git has not already been installed it can be installed using the following:

```powershell
choco install git.install
```

## Compiling

The project can be compiled by running the following in the repository root (the directory with the .sln file).  This will generate an .exe that can be run locally.  Subsequent `dotnet build` commands will perform incremental compilation.

```powershell
dotnet build
```