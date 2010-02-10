
;; Haskell-mode
(load "haskell-site-file")
(autoload 'turn-on-haskell-doc-mode "haskell-doc" nil t)

(setq haskell-literate-default 'bird)
(eval-after-load "haskell-mode"
  '(define-key haskell-mode-map (kbd "C-c C-?") 'haskell-hoogle))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent) ; Optional, mutually exclusive with normal indent

(require 'haskell-mode)
(define-key haskell-mode-map "\C-ch" 'haskell-hoogle)
(setq haskell-hoogle-command "hoogle")

(provide 'hs-start)