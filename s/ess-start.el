;; Initialization

(add-paths-with ap
  (ap "l/ess/lisp"))

;; These files contain appropriate autoloads
(require 'ess-site)
(require 'essd-jags)
(require 'r-utils)

;; Customization

(setq ess-ask-for-ess-directory 'nil
      ess-directory "~/")


(provide 'ess-start)
