# Set up commands for the config repo on windows
# stuff like symlinks from windows locations to linux locations
#
# you will probably have to run this as administrator

# nvim config files
New-Item -ItemType SymbolicLink -Path $env:localappdata\nvim -Target $HOME\.config\nvim