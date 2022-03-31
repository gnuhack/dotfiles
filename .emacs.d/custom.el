(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("dad622637530638a2140b83812e159a06b4791eb2f67ffd4abb4ff671b062d0b" "7397cc72938446348521d8061d3f2e288165f65a2dbb6366bb666224de2629bb" "0568a5426239e65aab5e7c48fa1abde81130a87ddf7f942613bf5e13bf79686b" "3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" default))
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
     ("https://twobithistory.org/feed.xml" 2bit Blog)
     ("https://hnrss.org/frontpage" HN)))
 '(org-agenda-files
   '("~/org/uni.org" "~/Nextcloud/Documents/horario.txt" "~/Nextcloud/Talk/orgt430/gtd.org"))
 '(package-selected-packages
   '(rainbow-delimiters osm smart-mode-line popper org-books marginalia crossword gif-screencast org-tree-slide helm-notmuch org-roam-ui helm-org-rifle rainbow-mode decide engine-mode org-pomodoro telega modus-themes exec-path-from-shell org-static-blog dashboard org-roam zenburn-theme hledger-mode scratch sudoku notmuch ebdb dictionary emojify projectile org-bullets company which-key helm htmlize pdf-tools magit emms elfeed 2048-game))
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
