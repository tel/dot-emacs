;; Haskell-mode
(add-paths-with ap
  (ap "l/haskell-mode"))

(load "haskell-site-file")
(autoload 'turn-on-haskell-doc-mode "haskell-doc" nil t)

(setq haskell-literate-default 'bird)
(eval-after-load "haskell-mode"
  '(define-key haskell-mode-map (kbd "C-c C-?") 'haskell-hoogle))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; Optional, mutually exclusive with normal indent
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(provide 'haskell-start)