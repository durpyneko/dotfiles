#!/bin/sh

BOLD="\033[1m"
RESET="\033[0m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"

show_help() {
    cat <<- EOF
$(echo -e "${BOLD}nekocfg${RESET} - NixOS dotfile manager")

$(echo -e "${BOLD}Usage:${RESET}")
  $(echo -e "${CYAN}nekocfg <command> [options]${RESET}")

$(echo -e "${BOLD}Commands:${RESET}")
  $(echo -e "${GREEN}hostname${RESET}     Show current hostname")
  $(echo -e "${GREEN}install${RESET}      Install dotfiles")
  $(echo -e "${GREEN}update${RESET}       Update dotfiles")
  $(echo -e "${GREEN}backup${RESET}       Backup existing dotfiles")
  $(echo -e "${GREEN}help${RESET}         Show this help message")

$(echo -e "${BOLD}Examples:${RESET}")
  $(echo -e "${CYAN}nekocfg hostname${RESET}")
  $(echo -e "${CYAN}nekocfg install${RESET}")
EOF
}

log_info()    { echo -e "${GREEN}[INFO]${RESET} $1"; }
log_warning() { echo -e "${YELLOW}[WARN]${RESET} $1"; }
log_error()   { echo -e "${RED}[ERROR]${RESET} $1"; }

case "$1" in
    hostname)
        echo -e "${YELLOW}hostname:${RESET} $(hostname)"
        ;;
    install)
        echo -e "${GREEN}Installing dotfiles...${RESET}"
        ln -sfv ~/dotfiles/.config/kitty/ ~/.config/
        ln -sfv ~/dotfiles/.config/fish/ ~/.config/
        ;;
    update)
        echo -e "${GREEN}Updating dotfiles...${RESET}"
        echo "TODO!"
        ;;
    backup)
        echo -e "${GREEN}Backing up dotfiles...${RESET}"
        ;;
    rebuild)
        log_info "Starting NixOS rebuild..."
        sudo nixos-rebuild switch --print-build-logs --flake .
        if [ $? -eq 0 ]; then
            log_info "Rebuild finished successfully!"
        else
            log_error "Rebuild failed."
        fi
        ;;
    help|-h|--help|"")
        show_help
        ;;
    *)
        echo -e "${BOLD}Unknown command:${RESET} $1"
        echo -e "Try '${CYAN}nekocfg help${RESET}'"
        exit 1
        ;;
esac
