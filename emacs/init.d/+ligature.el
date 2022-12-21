;; -*- lexical-binding: t; -*-

(use-package ligature
  :config
  (ligature-set-ligatures
    'prog-mode
                                       ; ":>" ":<" ">:"
    '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>" ":::" "::=" "=:=" "==="
      "==>" "=!=" "=>>" "=<<" "=/=" "!==" "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->"
      "---" "-<<" "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->" "<--" "<-<"
      "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<" "..." "+++" "/==" "///" "_|_" "www"
      "&&" "^=" "~~" "~@" "~=" "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
      "[|" "]#" "::" ":=" "$>" "==" "=>" "!=" "!!" ">=" ">>" ">-" "-~" "-|"
      "->" "--" "-<" "<~" "<*" "<|" "<:" "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:"
      "#=" "#!"  "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:" "?=" "?." "??"
      ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)" "\\\\" "://" "#'"))

  :hook (emacs-startup . ligature-mode))

(provide '+ligature)
