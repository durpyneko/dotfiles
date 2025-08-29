#!/bin/sh

cat ~/dotfiles/misc/ascii/banner_colored.txt

RESET="\033[0m"
BOLD="\033[1m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"

log_info()    { echo -e "${GREEN}[INFO]${RESET} $1"; }
log_warning() { echo -e "${YELLOW}[WARN]${RESET} $1"; }
log_error()   { echo -e "${RED}[ERROR]${RESET} $1"; }

show_help() {
    cat <<- EOF
$(echo -e "${BOLD}nyancfg${RESET} - Nyanix's dotfile manager")

$(echo -e "${BOLD}Usage:${RESET}")
  $(echo -e "${CYAN}nyancfg <command> [options]${RESET}")

$(echo -e "${BOLD}Commands:${RESET}")
  $(echo -e "${GREEN}hostname${RESET}           Show current hostname")
  $(echo -e "${GREEN}install${RESET}            Install dotfiles")
  $(echo -e "${GREEN}update${RESET}             Update dotfiles")
  $(echo -e "${GREEN}backup${RESET}             Backup existing dotfiles")
  $(echo -e "${GREEN}rebuild${RESET}            Rebuild nyanix with current config")
  $(echo -e "${GREEN}install-rebuild${RESET}    Install and rebuild nyanix")
  $(echo -e "${GREEN}help${RESET}               Show this help message")

$(echo -e "${BOLD}Examples:${RESET}")
  $(echo -e "${CYAN}nyancfg hostname${RESET}")
  $(echo -e "${CYAN}nyancfg install${RESET}")
EOF
}

install_dotfiles() {
    echo -e "${GREEN}Installing dotfiles...${RESET}"
    ln -sfv ~/dotfiles/.config/kitty/ ~/.config/
    ln -sfv ~/dotfiles/.config/fish/ ~/.config/
}

rebuild_nix() {
    echo -e "${GREEN}Starting Nyanix rebuild...${RESET}"
    sudo nixos-rebuild switch --print-build-logs --flake .
    if [ $? -eq 0 ]; then
        log_info "Rebuild finished successfully!"
    else
        log_error "Rebuild failed..."
    fi
}

case "$1" in
    hostname)
        echo -e "${YELLOW}hostname:${RESET} $(hostname)"
        ;;
    install|-i)
        install_dotfiles
        ;;
    update|-u)
        echo -e "${GREEN}Updating dotfiles...${RESET}"
        echo "TODO!"
        ;;
    backup|-b)
        echo -e "${GREEN}Backing up dotfiles...${RESET}"
        ;;
    rebuild|-r)
        rebuild_nix
        ;;
    install-rebuild|-ir)
        install_dotfiles
        rebuild_nix
        ;;
    help|-h|--help|"")
        show_help
        ;;
    *)
        echo -e "${BOLD}Unknown command:${RESET} $1"
        echo -e "Try '${CYAN}nyancfg help${RESET}'"
        exit 1
        ;;
esac
