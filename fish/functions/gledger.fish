function gledger --wraps='gpg -d ~/Tresors/Documents/diary/money/ledger.gpg | ledger -f -' --description 'alias gledger=gpg -d ~/Tresors/Documents/diary/money/ledger.gpg | ledger -f -'
  gpg -d ~/Tresors/Documents/diary/money/ledger.gpg | ledger -f - $argv;
end
