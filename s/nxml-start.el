;; Initialization
;;
(load "nxml-mode/rng-auto.el")

;; Automode
;;
(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
	    auto-mode-alist))
(setq magic-mode-alist
      (cons '("<\\?xml " . nxml-mode)
	    magic-mode-alist))

(fset 'xml-mode 'nxml-mode)
(fset 'html-mode 'nxml-mode)

(provide 'nxml-start)
