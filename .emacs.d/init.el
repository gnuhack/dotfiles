;;Configuración mínima para debuggear: https://stackoverflow.com/questions/19336489/initializing-emacs-with-org-babel-debugger-entered-lisp-error-void-function 
(package-initialize)
(require 'ob-tangle)

;; CUSTOMIZE

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7397cc72938446348521d8061d3f2e288165f65a2dbb6366bb666224de2629bb" "0568a5426239e65aab5e7c48fa1abde81130a87ddf7f942613bf5e13bf79686b" "3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" default))
 '(elfeed-feeds
   '("http://unavidalibre.xyz/publish/blog/rss.xml"
     ("https://helpdeskheadesk.net/index.xml" Emacs TAONAW)
     ("http://feeds.feedburner.com/uGeekBlog" Emacs uGeek)
     ("https://daemons.it/posts/index.xml" Emacs daemon)
     ("https://lukesmith.xyz/rss.xml" Luke)
     ("https://videos.lukesmith.xyz/feeds/videos.xml?sort=-publishedAt&filter=local" Video)
     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCaifrB5IrvGNPJmPeVOcqBA" Kruggsmash Video)
     ("https://www.bay12games.com/dwarves/dev_now.rss" Dwarf Fortress Video)
     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCD6VugMZKRhSyzWEWA9W2fg" Video)
     ("http://planet.emacs-es.org/rss20.xml" Emacs Planet)
     ("http://karl-voit.at/feeds/lazyblorg-all.atom_1.0.links-and-content.xml" Blog Voit)
     ("https://planet.emacslife.com/atom.xml" Emacs)
     ("https://protesilaos.com/master.xml" Prot Blog)
     ("https://greenwald.substack.com/feed" Glenn Blog)
     ("https://edwardsnowden.substack.com/feed.xml" Snowden Blog)
     ("https://twobithistory.org/feed.xml" 2bit Blog)))
 '(org-agenda-files
   '("~/org/uni.org" "~/Nextcloud/Documents/horario.txt" "~/Nextcloud/Talk/orgt430/gtd.org"))
 '(package-selected-packages
   '(popper org-books marginalia crossword gif-screencast org-tree-slide helm-notmuch org-roam-ui helm-org-rifle rainbow-mode decide engine-mode org-pomodoro telega modus-themes exec-path-from-shell org-static-blog dashboard org-roam zenburn-theme hledger-mode scratch sudoku notmuch ebdb dictionary emojify projectile org-bullets company which-key helm htmlize pdf-tools magit emms elfeed 2048-game))
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

;;REPOSITORIOS

  (setq comp-deferred-compilation t) ;;Compilación nativa
  (setq native-comp-async-report-warnings-errors 'silent) ; emacs28 with native compilation
  ;;https://www.masteringemacs.org/article/speed-up-emacs-libjansson-native-elisp-compilation
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") ; Solución a un bug de Emacs 27 o por ahí.


  (setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			   ("gnu" . "http://elpa.gnu.org/packages/")
			   ("melpa" . "https://melpa.org/packages/")
			   ))

;; PAQUETES

  (unless package-archive-contents
    (package-refresh-contents))

;;  (setq package-list '(ido magit 2048-game pdf-tools elfeed emms htmlize))
;;  (dolist (package package-list)
;;    (unless (package-installed-p package)
;;      (package-install package)))

(package-install-selected-packages) ;;¿Es necesaria esta línea?

;; MIS ARCHIVOS

(load-file  "~/git/dotfiles/misfunciones.el")
(setq org-agenda-files `( "~/org"))
(org-babel-load-file "~/git/dotfiles/.emacs.d/emacs-literario.org")
