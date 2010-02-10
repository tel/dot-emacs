;;
;; Initialization

(add-paths-with ap
  (ap "f/magit"))

(require 'magit)
(require 'gist)
(require 'git-blame)

(global-set-key (read-kbd-macro "C-c m") 'magit-status)
(global-set-key (read-kbd-macro "C-c C-g") 'gist-region-or-buffer)

(define-key magit-mode-map (kbd "C-c C-a") 'magit-log-edit-toggle-amending)

(setq magit-git-executable "/usr/local/bin/git")

(provide 'git-start)