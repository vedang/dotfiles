# Github Clone
function ghc
  # Get the name of the repo, drop a .git if it exists in the clone URL
  set -l dir $HOME/src/github/(string split . (path basename $argv) -r -m1 -f1)
  git clone --recurse-submodules $argv $dir
  cd $dir
  br -sdp
end
