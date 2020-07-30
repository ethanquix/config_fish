# fastadd
set -gx PATH ~/.bin/ $PATH

set -gx GOPATH $HOME/code; set -gx GOROOT $HOME/.go; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g

# -- MODULES --
    # Utils module (must be loaded first)
        source ~/.config/fish/modules/utils/init.fish

    # Publica module
        source ~/.config/fish/modules/publica/init.fish