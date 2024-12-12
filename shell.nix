{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "kaiju-dev-env";
  
  buildInputs = [
    pkgs.bun
    pkgs.nodePackages.firebase-tools
    pkgs.nodePackages.node-gyp
    pkgs.showmethekey
  ];

  shellHook = ''
    export PATH="$PATH:$PWD/node_modules/.bin"
    export NPM_PACKAGES="$PWD/node_modules"
    export BROWSER="brave --enable-features=TouchpadOverscrollHistoryNavigation"
    tmux new-session -d -s ktc 
    tmux split-window -v -t ktc
    tmux send-keys -t ktc:1.2 'bun install' Enter && tmux send-keys -t ktc:1.2 'bun docz:dev' Enter
    $BROWSER http://localhost:3000 &
    tmux break-pane -t ktc:2
    #tmux send-keys -t ktc:1.1 'git pull' Enter
    tmux send-keys -t ktc:1.1 'nvim' Enter
    tmux attach-session -t ktc
    git status
  '';
}
