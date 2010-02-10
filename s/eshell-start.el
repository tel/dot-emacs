(setq eshell-visual-commands (append
                              '("mutt" "vim" "screen" "lftp" "ipython" "telnet" "ssh")
                              eshell-visual-commands))

(add-hook 'eshell-mode-hook
          '(lambda nil
             (eshell/export "EPOCROOT=\\Paragon\\")
             (let ((path (getenv "PATH")))
               (setq path (concat path ":~/abin/:~/bin/:~/.cabal/bin/"))
               (setenv "PATH" path))
             (local-set-key "\C-u" 'eshell-kill-input)))
