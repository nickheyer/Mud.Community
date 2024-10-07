# Mud.Community

An open-source repository for `.mud` files and configurations, designed to be compatible with [Mud Mod Manager](https://github.com/nickheyer/Mud). This repository aims to simplify the modding experience for a wide range of games, offering a centralized collection of everything the Mud Mod Manager needs to do it's job. Its platform-agnostic design means that whether you’re modding a game on PC, Mac, or Linux, the same `.mud` scripts can be adapted to work seamlessly.

The Mud Community Repo (and Mud itself) empowers users to automate game setup, manage installations, and create consistent modding experiences across different platforms. Contributions from the community help ensure that the repository continues to grow and evolve, making mod management easier for everyone.

## Project Structure

```
📦Mud.Community
 ┣ 📂games
 ┃ ┗ 📂<GAME_FOLDER> // Example: baldursGate3
 ┃   ┣ 📜config.json
 ┃   ┣ 📜<MUD_SCRIPT>.mud // Example: init.mud
 ┃   ┣ 📜<MUD_SCRIPTS...>.mud
 ┃   ┗ 📂mods
 ┃     ┗ 📂<MOD_FOLDER> // Example: crazyClothingMod
 ┃       ┣ 📜config.json
 ┃       ┣ 📜<MUD_SCRIPT>.mud // Example: install.mud
 ┃       ┗ 📜<MUD_SCRIPTS...>.mud
 ┃  
 ┣ 📜.gitignore
 ┣ 📂.vscode
 ┣ 📜LICENSE
 ┣ 📜README.md
 ┗ 📜manifest.json
```

### Overview of Key Files and Folders

- **`manifest.json`**: The main index of the repository. It lists all supported games and their mods, including paths to configuration files and scripts. Each game and mod is identified by an `id`, `name`, `version`, and includes references to any scripts used for installation, updates, and more.

- **`games/`**: Contains directories for each supported game. Each game folder follows this structure:
  - **`<GAME_FOLDER>`**: The root directory for a game, named using a consistent identifier (e.g., `baldursGate3`).
    - **`config.json`**: Defines user-configurable settings for the game, like backup options or custom directories.
    - **`<MUD_SCRIPT_...>.mud`**: `.mud` scripts that handle game-specific actions, such as initialization (`init.mud`) or updates (`update.mud`).
    - **`mods/`**: Contains subdirectories for each mod available for that game. See below for a breakdown of this folder.

- **`mods/`**: Each mod folder under `games/<GAME_FOLDER>/mods/` includes:
  - **`<MOD_FOLDER>`**: The root directory for a mod, named using a consistent identifier (e.g., `crazyClothingMod`).
    - **`config.json`**: Contains user-configurable settings specific to the mod.
    - **`<MUD_SCRIPT_...>.mud`**: Scripts like `install.mud`, `post_install.mud`, `pre_install.mud`, etc., which handle various stages of mod installation and updates.

### How to Contribute

We not only welcome contributions from the community, but this project is entirely reliant on it. Here’s how you can get involved:

1. **Fork the Repository**: Create your own fork of the repository on GitHub.
2. **Clone Your Fork**: Clone your fork to your local machine:
   ```bash
   git clone https://github.com/yourusername/Mud.Community.git
   ```
3. **Add a New Game or Mod**:
   - For new games, create a directory under `games/` named after the game (e.g., `games/baldursGate3`). Add a `config.json` file, any `.mud` scripts needed (e.g., `init.mud`), and a `mods/` folder for any mods.
   - For new mods, add a subdirectory under the appropriate game’s `mods/` folder, and include a `config.json` and any `.mud` scripts necessary for the mod.
   - Update `manifest.json` to include your new game or mod, following the existing structure.
4. **Additional Assets**: You can include additional assets at any level of the project (e.g. `games/battleToads/mods/datingSimMod/modPackage.zip`). 
5. **Test Your Changes**: Make sure your scripts and configurations work correctly with the Mud Mod Manager.
6. **Create a Pull Request**: Once you’re satisfied with your changes, create a pull request to the main repository. Include a brief description of the changes and the reasoning behind them.

### Guidelines for Configuration and Scripts

- **Config Files**: Ensure that your `config.json` files are concise and focus on user-facing settings. Only include fields that users are likely to adjust.
- **Scripts**: Scripts should be written in `.mud` files, following the structure defined in the manifest. Keep them simple, modular, and well-documented.
- **Coding Style**: Follow best practices for clean and maintainable code. This helps ensure that contributions are easy to review and integrate.
- **Testing**: Before submitting, ensure that your configurations and scripts work as expected with the Mud Mod Manager.

### FAQ

**Q: What is a `.mud` file?**  
A: `.mud` files are scripts used by the Mud Mod Manager to automate game and mod setup tasks. These scripts can handle tasks like initializing a game for mods, installing or removing mods, and performing updates. They are written in a bash-like way, but incredibly simplified. Please check out the `Repl` feature in the Mud Mod Maniger to learn mud syntax, features of the standard library, and how it can interact with the app itself.

**Q: How do I write mud code? Where can I find its documentation/examples?**  
A: Mud is a scripting language forked from [Duckscript](https://github.com/sagiegurari/duckscript), designed for ease of use within the Mud Mod Manager. You can write scripts using simple commands to perform tasks like file manipulation, directory management, and more. For detailed documentation and examples of the commands available in Mud, you can refer to the [Getting Started With Duckscript Documentation](https://github.com/sagiegurari/duckscript/blob/master/docs/_includes/content.md).

**Q: How do I know which settings to include in a `config.json`?**  
A: Think about what options a user might want to customize. Focus on providing meaningful choices that impact how mods are applied, like backup options, custom directories, and mod-specific adjustments.

**Q: Where do I find more information about the Mud Mod Manager?**  
A: Visit the [Mud Mod Manager GitHub repository](https://github.com/nickheyer/Mud) for more details on how the manager works, including documentation on using `.mud` scripts.

### License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
