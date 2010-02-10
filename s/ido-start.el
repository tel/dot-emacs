;; Initialize
;;
(require 'ido)
(ido-mode t)

;; Customization

(setq ido-everywhere t
      ido-case-fold t
      ido-confirm-unique-completion t
      ido-enable-flex-matching t
      ido-max-prospects 10
      ido-enable-last-directory-history t
      ido-work-directory-list '("~/" "~/Desktop" "~/proj" "~/Downloads"))

(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
    (let ((enable-recursive-minibuffers t))
      (visit-tags-table-buffer))
    (ido-completing-read "Project file: "
			 (tags-table-files)
			 nil t)))

(add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
(add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)
(defun ido-sort-mtime ()
  (setq ido-temp-list
	(sort ido-temp-list 
	      (lambda (a b)
		(let ((ta (nth 5 (file-attributes 
				  (concat ido-current-directory a))))
		      (tb (nth 5 (file-attributes 
				  (concat ido-current-directory b)))))
		  (if (= (nth 0 ta) (nth 0 tb))
		      (> (nth 1 ta) (nth 1 tb))
		    (> (nth 0 ta) (nth 0 tb)))))))
  (ido-to-end  ;; move . files to end (again)
   (delq nil (mapcar
	      (lambda (x) (if (string-equal (substring x 0 1) ".") x))
	      ido-temp-list))))

(global-set-key "\M-p\C-f" 'ido-find-file-in-tag-files)

(provide 'ido-start)