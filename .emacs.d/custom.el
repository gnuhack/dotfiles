(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(async-shell-command-buffer 'new-buffer)
 '(custom-safe-themes
   '("f74e8d46790f3e07fbb4a2c5dafe2ade0d8f5abc9c203cd1c29c7d5110a85230"
     "eb7cd622a0916358a6ef6305e661c6abfad4decb4a7c12e73d6df871b8a195f8"
     "1e8865a3e23ff9c3f4f651217a6f565cb1cc09575c1d7a68b25e24bd3495ff4c"
     "183dfa34e360f5bc2ee4a6b3f4236e6664f4cfce40de1d43c984e0e8fc5b51ae"
     "e87f48ec4aebdca07bb865b90088eb28ae4b286ee8473aadb39213d361d0c45f"
     "eb785a887e90c10848466a1f825fcb57f61672c0b70e2f0fd7c62610ad044277"
     "dad622637530638a2140b83812e159a06b4791eb2f67ffd4abb4ff671b062d0b"
     "7397cc72938446348521d8061d3f2e288165f65a2dbb6366bb666224de2629bb"
     "0568a5426239e65aab5e7c48fa1abde81130a87ddf7f942613bf5e13bf79686b"
     "3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48"
     default))
 '(elfeed-feeds
   '(("https://yewtu.be/feed/channel/UCDy1lHSVGBDL0d2_C5NZNJw" Themaoisha
      Video)
     ("http://antirez.com/rss" Antirez Blog)
     ("https://stallman.org/rss/rss.xml" RMS)
     ("https://notxor.nueva-actitud.org/rss.xml" Noxtor Blog)
     ("http://finaprosadigital.com/publish/blog/rss.xml" CPR)
     ("https://taonaw.com/index.xml" Emacs TAONAW)
     ("http://feeds.feedburner.com/uGeekBlog" Emacs uGeek)
     ("https://daemons.it/posts/index.xml" Emacs daemon)
     ("https://lukesmith.xyz/rss.xml" Luke)
     ("https://videos.lukesmith.xyz/feeds/videos.xml?sort=-publishedAt&filter=local"
      Video)
     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCaifrB5IrvGNPJmPeVOcqBA"
      Kruggsmash Video)
     ("https://www.bay12games.com/dwarves/dev_now.rss" Dwarf Fortress
      Video)
     ("https://www.youtube.com/feeds/videos.xml?channel_id=UCD6VugMZKRhSyzWEWA9W2fg"
      Video)
     ("http://karl-voit.at/feeds/lazyblorg-all.atom_1.0.links-and-content.xml"
      Blog Voit)
     ("https://planet.emacslife.com/atom.xml" Emacs)
     ("https://protesilaos.com/master.xml" Prot Blog)
     ("https://greenwald.substack.com/feed" Glenn Blog)
     ("https://victorhckinthefreeworld.com/feed/" Victr Blog)
     ("https://pkm.es/feed" PKM Blog)
     ("https://sachachua.com/blog/feed/" Sacha Blog)
     ("https://www.danielclemente.com/cambios/cambios.xml")
     ("https://edwardsnowden.substack.com/feed.xml" Snowden Blog)
     ("https://twobithistory.org/feed.xml" 2bit Blog)))
 '(eww-search-prefix "http://www.searx.be/?q=")
 '(frame-background-mode nil)
 '(hledger-ratios-essential-expense-accounts "expenses:casa expenses:comida expenses:mama")
 '(hledger-ratios-liquid-asset-accounts "assets:cuenta assets:efectivo")
 '(notmuch-saved-searches
   '((:name "inbox" :query "tag:inbox" :key [105] :sort-order
	    newest-first)
     (:name "unread" :query "tag:unread" :key [117])
     (:name "flagged" :query "tag:flagged" :key [102])
     (:name "sent" :query "tag:sent" :key [116])
     (:name "drafts" :query "tag:draft" :key [100])
     (:name "all mail" :query "*" :key [97])))
 '(org-agenda-files '("/home/carlos/org/uni.org" "/home/carlos/org/gtd.org"))
 '(package-selected-packages
   '(altcaps consult-notmuch consult-org-roam consult-projectile
	     treemacs-icons-dired spanish-holidays olivetti
	     org-roam-ui flycheck auto-complete yasnippet
	     embark-consult embark consult orderless projectile
	     pdf-tools lin vertico telega gptel nov multiple-cursors
	     helm-core magit-section visual-fill-column
	     elfeed-tube-mpv elfeed-tube org-alert tzc
	     notmuch-indicator gnuplot gnuplot-mode multi-vterm
	     ytdious dired-subtree hackernews dired-hacks-utils tmr
	     poker minesweeper mines disk-usage company-ebdb
	     rainbow-delimiters smart-mode-line popper org-books
	     marginalia crossword gif-screencast helm-notmuch
	     helm-org-rifle rainbow-mode decide engine-mode
	     org-pomodoro modus-themes exec-path-from-shell dashboard
	     org-roam zenburn-theme hledger-mode scratch sudoku
	     notmuch ebdb dictionary emojify org-bullets company
	     which-key helm htmlize magit emms elfeed 2048-game))
 '(smtpmail-smtp-server "smtp.pajuelo.com")
 '(smtpmail-smtp-service 25)
 '(telega-mode-line-string-format
   '("   " (:eval (telega-mode-line-online-status))
     (:eval (when telega-use-tracking-for (telega-mode-line-tracking)))
     (:eval (telega-mode-line-unread-unmuted))
     (:eval (telega-mode-line-mentions 'messages))))
 '(warning-suppress-log-types '((mail))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
