pid=$$
tty=$(tty)

exit_insert_mode() {
	zvm_exit_insert_mode false
	zvm_reset_prompt
}

exit_visual_mode() {
	zvm_exit_visual_mode false
	zvm_reset_prompt
}

exit_normal_mode() {
	zvm_enter_insert_mode
	stty -F $tty intr ^C
	kill -s SIGINT $pid
}

go_to_begin() {
	zle vi-digit-or-beginning-of-line
}

remap_c() {
	stty -F $tty intr undef
}

reset_c() {
	stty -F $tty intr ^C
}

precmd_functions+=(remap_c)
preexec_functions+=(reset_c)

zvm_config() {
	ZVM_SYSTEM_CLIPBOARD_ENABLED=true
	ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
	ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX
	ZVM_VI_EDITOR='nvim -c "set filetype=bash"'
	zvm_define_widget exit_insert_mode
	zvm_define_widget exit_visual_mode
	zvm_define_widget exit_normal_mode
	zvm_define_widget go_to_begin
	zvm_bindkey viins '^c' exit_insert_mode
	zvm_bindkey visual '^c' exit_visual_mode
	zvm_bindkey vicmd '^c' exit_normal_mode
	zvm_bindkey vicmd '_' go_to_begin
}

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
