;; Initialization
;;
(add-paths-with ap
  (ap "f/distel/elisp/"))
(setq exec-path (cons "/opt/local/bin" exec-path))

(require 'distel)
(distel-setup)


;; Customization
;;

(add-hook 'erlang-mode-hook
	  (lambda ()
	    ;; when starting an Erlang shell in Emacs, default in the node name
	    (setq inferior-erlang-machine-options '("-sname" "emacs"))
	    ;; add Erlang functions to an imenu menu
	    (imenu-add-to-menubar "imenu")))
(defconst distel-shell-keys
  '(("\C-\M-i"   erl-complete)
    ("\M-?"      erl-complete)	
    ("\M-."      erl-find-source-under-point)
    ("\M-,"      erl-find-source-unwind) 
    ("\M-*"      erl-find-source-unwind) 
    )
  "Additional keys to bind when in Erlang shell.")

(add-hook 'erlang-shell-mode-hook
	  (lambda ()
	    ;; add some Distel bindings to the Erlang shell
	    (dolist (spec distel-shell-keys)
	      (define-key erlang-shell-mode-map (car spec) (cadr spec)))))

(provide 'distel-start)
