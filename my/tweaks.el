;; Make M-x easier to hit
;;
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-xm" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Make backwards-kill-word Easier
;;
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Make VI mode accessible
(global-set-key (kbd "C-\\") 'vi-mode)

(defmacro make-region-indent-completion-function (completion-command &optional indent-command)
  (let ((mark-active (if (boundp mark-active) 'mark-active 'zmacs-region-active-p))
	(indent (or indent-command '(indent-for-tab-command))))
    `(lambda ()
       (interactive)
       (if ,mark-active
	   (indent-region (mark) (point) nil)
	 (if (save-excursion (skip-chars-backward " \t") (bolp))
	     ,indent
	   ,completion-command)))))

(define-key emacs-lisp-mode-map (kbd "<tab>")
  (make-region-indent-completion-function (lisp-complete-symbol)))

;; Remove clutter
;;
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Ease usage of query-replace-regex
;;
(defalias 'qrr 'query-replace-regexp)
(defalias 'rr 'replace-regexp)

;; Centralize autosaves
;;
(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)
(setq auto-save-file-name-transforms `(("\\(?:[^/]*/\\)*\\(.*\\)" ,(concat
                                                                    autosave-dir "\\1") t)))

(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;; Settings (various)
;;
(setq visible-bell t
      transient-mark-mode t
      auto-compression-mode t
      tab-width 2
      indent-tabs-mode nil)

(setq-default indent-tabs-mode nil)
(global-auto-revert-mode)
(setq-default ispell-program-name "aspell")


