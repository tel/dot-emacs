(add-hook 'shell-mode-hook 
	  (lambda ()
	    (ansi-color-for-comint-mode-on)
            (setq comint-process-echoes t)))

(add-hook 'eshell-mode-hook
          '(lambda nil
             (setenv "PATH" (concat "/usr/local/bin:"
                                    (getenv "PATH")))
             (local-set-key "\C-u" 'eshell-kill-input)))

(shell)
(provide 'shell-start)