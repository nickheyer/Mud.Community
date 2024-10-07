# Read values from the environment or config
mod_source_path = ${mod_source_path}
game_mod_directory = ${game_mod_directory}
backup_directory = ${backup_directory}
log_file = ${log_file}

# Debug print all variables this script can see
vars = dump_variables
echo ${vars}

# Ensure variables are set
assert ${mod_source_path} "mod_source_path not provided"
assert ${game_mod_directory} "game_mod_directory not provided"
assert ${backup_directory} "backup_directory not provided"
assert ${log_file} "log_file not provided"

# Check if the mod directory exists; create if it doesn't
if not is_dir ${game_mod_directory}
    mkdir ${game_mod_directory}
    echo "Created game mod directory: ${game_mod_directory}" >> ${log_file}
end

# Check if the backup directory exists; create if it doesn't
if not is_dir ${backup_directory}
    mkdir ${backup_directory}
    echo "Created backup directory: ${backup_directory}" >> ${log_file}
end

# Log the start of the installation
echo "Starting installation of Sample Mod..." >> ${log_file}

# Backup existing files before installing the mod
echo "Backing up existing files..." >> ${log_file}
if cp ${game_mod_directory} ${backup_directory}
    echo "Backup successful." >> ${log_file}
else
    echo "Backup failed!" >> ${log_file}
    exit_code = exit 1
end

# Copy mod files to the game directory
echo "Copying mod files to game directory..." >> ${log_file}
if cp ${mod_source_path} ${game_mod_directory}
    echo "Mod files copied successfully." >> ${log_file}
else
    echo "Failed to copy mod files." >> ${log_file}
    exit_code = exit 1
end

# Finalize installation
echo "Sample Mod installation completed successfully." >> ${log_file}
