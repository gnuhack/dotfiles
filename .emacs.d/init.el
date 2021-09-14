;; ;;; init.el --- Where all the magic begins
;; ;;
;; ;; This file loads Org-mode and then loads the rest of our Emacs initialization from Emacs lisp
;; ;; embedded in literate Org-mode files.
;; --- ANTIGUO init.el
;; ;; Load up Org Mode and (now included) Org Babel for elisp embedded in Org Mode files


;; (let* ((org-dir (expand-file-name
;;                  "lisp" (expand-file-name
;;                          "org")))
;;        (org-contrib-dir (expand-file-name
;;                          "lisp" (expand-file-name
;;                                  "contrib" (expand-file-name
;;                                             ".." org-dir))))
;;        (load-path (append (list org-dir org-contrib-dir)
;;                           (or load-path nil))))
;;   ;; load up Org-mode and Org-babel
;;   (require 'org-install)
;;   (require 'ob-tangle))

;; ;; load up all literate org-mode files in this directory


;; ;;; init.el ends here
;; --- FIN DEL ANTIGUO init.el

;;https://stackoverflow.com/questions/19336489/initializing-emacs-with-org-babel-debugger-entered-lisp-error-void-function
(package-initialize)
(require 'ob-tangle)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" default))
 '(elfeed-feeds
   '(("http://feeds.feedburner.com/uGeekBlog" Emacs)
     ("https://daemons.it/posts/index.xml" Emacs)
     ("https://videos.lukesmith.xyz/feeds/videos.xml?sort=-publishedAt&filter=local" Video)
     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCaifrB5IrvGNPJmPeVOcqBA" Kruggsmash Video)
     ("https://www.bay12games.com/dwarves/dev_now.rss" Dwarf Fortress Video)
     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCD6VugMZKRhSyzWEWA9W2fg" Video)
     ("https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" Video)
     ("http://planet.emacs-es.org/rss20.xml" Emacs)
     ("http://karl-voit.at/feeds/lazyblorg-all.atom_1.0.links-and-content.xml" Blog)
     ("https://planet.emacslife.com/atom.xml" Emacs)
     ("https://blog.mobian-project.org/index.xml" Blog)
     ("https://twobithistory.org/feed.xml" Blog)))
 '(org-agenda-files
   '("~/org/uni.org" "~/Nextcloud/Documents/horario.txt" "~/Nextcloud/Talk/orgt430/gtd.org"))
 '(package-selected-packages
   '(dashboard org-roam zenburn-theme hledger-mode scratch sudoku notmuch ebdb dictionary emojify telega projectile org-bullets company which-key helm htmlize pdf-tools magit emms elfeed 2048-game))
 '(telega-mode-line-string-format
   '("   "
     (:eval
      (telega-mode-line-online-status))
     (:eval
      (when telega-use-tracking-for
	(telega-mode-line-tracking)))
     (:eval
      (telega-mode-line-unread-unmuted))
     (:eval
      (telega-mode-line-mentions 'messages))))
 '(warning-suppress-log-types '((mail))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

(load-file  "~/git/dotfiles/misfunciones.el")
(setq org-agenda-files `( "~/org"))
(org-babel-load-file "~/git/dotfiles/.emacs.d/emacs-literario.org")
