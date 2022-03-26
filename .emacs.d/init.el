;;Configuración mínima para debuggear: https://stackoverflow.com/questions/19336489/initializing-emacs-with-org-babel-debugger-entered-lisp-error-void-function 
(package-initialize)
(require 'ob-tangle)

;; CUSTOMIZE
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

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
