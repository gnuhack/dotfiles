(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
;; Con C-c <flechas> se hace o deshace la config de ventanas
(winner-mode 1)

;; Poner los backups en la carpeta backup 
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(column-number-mode 1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(global-visual-line-mode)
(add-hook 'text-mode-hook #'turn-on-auto-fill)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(load-theme 'modus-vivendi t)

(setq inhibit-splash-screen t)
(if 'server-running-p nil
  (progn
    (server-start)
    (message "Servidor iniciado")
    )
  )
(setq confirm-kill-emacs 'y-or-n-p)

;; Salvación del portapapeles para poder usar M-y después de hacer un kill a algo en Emacs y poder recuperar el contenido
(setq save-interprogram-paste-before-kill t)

(global-auto-revert-mode 1)

(electric-pair-mode 1)
(show-paren-mode 1)

(defun escrach ()
  (interactive)
  "Cambia al búfer de scratch."
  (switch-to-buffer "*scratch*"))
(define-key global-map (kbd "C-c s") #'escrach)

(recentf-mode 1)

(save-place-mode 1)


;; (vertico-mode 1)
;;   (require 'orderless)
;;   (setq completion-styles '(orderless basic)
;; 	completion-category-overrides '((file (styles basic partial-completion))))
;;   (marginalia-mode 1)
;;   (define-key global-map (kbd "C-.") #'embark-act)
;;   (define-key global-map (kbd "C-,") #'embark-dwim)
;;   (define-key global-map (kbd "C-h B") #'embark-bindings)
;;   (setq prefix-help-command #'embark-prefix-help-command)
;; ;;  (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
;;   (add-to-list 'display-buffer-alist
;; 		 '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
;; 		   nil
;; 		   (window-parameters (mode-line-format . none))))

;; Para usar sudo bien en eshell (alias actualizar)
(require 'em-tramp)
(require 'em-hist)

;; Guardar sesión de las shells
(savehist-mode 1)
(defun sudeame ()
"Use TRAMP to `sudo' the current buffer"
(interactive)
(when buffer-file-name
(find-alternate-file
(concat "/sudo:root@localhost:"
	buffer-file-name))))

(setq eshell-history-size 2000)

;;Función de Protesilaos para buscar en el historial
(defun prot-eshell-complete-history ()
  "Insert element from Eshell history using completion."
  (interactive)
  (let ((hist (ring-elements eshell-history-ring)))
    (insert
     (completing-read "Input from history: " hist nil t))))
(if (equal system-name "hpdeluisito")
    (message "No protcompletes")
  (define-key eshell-hist-mode-map (kbd "M-r") #'prot-eshell-complete-history)
  )
;;Para no guardar cosas con espacio al principio en el historial
(setq eshell-input-filter 'eshell-input-filter-initial-space)
;;Autocompletado como en BASH
(define-key eshell-mode-map (kbd "<tab>") 'company-complete)
;; 2FA para la EV
(defun eshell2fa ()
    (interactive)
    "Devuelve el id del 2FA en el portapapeles."
    (unless (gnus-buffer-live-p "*eshell*") (eshell) (switch-to-prev-buffer))
    (with-current-buffer "*eshell*"
    (eshell-return-to-prompt)
    (insert "id > /dev/kill")
    (eshell-send-input))
    (message "2FA copiado al portapapeles")
    )

(setq dired-listing-switches "-alh")
(setq dired-isearch-filenames t) ;;Buscar en dired solo en los nombres.
(setq dired-auto-revert-buffer #'dired-directory-changed-p) ; also see `dired-do-revert-buffer'
(add-hook 'dired-mode-hook #'hl-line-mode)
(add-hook 'dired-mode-hook #'dired-hide-details-mode)
;;  (define-key dired-mode-map (kbd "DEL") 'dired-up-directory)
(setq dired-dwim-target t) ;; Para copiar archivos entre dos búferes de dired abiertos en la misma ventana


(org-babel-do-load-languages 'org-babel-load-languages
    '(
	(shell . t)
	(octave . t)
    )
)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

(setq org-goto-interface 'outline-path-completion)
(setq org-use-speed-commands t)

(global-set-key "\C-cc" 'org-capture)
(when (file-exists-p "~/org")
  (setq org-capture-templates
	  (quote
	   (("c" "Nota" entry
	     (file+datetree "~/Nextcloud/notas.org")
	     "* %?" :empty-lines 1)
	    ("t" "Todo" entry
	     (file+headline "~/org/gtd.org" "Tasks")
	     "* TODO %?" :empty-lines 1)
	    ("j" "Journal Entry" entry
	     (file+datetree "~/Nextcloud/journal/journal.org.gpg")
	     "* %<%H:%M>\n %?" :empty-lines 1 :time-prompt t)
	    ("k" "Cita" entry
	     (file+headline "~/org/uni.org" "Citas")
	     "* %^t %?")
	    ))))
    (setq org-agenda-span 'day)
      ;;calendario

      (setq calendar-week-start-day 1)

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))


(setq org-roam-v2-ack t)
(when (file-exists-p "~/org-roam")
     (setq org-roam-directory "~/org-roam"))
     (global-set-key "\C-cnl" 'org-roam-buffer-toggle)
     (global-set-key "\C-cnf" 'org-roam-node-find)
     (global-set-key "\C-cng" 'org-roam-graph)
     (global-set-key "\C-cni" 'org-roam-node-insert)
     (global-set-key "\C-cnc" 'org-roam-capture)
     ;; Dailies
     (global-set-key "\C-cnj" 'org-roam-dailies-capture-today)
(when (file-exists-p "~/org-roam")
  (org-roam-db-autosync-mode)
	(org-roam-setup))

(setq org-log-done 'time)


(fset 'modonoche
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("m" 0 "%d")) arg)))

(defun elfeed-firefox-open (&optional use-generic-p)
    "open with firefox"
    (interactive "P")
    (let ((entries (elfeed-search-selected)))
      (cl-loop for entry in entries
	       do (elfeed-untag entry 'unread)
	       when (elfeed-entry-link entry)
	       do (browse-url-firefox it))
      (mapc #'elfeed-search-update-entry entries)
      (unless (use-region-p) (forward-line))))

;;  (define-key elfeed-search-mode-map (kbd "f") 'elfeed-firefox-open)


(global-set-key (kbd "s-<return>") 'vterm)
  (global-set-key (kbd "C-x w") 'elfeed)
  (global-set-key (kbd "C-<tab>") 'hippie-expand)
;;(global-set-key (kbd "C-<iso-lefttab>") 'previous-buffer)
;;(global-set-key (kbd "C-x p") 'proced)
  (global-set-key (kbd "C-x e") 'eshell)
  (global-set-key (kbd "C-c y") 'clipboard-yank)
  (global-set-key (kbd "C-x t") 'shell)
  (global-set-key (kbd "C-c m") 'calendar)
  (global-set-key (kbd "M-o") 'other-window)
  (global-set-key (kbd "s-o") 'other-window)
  (global-set-key (kbd "C-x k") 'kill-current-buffer)
  (global-set-key (kbd "<f5>") 'modonoche)
  (add-to-list 'org-file-apps '("pdf" . "evince %s"))
  (global-set-key (kbd "<f6>") 'quick-calc)
  (set-register ?E (cons 'file "~/Documentos/ETSI/ETSI 2025"))
  (set-register ?o (cons 'file "~/Nextcloud/Documents/horario.txt"))
  (set-register ?e (cons 'file "~/git/dotfiles/.emacs.d/emacs-literario.org"))
  (set-register ?t (cons 'file "~/org/2021t/tiempo.org"))
  (set-register ?c (cons 'file "~/.config/i3/config"))
  (set-register ?d (cons 'file "~/Descargas"))
  (global-set-key (kbd "s-n") 'next-buffer)
  (global-set-key (kbd "s-p") 'previous-buffer)
  ;;(global-set-key (kbd "s-<backspace>") 'rat/killydelete)
  ;;(global-set-key (kbd "s-<return>") 'rat/terminal)
  (define-key dired-mode-map (kbd "<tab>") #'dired-subtree-toggle)
  (define-key dired-mode-map (kbd "<C-tab>") #'dired-subtree-cycle)
  (define-key dired-mode-map (kbd "<backtab>") #'dired-subtree-remove)
  (global-set-key (kbd "<f12>") 'eshell2fa)
  (global-set-key (kbd "C-<f12>") 'rat/sus)


(setq emojify-emoji-styles '(unicode))




(global-set-key (kbd "C-c d") #'dictionary-search)
(setq dictionary-server "dict.org")

;;; Basic configuration

(setq browse-url-browser-function 'eww) ;Para abrir los feeds de elfeed con eww en vez de firefox.
(setq eww-auto-rename-buffer 'title) ;Para renombrar los búferes de eww automáticamente

(global-set-key (kbd "<f9>") 'popper-toggle-latest)

(defun esrinca ()
  "Achica un frame."
  (interactive)
  (shrink-window 5))
(add-hook 'popper-open-popup-hook 'esrinca)

(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
(define-key global-map (kbd "C-c o") #'run-octave)
(define-key global-map (kbd "C-c O") #'helm-info-octave)

(global-set-key "\C-cf" (lambda () (interactive)
			   (erc :server "irc.libera.chat" :port "6667"
				:nick "gnuhack")))
(setq erc-autojoin-channels-alist
      '(("Libera.Chat" "#emacs" "#nethack")))

(setq erc-track-exclude-types '("JOIN" "NICK" "QUIT" "MODE" "AWAY")
      erc-hide-list '("JOIN" "NICK" "QUIT" "MODE" "AWAY")
      erc-track-exclude-server-buffer t)

(global-set-key (kbd "C-c C-ñ") 'erc-track-switch-buffer)

(defun sudo-save ()
(interactive)
(if (not buffer-file-name)
    (write-file (concat "/sudo:root@localhost:" (ido-read-file-name "File:")))
  (write-file (concat "/sudo:root@localhost:" buffer-file-name))))




;;(global-flycheck-mode t)
(setq display-time-world-list
  '(("Etc/UTC" "UTC")
    ("America/Los_Angeles" "Seattle")
    ("America/New_York" "New York")
    ("Europe/Athens" "Athens")
    ("Europe/Madrid" "Madrid")))

;; Prueba para ver si funciona
(define-key dired-mode-map (kbd "DEL") 'dired-up-directory)

;;Shape 1 (O) Yellow
;;Shape 2 (L) Orange
;;Shape 3 (J) Dark blue
;;Shape 4 (S) Green
;;Shape 5 (Z) Red
;;Shape 6 (T) Magenta
;;Shape 7 (I) Light blue

  (setq tetris-x-colors [[1 1 0]
   [1 0.27 0]
   [0 0 0.55]
   [1 0 0]
   [0 1 0]
   [1 0 1]
   [0 0.86 0.9]]
  )

;; EMACS SIMPLER
;; Config básica
;; (menu-bar-mode -1)
;; (tool-bar-mode -1)
;; (scroll-bar-mode -1)
;; (load-theme 'modus-vivendi)

;; ;; Asignaciones de teclas
;; (global-set-key (kbd "C-x e") 'eshell)
;; (global-set-key (kbd "M-<return>") 'ansi-term)
;; (global-set-key (kbd "C-x t") 'shell)
;; (global-set-key (kbd "<f12>") 'eshell2fa)
;; (global-set-key (kbd "s-n") 'next-buffer)
;; (global-set-key (kbd "s-p") 'previous-buffer)
;; (global-set-key (kbd "M-o") 'other-window)
;; (global-set-key (kbd "C-x k") 'kill-current-buffer)

;; ;; Registros
;; (set-register ?o (cons 'file "~/Nextcloud/Documents/horario.txt"))
;; (set-register ?c (cons 'file "/mnt/c/Users/Juan/"))
;; (set-register ?e (cons 'file "~/.emacs"))
;; (set-register ?E (cons 'file "~/dotfiles/.emacs.d/emacs-literario.org"))
;; ;; Funciones
;; (defun eshell2fa ()
;;       (interactive)
;;       "Devuelve el id del 2FA en el portapapeles."
;;       (unless (gnus-buffer-live-p "*eshell*") (eshell) (switch-to-prev-buffer))
;;       (with-current-buffer "*eshell*"
;;       (eshell-return-to-prompt)
;;       (insert "id > /dev/kill")
;;       (eshell-send-input))
;;       )

;; ;; Mode line
;; (display-time-mode 1)
;; (setq display-time-24hr-format t)
;; (display-battery-mode 1)

;; ;; Completación
;; (vertico-mode 1)
;;   (require 'orderless)
;;   (setq completion-styles '(orderless basic)
;; 	completion-category-overrides '((file (styles basic partial-completion))))
;;   (marginalia-mode 1)
;;   (define-key global-map (kbd "C-.") #'embark-act)
;;   (define-key global-map (kbd "C-,") #'embark-dwim)
;;   (define-key global-map (kbd "C-h B") #'embark-bindings)
;;   (setq prefix-help-command #'embark-prefix-help-command)
;; ;;  (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
;;   (add-to-list 'display-buffer-alist
;; 		 '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
;; 		   nil
;; 		   (window-parameters (mode-line-format . none))))
;; ;; Resto de la configuración
;; (global-auto-revert-mode 1) ;; Para auto-actualizar los búferes de Nextcloud (y todos)
;; (setq org-use-speed-commands t) ;;Navegación n,p con org-mode
;;     (setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions)) ;; Quitar confirmación matar búfer con proceso


;; ;; Custom (No editar a mano)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(elfeed-feeds '("http://finaprosadigital.com/publish/blog/rss.xml"))
;;  '(package-selected-packages
;;    '(elfeed denote corfu magit consult embark embark-consult marginalia orderless vertico)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
