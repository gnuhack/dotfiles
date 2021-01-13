;; package -- Summary
;;; Commentary:
;;TODO Quitar los warnings de la izquierda ">>"
;;---------------- APARIENCIA ----------------
;;; Code:
(menu-bar-mode 0)
(scroll-bar-mode 0)

;;---------------- KEYBINDINGS ---------------

(key-chord-define-global "jj" 'ace-window)

;;---------------- ELFEED ----------------
;;DONE Aprender a instalar automáticamente paquetes.
(declare-function prelude-require-packages"")
(prelude-require-packages '(elfeed));;Añadir después de elfeed el resto de paquetes a autoinstalar.
(global-set-key (kbd "C-x w") 'elfeed)
(declare-function key-chord-define-global"")
(eval-when-compile (defvar elfeed-feeds));;Eliminación de una queja del compilador
(setq elfeed-feeds
 (quote
  ("https://videos.lukesmith.xyz/feeds/videos.xml?sort=-publishedAt&filter=local" ("https://www.youtube.com/feeds/videos.xml?channel_id=UCaifrB5IrvGNPJmPeVOcqBA" Kruggsmash) ("https://www.bay12games.com/dwarves/dev_now.rss" Dwarf Fortress) "https://www.youtube.com/feeds/videos.xml?channel_id=UCD6VugMZKRhSyzWEWA9W2fg" "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA" "https://www.youtube.com/channel/UCaifrB5IrvGNPJmPeVOcqBA" "https://www.youtube.com/user/SsethTzeentach" "http://planet.emacs-es.org/rss20.xml" "https://planet.emacslife.com/atom.xml")))

;;---------------- ORG ----------------
;;TODO No se cargan las plantillas
(global-set-key "\C-cc" 'org-capture)
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
     "* %?")
    ("k" "Cita" entry
     (file+datetree+prompt "~/org/uni.org")
     "* %?"))))
(provide 'emacs)
;;; emacs.el ends here
