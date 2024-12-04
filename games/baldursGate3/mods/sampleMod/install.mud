#!/bin/mud

# Debug print all variables this script can see
vars = dump_variables
echo ${vars}

# Ensure variables are set
defined = is_defined mod_source_path
if not ${defined}
    mod_source_path = temp_file mod
    echo "Set mod source path to:" ${mod_source_path}
end

defined = is_defined game_mod_directory
if not ${defined}
    tmp_path = temp_dir
    game_mod_directory = join_path ${tmp_path} /tmp_mod_dir
    mkdir game_mod_directory
    echo "Set log file path to:" ${game_mod_directory}
end

defined = is_defined backup_directory
if not ${defined}
    tmp_path = temp_dir
    backup_directory = join_path ${tmp_path} /tmp_backup_dir
    mkdir backup_directory
    echo "Set log file path to:" ${backup_directory}
end

defined = is_defined log_file
if not ${defined}
    log_file = temp_file log
    echo "Set log file path to:" ${log_file}
end

# Log the start of the installation
appendfile ${log_file} "Starting installation of Sample Mod...\n"

# Take a lil breaky-poo
ten_sec = calc 10 * 1000
sleep ${ten_sec}

# Backup existing files before installing the mod
appendfile ${log_file} "Backing up existing files...\n"

if cp ${game_mod_directory} ${backup_directory}
    appendfile ${log_file} "Backup successful.\n"
else
    appendfile ${log_file} "Backup failed!\n"
end

# Copy mod files to the game directory
appendfile ${log_file} "Copying mod files to game directory...\n"

if cp ${mod_source_path} ${game_mod_directory}
    appendfile ${log_file} "Mod files copied successfully.\n"
else
    appendfile ${log_file} "Failed to copy mod files.\n"
end

# Finalize installation
appendfile ${log_file} "Sample Mod installation completed successfully.\n"

echo "Log file can be found here:" ${log_file}
