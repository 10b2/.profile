set_env_var "LC_ALL" "en_US.UTF-8"
set_env_var "LANG"  "en_US.UTF-8"

set_env_var "EDITOR" "$(command -v nvim)"
set_env_var "PAGER" "$(command -v less)"

set_env_var "PROFILE_HOME" "${XDG_CONFIG_HOME}/profile"
