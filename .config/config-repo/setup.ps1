# Set up commands for the config repo on windows
# stuff like symlinks from windows locations to linux locations
#
# you will probably have to run this as administrator

# Print commands as they are run
Set-PSDebug -Trace 1

# nvim config files
New-Item -ItemType SymbolicLink -Path $env:localappdata\nvim -Target $HOME\.config\nvim