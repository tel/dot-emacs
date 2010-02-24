
(require 'cl)

(defvar emacs-root 
  (let ((linux-systems (list 'cygwin 'gnu/linux 'linux)))
    (cond ((find system-type linux-systems)
	   "/home/tel/emacs/")
	  ((eq system-type 'darwin)
	   "/Users/tel/emacs/")
	  (t "c:/home/tel/emacs/")))
  "Emacs customization all lives here")

;; UTF-8
(require 'un-define "un-define" t)
(set-buffer-file-coding-system 'utf-8 'utf-8-unix)
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

;; Load-path helpers
(defun emacs-dir (path)
  "Localizes a path to the emacs root"
  (concat emacs-root path))

(defmacro add-paths-with (name &rest block)
  `(labels ((,name (p) (add-to-list 'load-path (emacs-dir p))))
     ,@block))
(defmacro add-exec-paths-with (name &rest block)
  `(labels ((,name (p) (add-to-list 'exec-path p)))
     ,@block))

(defmacro autoload-then (args &rest block)
  (if (eq block nil)
      `(autoload ,@args)
    `(progn
       (autoload ,@args)
       (eval-after-load ,(cadr args) ; the file name
         (progn ,@block)))))

(defmacro autoload-helper (file fns)
  `(progn
     ,@(let ((var (gensym)))
         (mapcar (lambda (,var)
                   `(autoload ,(car ,var) ,file ,@(cdr ,var)))
                 fns))))

(defmacro autoload-multiple (file others &rest block)
  (if (eq block nil)
      `(autoload-helper ,file ,others)
    `(progn
       (autoload-helper ,file ,others)
       (eval-after-load ,file
         (progn ,@block)))))

(setq mac-option-modifier 'super) ; sets the Option key as Super
(setq mac-command-modifier 'meta) ; sets the Command key as Meta

;; Load some tools
;;
(add-paths-with ap
  (ap "my/") ;; Custom settings folder
  (ap "l/") ;; Language specific features
  (ap "f/") ;; Various features
  (ap "s/") ;; Startup files
  )

;; Load the OS
;;
(add-exec-paths-with ae
  (ae "/opt/local/bin")
  (ae "/opt/local/sbin")
  (ae "/usr/bin")
  (ae "/bin")
  (ae "/usr/sbin")
  (ae "/sbin")
  (ae "/usr/local/bin"))

;; Load Personal Settings
;;
(load "tweaks")
(load "fns")
(load "frame")
(load "tramp-start")
(load "org-start")

;; Initialize Packages
;;
(require 'predictive-start)
(require 'ido-start)
(require 'server-start)
(require 'git-start)
(require 'dict-start)
(require 'l-start) ;; various language modes

;; Change fonts and colors when in a windowed system
;;
(turn-on-font-lock)
(if window-system
    (progn 
      (add-paths-with ap (ap "f/color-theme"))
      (require 'color-theme)
      (color-theme-initialize)
      (color-theme-charcoal-black)
      (set-cursor-color "grey35")))

(set-default-font "-apple-consolas-medium-r-normal--0-0-0-0-m-0-mac-roman")
;(set-default-font "-apple-andale mono-medium-r-normal--0-0-0-0-m-0-mac-roman")

;; Eliminate custom-file mess
(setq custom-file "~/emacs/custom.el")
(load custom-file 'noerror)

;; Kill that annoying splash
;;
(setq inhibit-splash-screen t)

;; Welcome to Emacs.
;;
(require 'shell-start)