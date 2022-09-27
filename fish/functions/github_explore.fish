function github_explore
  set -l dir (mktemp -d)
  git clone --depth 1 https://github.com/$argv $dir
  cd $dir
  br -sdp
end
