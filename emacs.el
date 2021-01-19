;; package -- Summary
;;; Commentary:
;;DONE Quitar los warnings de la izquierda ">>"
;;DONE Pushear a la raspi
;;---------------- APARIENCIA ----------------
;;; Code:
(menu-bar-mode 0)
(scroll-bar-mode 0)

;;---------------- MISCELÁNEA ----------------
;;Arreglamiento de warnings

(declare-function key-chord-define-global"")
(eval-when-compile (defvar elfeed-feeds) (defvar calendar-latitude) (defvar calendar-longitude) (defvar org-capture-templates) (defvar org-file-apps));;Eliminación de una queja del compilador

;;Puesta de sol
(setq calendar-latitude 37.344444)
(setq calendar-longitude -6.065278)


;;---------------- KEYBINDINGS ---------------

(key-chord-define-global "jj" 'ace-window)
(key-chord-define-global "jk" 'avy-goto-word-1)
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(add-to-list 'org-file-apps '("pdf" . "evince %s"))
;;---------------- ELFEED ----------------
;;DONE Aprender a instalar automáticamente paquetes.
(declare-function prelude-require-packages"")
(prelude-require-packages '(elfeed));;Añadir después de elfeed el resto de paquetes a autoinstalar.
(global-set-key (kbd "C-x w") 'elfeed)
(setq elfeed-feeds
 (quote
  ("https://videos.lukesmith.xyz/feeds/videos.xml?sort=-publishedAt&filter=local" ("https://www.youtube.com/feeds/videos.xml?channel_id=UCaifrB5IrvGNPJmPeVOcqBA" Kruggsmash) ("https://www.bay12games.com/dwarves/dev_now.rss" Dwarf Fortress) "https://www.youtube.com/feeds/videos.xml?channel_id=UCD6VugMZKRhSyzWEWA9W2fg" "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" "https://www.youtube.com/channel/UCaifrB5IrvGNPJmPeVOcqBA" "https://www.youtube.com/user/SsethTzeentach" "http://planet.emacs-es.org/rss20.xml" "https://planet.emacslife.com/atom.xml")))

;;---------------- ORG ----------------
;;DONE No se cargan las plantillas
(global-set-key "\C-cc" 'org-capture)
(setq org-capture-templates
  (quote
   (("c" "Nota" entry
     (file+datetree "/home/carlos/Nextcloud/Documents/horario.txt")
     "* %?" :empty-lines 1)
    ("t" "Todo" entry
     (file+headline "/home/carlos/org/gtd.org" "Tasks")
     "* TODO %?" :empty-lines 1)
    ("j" "Journal Entry" entry
     (file+datetree "~/Documentos/journal/journal.org")
     "* %?" :empty-lines 1)
    ("p" "Películas" entry
     (file+headline "~/home/carlos/Nextcloud/Documents/horario.txt" "Películas")
     "* %?")
    ("k" "Cita" entry
     (file+datetree+prompt "~/org/uni.org")
     "* %?"))))

(provide 'emacs)
;;; emacs.el ends here
