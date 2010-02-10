;;
;; Initialization

(add-paths-with ap
  (ap "l/python"))

(autoload-then ('python-mode "python" "Major mode for editing Python files")
  (require 'ipython)
  (setq py-python-command-args '("-pylab" "-colors" "Linux"))
  (setq python-python-command "ipython")

  (custom-set-variables
   '(py-shell-switch-buffers-on-execute nil)))

(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))


(provide 'py-start)
