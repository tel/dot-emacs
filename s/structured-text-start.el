(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(autoload 'textile-mode "textile-mode"
  "Major mode for editing Textile files" t)

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.textile$" . textile-mode))

(provide 'structured-text-start)