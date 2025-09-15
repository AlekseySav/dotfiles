exit_insert_mode() {
	zvm_exit_insert_mode false
	zvm_reset_prompt
}

exit_visual_mode() {
	zvm_exit_visual_mode false
	zvm_reset_prompt
}

remap_c() {
	stty intr undef
	zvm_bindkey viins '^c' exit_insert_mode
	zvm_bindkey visual '^c' exit_visual_mode
}

reset_c() {
	stty intr ^C
}

precmd_functions+=(remap_c)
preexec_functions+=(reset_c)

zvm_config() {
	ZVM_SYSTEM_CLIPBOARD_ENABLED=true
	ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
	ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX
	zvm_define_widget exit_insert_mode
	zvm_define_widget exit_visual_mode
}

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
