;;
;; Initialization
(add-paths-with ap
  (ap "l/ruby-mode/")
  (ap "f/rinari/"))

;; Ruby Mode
(autoload-then ('inferior-ruby-mode "inf-ruby" "Major mode for IRB interaction" t))

(autoload-multiple "ruby-mode" (('ruby-mode "Major mode for ruby files" t)
                                ('inferior-ruby-mode "Major mode for IRB interaction" t))
  ;; (require 'ruby-electric)
  (require 'inf-ruby)
  (require 'rake-mode)
  (require 'snippet)
  
  (defun ruby-eval-buffer () (interactive)
    "Evaluate the buffer with ruby."
    (shell-command-on-region (point-min) (point-max) "ruby"))

  (defun my-ruby-mode-hook ()
    (font-lock-mode t)
    (setq standard-indent 2)
    (predictive-mode t)
    (ruby-electric-mode t)
    (rake-mode t)
    (define-key ruby-mode-map "\C-c\C-l" 'ruby-eval-buffer))

  (add-hook 'ruby-mode-hook 'my-ruby-mode-hook))

(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gemspec$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\Rakefile$" . ruby-mode) auto-mode-alist))

;; YAML Mode
(autoload 'yaml-mode "yaml-mode" "Major mode for editing YAML files" t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;; Rinari Mode (Rails)
(autoload-then ('rhtml-mode "rinari" "Major mode for RHTML files" t))

(setq auto-mode-alist (cons '("\\.rhtml\\'" . rhtml-mode) auto-mode-alist))

(provide 'ruby-start)
