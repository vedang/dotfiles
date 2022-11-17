# Github Explore, from @abhin4v
function github_explore
  set -l dir (mktemp -d)
  git clone --depth 1 $argv $dir
  cd $dir
  br -sdp
end
