# GBA Development Portfolio

This repository serves as my personal portfolio for Game Boy Advance development. It is an interactive portfolio themed around a virtual office, with a collection of projects and demos made from scratch in C.

## The Concept

The goal of this project is to create an interactive hub world in the form of a virtual office. By exploring the office, the player can interact with objects that showcase my skills, accomplishments, and past work. The office will also serve as a portal to various mini-game demos.

## Current Status: 🚧 Building the Foundation

The project is currently in the initial construction phase, focused on building the core engine and the office hub.

**Current Features:**
* A foundational compiling process.
* Basic sprite rendering and D-pad controls for the player character.

## Roadmap

The immediate goal is to flesh out the office environment. After that, the first of many planned mini-games will be developed.

* **Office Hub:** Implement interactable objects that link to portfolio items (e.g., displaying text about my skills, projects, and accomplishments).
* **Mini-Game Demo:** "Completos Overcooked!"** An `Overcooked`-inspired infinite mini-game based on the theme of making Chilean *completos*.

## Technology Stack

* **Language:** C
* **Platform:** Nintendo Game Boy Advance
* **Toolchain:** devkitARM
* **Core Library:** libtonc

## Setup and Build

To compile this project, you will need to install and configure the **devkitPro** toolchain.
You can build it natively on your machine by following the manual installation guide or you can use Docker.

***

### Building with Docker :whale: (Recommended)

This is the easiest method and works on Windows, macOS, and Linux without needing to install devkitPro manually.

1.  **Install Docker:** Make sure you have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running.
2.  **Compile:** Open your terminal, navigate to the project's root directory, and run the following command:
    ```bash
    docker run --rm -v "${PWD}:/src" -w /src -e DEVKITPRO="/opt/devkitpro" devkitpro/devkitarm:latest /bin/bash -c 'export PATH="$DEVKITPRO/tools/bin:$DEVKITPRO/devkitARM/bin:$PATH" && make'
    ```
This command downloads the official devkitPro environment, sets up the correct environment variables, compiles the code, and the final `GBA-Portfolio.gba` ROM will be created in your project folder.

***

### Building Natively (macOS)

Follow these steps if you want to install the full devkitPro toolchain on your local machine.

#### Installation

* **Prerequisite:** You may need to install the Xcode Command Line Tools. Open the Terminal and run:
    ```bash
    xcode-select --install
    ```
* **Download the devkitPro Installer:** Go to the [devkitPro pacman releases page](https://github.com/devkitPro/pacman/releases) and download the latest `devkitpro-pacman-installer.pkg` file.
* **Run the Installer:** Open the downloaded `.pkg` file and follow the on-screen instructions.
* **Install GBA Tools:** Once finished, open a new Terminal and run the following command to install the GBA-specific toolchain:
    ```bash
    sudo dkp-pacman -S gba-dev
    ```

#### Environment Setup

Follow these steps if you want to install the full devkitPro toolchain on your local machine.

You need to tell your terminal where to find the devkitPro tools.

* **Edit your `.zshrc` file** (the default shell configuration on modern macOS):
    ```bash
    nano ~/.zshrc
    ```
* **Add Environment Variables:** Scroll to the end of the file and add these lines:
    ```bash
    export DEVKITPRO=/opt/devkitpro
    export DEVKITARM=$DEVKITPRO/devkitARM
    export PATH=$DEVKITPRO/tools/bin:$DEVKITARM/bin:$PATH
    ```
* **Apply Changes:** Save the file, then **close and open a new terminal window** for the changes to take effect.

#### Compilation

With the environment set up, you can now build the ROM.

* **Compile the code:**
    ```bash
    make
    ```
    This will produce a `GBA-Portfolio.gba` ROM file that can be run in any GBA emulator.