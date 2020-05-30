(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
        (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
;Telegram en emacs
(use-package telega
  :load-path "/snap/telega/current/share/emacs/site-lisp/telega/"
  ;; telega requires visual-fill-column
  :init (use-package visual-fill-column
          :ensure t)
  ;; usual configuration here...
  )
(add-to-list 'load-path "/snap/telega/current/share/emacs/site-lisp/telega/")
(require 'telega)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-firefox-program "/home/carlos/Descargas/waterfox/waterfox")
 '(browse-url-generic-program "/home/carlos/Descargas/waterfox/waterfox")
 '(custom-enabled-themes (quote (misterioso)))
 '(desktop-save-mode t)
 '(doc-view-continuous t)
 '(doc-view-resolution 200)
 '(global-visual-line-mode t)
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold 1000000000)
 '(line-number-mode nil)
 '(next-screen-context-lines 4)
 '(package-selected-packages
   (quote
    (projectile flycheck virtualenv elpy undo-tree cdlatex define-word visual-fill-column telega sokoban elfeed magit smartparens use-package sudoku sudo-edit xkcd decide pdf-tools keyfreq)))
 '(save-place-mode t nil (saveplace))
 '(yahoo-weather-location "Mairena del Aljarafe")
 '(yahoo-weather-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-string-face ((t (:foreground "dark orange")))))
(require 'org);;Config para org mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;;(define-key c-mode-map  "\C-ñ" 'compile)
(setq org-log-done t)

(package-initialize)

(setq org-agenda-files (list "~/org/uni.org"))
;; a ver si condigo darle definición a los pdfs

(require 'doc-view)
(setq doc-view-resolution 144)
(require 'xscheme)
(server-start)


(setq package-archives
'(("gnu" . "http://elpa.gnu.org/packages/")
("melpa" . "http://melpa.milkbox.net/packages/")))

(pdf-tools-install)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;;Ponemos los mensajes que salen en otro búfer en el mismo
(tooltip-mode -1)
(setq tooltip-use-echo-area t)


;;Configuración para acceder fácil a archivos recientes con recentf

 
(require 'recentf)

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
;;(global-set-key (kbd "C-ñ") 'eval-buffer)

;; enable recent files mode.
(recentf-mode t)

; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;;Estadísticas de teclas pulsadas
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;;Ponemos M-o para cambiar de búfer cuando hay varios abiertos

(global-set-key (kbd "C-ñ") 'other-window)
(global-set-key (kbd"M-o") 'mode-line-other-buffer)
(global-set-key (kbd "<f7>") 'bookmark-jump)
(global-set-key (kbd "<f6>") 'bookmark-set)
(global-set-key (kbd "<f12>") 'delete-other-windows)
(global-set-key (kbd "<f2>") 'quick-calc)
(global-set-key (kbd "<f3>") 'pdf-view-midnight-minor-mode)
(global-set-key (kbd "M-p") 'next-buffer)
(global-set-key (kbd "M-n") 'previous-buffer)

(setq confirm-kill-emacs 'y-or-n-p) ;; Pedir confirmación para salir de emacs

(setq desktop-save-mode t) ;; guardar la sessión al cerrar emacs y restaurarla

(desktop-save-mode 1) ;; guardar sesión emacs

;; Tell emacs where is your personal elisp lib dir
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; cargamos el diccionario con sus atajos de teclado
;; (load "define-word")

(global-set-key (kbd "C-c D") 'define-word-at-point)
(global-set-key (kbd "C-c d") 'define-word)


;;Mostramos el número de fila para programar mejor

(add-hook 'prog-mode-hook 'linum-mode)

;;Matar buffer con C-x-K
(defun other-window-kill-buffer ()
  "Kill the buffer in the other window"
  (interactive)
  ;; Window selection is used because point goes to a different window
  ;; if more than 2 windows are present
  (let ((win-curr (selected-window))
        (win-other (next-window)))
    (select-window win-other)
    (kill-this-buffer)
    (select-window win-curr)))

(global-set-key (kbd "C-x K") 'other-window-kill-buffer)

;;Prueba de smooth scrolling
;;(setq scroll-conservatively 10000)
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;;Ver el tiempo con wttrin
(setq wttrin-default-accept-language '("Accept-Language" . "es-ES"))
(setq wttrin-default-cities '("Mairena" "mairena" "Sevilla"))
;;(yahoo-weather-mode)


;; Run C programs directly from within emacs
(defun execute-c-program ()
  (interactive)
  (defvar foo)
  (setq foo (concat "gcc " (buffer-name) " && ./a.out" ))
  (shell-command foo))
 
(global-set-key [C-f1] 'execute-c-program)

;;Prueba para ver si puedo abrir los .m en modo octave automáticamente
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
;;Cerrar bufer directamente con C-k
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;;Paréntesis inteligentes
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))
;;Mostramos el núnmero de columna
(column-number-mode)

;;Python IDE
(elpy-enable)

(defvar myPackages

  '(better-defaults                 ;; Set up some better Emacs defaults

    elpy                            ;; Emacs Lisp Python Environment

    flycheck                        ;; On the fly syntax checking

    material-theme                  ;; Theme

    )

  )
(when (require 'flycheck nil t)

  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))

  (add-hook 'elpy-mode-hook 'flycheck-mode))
