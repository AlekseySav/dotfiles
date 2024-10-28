@echo off
set /p "distro=wsl distro: "
if !%distro%! == !u24!	set distro=Ubuntu-24.04
if !%distro%! == !u18!	set distro=Ubuntu-18.04
@echo Running WSL with %distro%

@C:\\Windows\\System32\\wsl.exe ~ -d %distro% -e /home/linuxbrew/.linuxbrew/bin/zsh -c "tmux a || tmux new"
