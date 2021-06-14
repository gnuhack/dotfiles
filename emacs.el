;; package -- Summary
;;; Commentary:
;;DONE Quitar los warnings de la izquierda ">>"
;;DONE Pushear a la raspi

;;---------------- WARNINGS ARREGLADOS ----------------

(declare-function key-chord-define-global"")
(declare-function nlinum-mode "")
(declare-function pdf-tools-install "")
(declare-function pdf-view-bookmark-jump "")
(declare-function pdf-view-bookmark-make-record "")
(declare-function elfeed-search-browse-url "")
(declare-function -let "")
(declare-function s-matches? "")
(declare-function elfeed-entry-link "")
(declare-function elfeed-untag "")
(declare-function elfeed-search-update "")
(declare-function elfeed-show-visit "")
(eval-when-compile
  (defvar elfeed-feeds)
  (defvar calendar-latitude)
  (defvar calendar-longitude)
  (defvar org-capture-templates)
  (defvar org-file-apps)
  (defvar wttrin-default-accept-language)
  (defvar wttrin-default-cities)
  (defvar dired-isearch-filenames)
  (defvar calendar-week-start-day)
  (defvar pdf-view-mode-map)
  (defvar my-bookmark)
  (defvar desktop-dirname)
  (defvar desktop-base-lock-name)
  (defvar desktop-base-file-name)
  (defvar desktop-path)
  (defvar desktop-save)
  (defvar desktop-files-not-to-save)
  (defvar desktop-load-locked-desktop)
  (defvar desktop-auto-save-timeout)
  (defvar emms-source-file-default-directory)
  (defvar smtpmail-smtp-user)
  (defvar smtpmail-smtp-server)
  (defvar smtpmail-smtp-service)
  (defvar gnus-select-method));;Eliminación de una queja del compilador
;;---------------- NOTIFICACIONES ----------------
(require 'appt)
(appt-activate t)

(setq appt-message-warning-time 30) ; Show notification 30 minutes before event
(setq appt-display-interval appt-message-warning-time) ; Disable multiple reminders
(setq appt-display-mode-line nil)

; Use appointment data from org-mode
(defun my-org-agenda-to-appt ()
  (interactive)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt))

; Update alarms when...
; (1) ... Starting Emacs
(my-org-agenda-to-appt)

; (2) ... Everyday at 12:05am (useful in case you keep Emacs always on)
(run-at-time "12:05am" (* 24 3600) 'my-org-agenda-to-appt)

; (3) ... When TODO.txt is saved
(add-hook 'after-save-hook
          '(lambda ()
             (if (string= (buffer-file-name) (concat (getenv "HOME") "/ideas/TODO.txt"))
                 (my-org-agenda-to-appt))))

