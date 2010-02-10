;; Customize AucTeX

(add-paths-with ap (ap "f/auctex"))
(add-exec-paths-with ae (ae "/usr/texbin"))
(setenv "PATH" (concat (getenv "PATH") ":/usr/texbin"))
 	
(autoload-then ('latex-mode "auctex" "Major mode for editing LaTeX files")
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  (add-hook 'LaTeX-mode-hook 'auto-fill-mode)
  ;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

  (require 'reftex)       
  (setq reftex-plug-into-AUCTeX t)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t))

(setq auto-mode-alist (cons '("\\tex$" . latex-mode) auto-mode-alist))

(provide 'latex-start)