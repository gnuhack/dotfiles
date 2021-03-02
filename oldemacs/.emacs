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
    ("f2c35f8562f6a1e5b3f4c543d5ff8f24100fae1da29aeb1864bbc17758f52b70" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(desktop-save-mode t)
 '(display-time-24hr-format t)
 '(doc-view-continuous t)
 '(doc-view-resolution 200)
 '(elfeed-feeds
   (quote
    ("https://videos.lukesmith.xyz/feeds/videos.xml?sort=-publishedAt&filter=local" ("https://www.youtube.com/feeds/videos.xml?channel_id=UCaifrB5IrvGNPJmPeVOcqBA" Kruggsmash) ("https://www.bay12games.com/dwarves/dev_now.rss" Dwarf Fortress) "https://www.youtube.com/feeds/videos.xml?channel_id=UCD6VugMZKRhSyzWEWA9W2fg" "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" "https://www.youtube.com/channel/UCaifrB5IrvGNPJmPeVOcqBA" "https://www.youtube.com/user/SsethTzeentach" "http://planet.emacs-es.org/rss20.xml" "https://planet.emacslife.com/atom.xml")))
 '(global-visual-line-mode t)
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold 1000000000)
 '(line-number-mode nil)
 '(next-screen-context-lines 4)
 ;; '(org-capture-templates
 ;;   (quote
 ;;    (("c" "Nota" entry
 ;;      (file+datetree "~/Documentos/notas.org")
 ;;      "* %?" :empty-lines 1)
 ;;     ("j" "Journal Entry" entry
 ;;      (file+datetree "~/journal.org")
 ;;      "* %?" :empty-lines 1)
 ;;     ("p" "Películas" entry
 ;;      (file+headline "~/Documentos/notas.org" "Películas")
 ;;      "* %?")
 ;;     ("k" "Cita" entry
 ;;      (file+datetree+prompt "~/org/uni.org")
 ;;      "* %?"))))
 '(package-selected-packages
   (quote
    (elpy company-irony gdscript-mode wordnut define-word 2048-game emms telega magit smartparens use-package sudoku sudo-edit xkcd decide pdf-tools keyfreq)))
 '(save-place t nil (saveplace))
 '(which-key-mode t)
 '(yahoo-weather-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-string-face ((t (:foreground "dark orange")))))
