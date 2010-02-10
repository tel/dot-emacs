;; Initialization
;;

; CSS mode
(autoload 'css-mode "css-mode" "Mode for editing CSS files" t) 

;; Configuration
;;
(setq auto-mode-alist
      (append '(("\\.css$" . css-mode))
	      auto-mode-alist))

(provide 'webdev-start)