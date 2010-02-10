
(add-paths-with ap
  (ap "l/haml"))

(autoload-then ('haml-mode "haml-mode" "Major mode for editing HAML files" t))
(autoload-then ('sass-mode "sass-mode" "Major mode for editing SASS files" t))

(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

(provide 'haml-start)