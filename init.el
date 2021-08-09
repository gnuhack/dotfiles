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
(org-babel-load-file "~/git/dotfiles/newemacs/emacs-literario.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds
   (quote
    ("http://karl-voit.at/feeds/lazyblorg-all.atom_1.0.links-and-content.xml" "https://videos.lukesmith.xyz/feeds/videos.xml?sort=-publishedAt&filter=local"
     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCaifrB5IrvGNPJmPeVOcqBA" Kruggsmash)
     ("https://www.bay12games.com/dwarves/dev_now.rss" Dwarf Fortress)
     "https://www.youtube.com/feeds/videos.xml?channel_id=UCD6VugMZKRhSyzWEWA9W2fg" "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" "https://www.youtube.com/channel/UCaifrB5IrvGNPJmPeVOcqBA" "https://www.youtube.com/user/SsethTzeentach" "https://www.youtube.com/user/vicesat" "http://planet.emacs-es.org/rss20.xml" "https://planet.emacslife.com/atom.xml" "https://blog.mobian-project.org/index.xml" "https://twobithistory.org/feed.xml")) t)
 '(org-agenda-files
   (quote
    ("~/org/uni.org" "~/Nextcloud/Documents/horario.txt" "~/Nextcloud/Talk/orgt430/gtd.org")))
 '(package-selected-packages
   (quote
    (emojify telega projectile org-bullets company which-key helm htmlize pdf-tools magit emms elfeed 2048-game)))
 '(telega-mode-line-string-format
   (quote
    ("   "
     (:eval
      (telega-mode-line-online-status))
     (:eval
      (when telega-use-tracking-for
	(telega-mode-line-tracking)))
     (:eval
      (telega-mode-line-unread-unmuted))
     (:eval
      (telega-mode-line-mentions
       (quote messages)))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)
