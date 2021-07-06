while true; do
    case "$1" in
        -i)
            echo [*] Grant Permissions to install fp in /usr/bin/
            cp FiraCode-Bold.ttf $HOME/.fonts/.
            type -p 'fp' &>/dev/null || sudo rm /usr/bin/fp
            sudo cp fp /usr/bin/.
            echo [*] Installed fp.
            exit 1
            ;;
        -u)
            echo [*] Grant Permissions to uninstall fp in /usr/bin/.
            type -p 'fp' &>/dev/null || sudo rm /usr/bin/fp
            echo [*] Uninstalled fp.
            exit 1
            ;;
        *)
            echo -e "Usage:\ninstall.sh -i       install fp\ninstall.sh -u       uninstall fp"
            break
    esac
done
