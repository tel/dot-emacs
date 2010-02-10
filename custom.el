(put 'narrow-to-region 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-default-unit-for-image "\\textwidth")
 '(TeX-electric-sub-and-superscript t)
 '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d") ("^dvi$" "^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d") ("^dvi$" ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d") ("^dvi$" "^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)xdvi %dS %d") ("^pdf$" "" "open %s.pdf") ("^pdf$" "." "xpdf -remote %s -raise %o %(outpage)") ("^html?$" "." "netscape %o"))))
 '(erc-away-nickname "tela_")
 '(erc-modules (quote (autoaway autojoin button completion fill irccontrols match menu netsplit noncommands readonly ring scrolltobottom services stamp track)))
 '(erc-nick "tela")
 '(erc-user-full-name "Joseph Abrahamson")
 '(org-agenda-custom-commands (quote (("Z" "Zhang Lab Todos" tags-todo #("CATEGORY=\"Zhanglab\"" 0 19 (face org-warning)) nil) ("S" "Sora Todos" tags-todo #("CATEGORY=\"Sora\"" 0 15 (face org-warning)) nil))))
 '(org-agenda-files (quote ("~/org/running.org" "~/org/todos.org" "~/org/notes.org" "~/org/grad.org" "~/org/sora.org" "~/org/agenda.org" "~/org/school.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
