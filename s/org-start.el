;; Initialization
;;

(add-paths-with ap
  (ap "f/org/lisp")
  (ap "f/org/contrib/lisp")
  (ap "f/remember/")
  (ap "f/org-mode-add-ons/"))
(require 'org-install)
(load "remember-autoloads")


(require 'org-babel-init)
(require 'org-babel-R)
(require 'org-babel-python)
;;(require 'org-babel-ditaa)
(require 'org-babel-dot)
;;(require 'org-babel-haskell)
(org-babel-load-library-of-babel)



;; Configuration
;;

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-directory "~/org")
(setq org-default-notes-file "~/org/notes.org")
(setq org-agenda-include-diary t)

(add-hook 'remember-mode-hook 'org-remember-apply-template)
(setq org-agenda-files (list "~/org/agenda.org"
			     "~/org/todos.org"
                             "~/org/school.org")
      remember-annotation-functions '(org-remember-annotation)
      remember-handler-functions '(org-remember-handler)
      org-log-done 'time)
(setq org-remember-templates 
      '(("Note" ?n "* %U %?" nil "Notes")
        ("Context and Note" ?c "* %U %?\n %i\n%a" nil "Notes")
        ("Idea" ?i "* %U %?" nil "Ideas")
        ("Write Me" ?w "* %U %?" nil "Writing Topics")
        ("Pioneer Idea" ?p "* %U %?" "pioneer.org")
        ("Snippet" ?s "* %U %?" "snippets.org")
	("Todo" ?t "* TODO %?\n  %i\n" "todos.org" "Tasks")
        ("Read Me" ?r "* %?" nil "Books")))


;; Keybindings
;;

;; Org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
; Seems to not actually be an installed command? Huh?

;; Remember mode
(global-set-key (kbd "C-c r") 'org-remember)

(provide 'org-start)