(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq package-list '(ido magit 2048-game pdf-tools elfeed emms htmlize))

(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ))

(which-key-mode)
(add-hook 'after-init-hook 'global-company-mode)  
(setq company-show-numbers t)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-align-annotations t)

;; https://www.masteringemacs.org/article/introduction-to-ido-mode
(ido-mode)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;; Con C-c <flechas> se hace o deshace la config de ventanas
(winner-mode)

;; Poner los backups en la carpeta backup 
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(column-number-mode 1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(global-visual-line-mode)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'misterioso)

(setq inhibit-splash-screen t)

(server-start)
(setq confirm-kill-emacs 'y-or-n-p)

(auto-revert-mode)

(electric-pair-mode)
(show-paren-mode)

;; Para usar sudo bien en eshell (alias actualizar)
(require 'em-tramp) 

(defun sudeame ()
"Use TRAMP to `sudo' the current buffer"
(interactive)
(when buffer-file-name
(find-alternate-file
(concat "/sudo:root@localhost:"
	buffer-file-name))))

;;ssh
;;Configuración por defecto para acceder a la raspi con "/-::"
;;a través de TRAMP
;; (custom-set-variables
;;            '(tramp-default-method "ssh")
;;            '(tramp-default-user "pi")
;;            '(tramp-default-host "192.168.1.125"))

(setq dired-listing-switches "-alh")
(setq dired-isearch-filenames t) ;;Buscar en dired solo en los nombres.

;;(global-linum-mode '0)
    ;;Puesta de sol
    (defun eval-file (file)
      "Execute FILE and return the result of the last expression."
      (eval
       (ignore-errors
	 (read-from-whole-string
	  (with-temp-buffer
	    (insert-file-contents file)
	    (buffer-string))))))

    (setq calendar-latitude (eval-file "~/Plantillas/lat.el"))
    (setq calendar-longitude (eval-file "~/Plantillas/lon.el"))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

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
	 (file+headline "~/Nextcloud/Documents/horario.txt" "Películas")
	 "* %?")
	("d" "Dudas" entry (file+headline "/home/carlos/Nextcloud/Documents/horario.txt" "Dudas")
	 "* %^{PROMPT} %?\n  %i\n  %a")
	("k" "Cita" entry
	 (file+headline "~/org/uni.org" "Citas")
	 "* %^t %?"))))
(setq org-agenda-span 'day)
  ;;calendario

  (setq calendar-week-start-day 1)

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

(fset 'modonoche
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("m" 0 "%d")) arg)))
(add-hook 'pdf-view-mode-hook (lambda() (nlinum-mode -1))) ;;Desactivar linum mode, que no va bien con pdf-view-mode
(pdf-tools-install)

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
   "http://planet.emacs-es.org/rss20.xml"
   "https://planet.emacslife.com/atom.xml"
   "https://blog.mobian-project.org/index.xml"
   "https://twobithistory.org/feed.xml")))

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

;;emms
(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/Música/")
(emms-add-directory-tree "~/Música")
(emms-mode-line-disable)
(global-set-key (kbd "<XF86AudioPrev>") 'emms-previous)
(global-set-key (kbd "<XF86AudioNext>") 'emms-next)
(global-set-key (kbd "<XF86AudioPlay>") 'emms-pause)
(global-set-key (kbd "<XF86MonBrightnessUp>") 'emms-shuffle) 
(global-set-key (kbd "s-m") 'emms)
(add-hook 'emms-mode-hook 'hl-line-mode)
(add-hook 'emms-mode-hook 'visual-line-mode)

(global-set-key (kbd "C-x p") 'proced)
(global-set-key (kbd "C-x e") 'eshell)
(global-set-key (kbd "C-c m") 'calendar)
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "s-o") 'other-window)
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "<f5>") 'modonoche)
(add-to-list 'org-file-apps '("pdf" . "evince %s"))
(global-set-key (kbd "<f6>") 'quick-calc)
(set-register ?o (cons 'file "/home/carlos/Nextcloud/Documents/horario.txt"))
(set-register ?e (cons 'file "/home/carlos/git/dotfiles/newemacs/emacs-literario.org"))
(set-register ?t (cons 'file "/home/carlos/Nextcloud/Talk/orgt430/tiempo.org"))
(global-set-key (kbd "s-n") 'next-buffer)
(global-set-key (kbd "s-p") 'previous-buffer)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(global-set-key (kbd "s-T") 'telega)
(define-key global-map (kbd "C-c t") telega-prefix-map)
(add-hook 'telega-load-hook 'telega-notifications-mode)
;;(add-hook 'telega-load-hook 'emoji-mode)

(save-place-mode 1)

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