; Display appointments as a window manager notification
(setq appt-disp-window-function 'my-appt-display)
(setq appt-delete-window-function (lambda () t))

(setq my-appt-notification-app (concat (getenv "HOME") "/bin/appt-notification"))

(defun my-appt-display (min-to-app new-time msg)
  (if (atom min-to-app)
    (start-process "my-appt-notification-app" nil my-appt-notification-app min-to-app msg)
  (dolist (i (number-sequence 0 (1- (length min-to-app))))
    (start-process "my-appt-notification-app" nil my-appt-notification-app (nth i min-to-app) (nth i msg)))))

;;---------------- APARIENCIA ----------------
;;; Code:
(menu-bar-mode 0)
(scroll-bar-mode 0)

;;---------------- PAQUETERÍA ----------------

;;DONE Aprender a instalar automáticamente paquetes.
(declare-function prelude-require-packages"")
(prelude-require-packages '(elfeed pdf-tools wttrin decide emms));;Añadir después de elfeed el resto de paquetes a autoinstalar.

;;---------------- PDFs ----------------

(fset 'modonoche
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("m" 0 "%d")) arg))) ;; Macro para poner el modo noche en los pdfs.
(add-hook 'pdf-view-mode-hook (lambda() (nlinum-mode -1))) ;;Desactivar linum mode, que no va bien con pdf-view-mode
(pdf-tools-install)
;;Guardar la posición en un pdf: "marcapáginas"
;;Sacado de https://sachachua.com/blog/2021/02/guest-post-bookmarking-pdfs-in-emacs-with-pdf-tools-and-registers/
(define-key pdf-view-mode-map (kbd "<C-f1>")
  (lambda ()
    "Saves the current position on the pdf to jump to later with <C-f2>."
    (interactive)
    (setf my-bookmark (pdf-view-bookmark-make-record))))

(define-key pdf-view-mode-map (kbd "<C-f2>")
  (lambda ()
    "Loads the position saved by <C-f1>."
    (interactive)
    (pdf-view-bookmark-jump my-bookmark)))
;;---------------- MISCELÁNEA ----------------
(server-start)
(setq confirm-kill-emacs 'y-or-n-p)
(setq dired-isearch-filenames t) ;;Buscar en dired solo en los nombres.
;;Puesta de sol
(setq calendar-latitude 37.344444)
(setq calendar-longitude -6.065278)
;;El tiempo
(setq wttrin-default-accept-language '("Accept-Language" . "es-ES"))
(setq wttrin-default-cities '("Mairena" "mairena" "Sevilla"))
;;macro anhqv
(fset 'anhqv
      [?\C-x ?1 ?\C-x ?2 ?\C-x ?m ?\C-x ?o ?\C-x ?m ?\C-x ?o ?s ?l ?e ?e ?p ?  ?2 ?h ?\; ?  ?k ?i ?l ?l ?a ?l ?l ?  ?m ?p ?v ?\; ?  ?s ?y ?s ?t ?e ?m ?c ?t ?l ?  ?s ?u ?s ?p ?e ?n ?d ?\M-x ?r ?e ?n ?a ?m ?e ?- ?u ?n ?i tab return ?\C-x ?b ?e ?s ?h ?e ?l ?l return ?\C-x ?m ?c ?d return ?m ?p ?v ?  ?V ?í ?d ?e ?o ?s ?/ ?A ?N ?H ?Q ?V ?/ ?T ?e ?m ?p ?o ?r ?a ?d ?a ?\C-x ?o ?\C-x ?m])
;;calendario
(setq calendar-week-start-day 1)
;;desactivar el whitespace-mode
(setq prelude-whitespace nil)
;;---------------- KEYBINDINGS ---------------

(key-chord-define-global "jk" 'avy-goto-word-1)
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "<f5>") 'modonoche)
(add-to-list 'org-file-apps '("pdf" . "evince %s"))
(global-set-key (kbd "<f6>") 'quick-calc)
(set-register ?o (cons 'file "/home/carlos/Nextcloud/Documents/horario.txt"))
(set-register ?e (cons 'file "/home/carlos/git/dotfiles/emacs.el"))
(set-register ?t (cons 'file "/home/carlos/Nextcloud/Talk/orgt430/tiempo.org"))
;;---------------- ELFEED ----------------

(global-set-key (kbd "C-x w") 'elfeed)
(setq elfeed-feeds
 (quote
  ("https://videos.lukesmith.xyz/feeds/videos.xml?sort=-publishedAt&filter=local"
   ("https://www.youtube.com/feeds/videos.xml?channel_id=UCaifrB5IrvGNPJmPeVOcqBA" Kruggsmash)
   ("https://www.bay12games.com/dwarves/dev_now.rss" Dwarf Fortress)
   "https://www.youtube.com/feeds/videos.xml?channel_id=UCD6VugMZKRhSyzWEWA9W2fg"
   "https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA"
   "https://www.youtube.com/channel/UCaifrB5IrvGNPJmPeVOcqBA"
   "https://www.youtube.com/user/SsethTzeentach"
   "https://www.youtube.com/user/vicesat"
   "http://planet.emacs-es.org/rss20.xml"
   "https://planet.emacslife.com/atom.xml"
   "https://blog.mobian-project.org/index.xml"
   "https://twobithistory.org/feed.xml")))
;;Ver vídeos

(defun std::elfeed::visit-entry-dwim (&optional arg)
  "Función para reproducir vídeos en elfeed de Youtube con mpv ARG."
  (interactive "P")
  (if arg
      (elfeed-search-browse-url)
    (-let [entry (if (eq major-mode 'elfeed-show-mode) elfeed-show-entry (elfeed-search-selected :single))]
      (if (s-matches? (rx "https://www.youtube.com/watch" (1+ any))
                      (elfeed-entry-link entry))
          (let* ((quality (completing-read "Max height resolution (0 for unlimited): " '("0" "480" "720" "1080")))
                 (format (if (= 0 (string-to-number quality)) "" (format "--ytdl-format=[height<=?%s]" quality))))
            (message "Opening %s with height ≤ %s with mpv..."
                     (elfeed-entry-link entry) quality)
            (elfeed-untag entry 'unread)
            (start-process "elfeed-mpv" nil "mpv" format (elfeed-entry-link entry))
            (elfeed-search-update :force))
        (if (eq major-mode 'elfeed-search-mode)
            (elfeed-search-browse-url)
          (elfeed-show-visit))))))

;;---------------- ORG ----------------
;;Setup del refile patrocinado por:
;;https://sachachua.com/blog/2015/02/learn-take-notes-efficiently-org-mode/
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))
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
         (file+datetree "~/Nextcloud/journal/journal.org")
         "* %?" :empty-lines 1)
        ("p" "Películas" entry
         (file+headline "~/home/carlos/Nextcloud/Documents/horario.txt" "Películas")
         "* %?")
        ("d" "Dudas" entry (file+headline "/home/carlos/Nextcloud/Documents/horario.txt" "Dudas")
         "* %^{PROMPT} %?\n  %i\n  %a")
        ("k" "Cita" entry
         (file+headline "~/org/uni.org" "Citas")
         "* %^t %?"))))
(setq org-agenda-span 'day)
;;---------------- SSH ----------------
;;Configuración por defecto para acceder a la raspi con "/-::"
;;a través de TRAMP
(custom-set-variables
           '(tramp-default-method "ssh")
           '(tramp-default-user "pi")
           '(tramp-default-host "192.168.1.125"))
;;;;----------------SALVACIÓN ----------------
;; Automatically save and restore sessions
(setq desktop-dirname             "~/.emacs.d/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil
      desktop-auto-save-timeout   30)
(desktop-save-mode 1)

;;;;---------------EMMS------------------------
(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/Música/")
(global-set-key (kbd "<XF86AudioPrev>") 'emms-previous)
(global-set-key (kbd "<XF86AudioNext>") 'emms-next)
(global-set-key (kbd "<XF86AudioPlay>") 'emms-pause)
(global-set-key (kbd "<XF86AudioStop>") 'emms-shuffle)
;;Al iniciar emms, hacer lo siguiente:
;;Now we will add all our music to a playlist by invoking M-x emms-add-directory-tree RET ~/Music/ RET
;;------------CORREO/GNUS---------------------------
(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-user   "nkolita1")
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 587)
(setq gnus-select-method
      '(nnmaildir "GMail"
                  (directory "~/Test")
                  (directory-files nnheader-directory-files-safe)
                  (get-new-mail nil)))

(defun offlineimap ()
  "Función para ejecutar offlineimap y descargar el correo en gnus."
  (interactive)
  (shell-command "offlineimap&" "*offlineimap*" nil))
;;------------DIRED----------------------
(setq dired-listing-switches "-alh")
;;---------------------------------------
(provide 'emacs)
;;; emacs.el ends here
