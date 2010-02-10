;; Initialization
(add-paths-with ap
  (ap "f/predictive/"))

(autoload-then ('predictive-mode "predictive" "predictive" t)
  (set-default 'predictive-auto-add-to-dict t)
  (setq predictive-auto-complete nil
        completion-resolve-behaviour 'reject
        predictive-main-dict 'tel-dict
        predictive-auto-learn t
        predictive-auto-add-to-dict t
        predictive-add-to-dict-ask nil
        predictive-use-auto-learn-cache nil
        ;predictive-which-dict t
        ))

(provide 'predictive-start)