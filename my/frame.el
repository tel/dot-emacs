;; Frame maximization
;;
(require 'maxframe)
;;(setq mf-max-width 1440
;;      mf-max-height 900)
(add-hook 'window-setup-hook 'maximize-frame t)