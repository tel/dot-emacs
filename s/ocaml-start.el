;; Initialization
;;
(add-paths-with ap
  (ap "l/tuareg-mode/"))

(setq auto-mode-alist
          (append '(("\\.ml[iyl]?$" .  tuareg-mode)
		    ("\\.topml$" . tuareg-mode)) 
		  auto-mode-alist))

(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(autoload 'tuareg-imenu-set-imenu "tuareg-imenu"
  "Configuration of imenu for tuareg" t)

(provide 'ocaml-start)