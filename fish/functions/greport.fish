function greport --wraps='gpg -d ~/Tresors/Documents/diary/money/ledger.gpg | lreport -f -' --description 'alias greport=gpg -d ~/Tresors/Documents/diary/money/ledger.gpg | lreport -f -'
  gpg -d ~/Tresors/Documents/diary/money/ledger.gpg | lreport -f - $argv;
end
