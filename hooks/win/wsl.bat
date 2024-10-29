@echo off
set /p "distro=wsl distro: "
if !%distro%! == !u24!	set distro=Ubuntu-24.04
if !%distro%! == !u18!	set distro=Ubuntu-18.04
if !%distro%! == !ssh!	goto command
@echo Running WSL with %distro%

@C:\\Windows\\System32\\wsl.exe ~ -d %distro% -e ${zsh.path}
@exit

: command
set /p "user=username: "
set /p "port=port: "
@ssh -p %port% %user%@127.0.0.1 -t ${zsh.path}
