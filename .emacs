(package-initialize)
(require 'cl)
(require 'ob-tangle)
(org-babel-load-file "~/emacs-and-org-init.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-firefox-program "/usr/bin/firefox")
 '(browse-url-generic-program "/usr/bin/firefox")
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(desktop-save-mode t)
 '(display-time-24hr-format t)
 '(doc-view-continuous t)
 '(doc-view-resolution 200)
 '(global-visual-line-mode t)
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold 1000000000)
 '(line-number-mode nil)
 '(next-screen-context-lines 4)
 '(org-capture-templates
   (quote
    (("c" "Nota" entry
      (file+datetree "~/Documentos/notas.org")
      "* %?" :empty-lines 1)
     ("j" "Journal Entry" entry
      (file+datetree "~/journal.org")
      "* %?" :empty-lines 1)
     ("p" "Películas" entry
      (file+headline "~/Documentos/notas.org" "Películas")
      "* %?"))))
 '(package-selected-packages
   (quote
    (elpy company-irony gdscript-mode wordnut define-word 2048-game emms telega magit smartparens use-package sudoku sudo-edit xkcd decide pdf-tools keyfreq)))
 '(save-place t nil (saveplace))
 '(which-key-mode t)
 '(yahoo-weather-location "Mairena del Aljarafe")
 '(yahoo-weather-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-string-face ((t (:foreground "dark orange")))))
