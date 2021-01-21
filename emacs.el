;; package -- Summary
;;; Commentary:
;;DONE Quitar los warnings de la izquierda ">>"
;;DONE Pushear a la raspi
;;---------------- APARIENCIA ----------------
;;; Code:
(menu-bar-mode 0)
(scroll-bar-mode 0)

;;---------------- PAQUETERÍA ----------------

;;DONE Aprender a instalar automáticamente paquetes.
(declare-function prelude-require-packages"")
(prelude-require-packages '(elfeed pdf-tools wttrin));;Añadir después de elfeed el resto de paquetes a autoinstalar.

;;---------------- PDFs ----------------

(fset 'modonoche
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("m" 0 "%d")) arg))) ;; Macro para poner el modo noche en los pdfs.
(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1))) ;;Desactivar linum mode, que no va bien con pdf-view-mode


;;---------------- MISCELÁNEA ----------------
;;Arreglamiento de warnings

(declare-function key-chord-define-global"")
(eval-when-compile (defvar elfeed-feeds) (defvar calendar-latitude) (defvar calendar-longitude) (defvar org-capture-templates) (defvar org-file-apps) (defvar wttrin-default-accept-language) (defvar wttrin-default-cities));;Eliminación de una queja del compilador
(setq confirm-kill-emacs 'y-or-n-p)
;;Puesta de sol
(setq calendar-latitude 37.344444)
(setq calendar-longitude -6.065278)
;;El tiempo
(setq wttrin-default-accept-language '("Accept-Language" . "es-ES"))
(setq wttrin-default-cities '("Mairena" "mairena" "Sevilla"))
;;macro anhqv
(fset 'anhqv
   [?\C-x ?1 ?\C-x ?2 ?\C-x ?m ?\C-x ?o ?\C-x ?m ?\C-x ?o ?s ?l ?e ?e ?p ?  ?2 ?h ?\; ?  ?k ?i ?l ?l ?a ?l ?l ?  ?m ?p ?v ?\; ?  ?s ?y ?s ?t ?e ?m ?c ?t ?l ?  ?s ?u ?s ?p ?e ?n ?d ?\M-x ?r ?e ?n ?a ?m ?e ?- ?u ?n ?i tab return ?\C-x ?b ?e ?s ?h ?e ?l ?l return ?\C-x ?m ?m ?p ?v ?  ?V tab ?í tab backspace backspace backspace backspace backspace backspace ?c ?d return ?m ?p ?v ?  ?V ?ú tab backspace ?ú tab backspace ?í tab ?A ?N tab ?T tab backspace backspace])


;;---------------- KEYBINDINGS ---------------

(key-chord-define-global "jj" 'ace-window)
(key-chord-define-global "jk" 'avy-goto-word-1)
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "<f5>") 'modonoche)
(add-to-list 'org-file-apps '("pdf" . "evince %s"))
(global-set-key (kbd "<f6>") 'quick-calc)


;;---------------- ELFEED ----------------

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
