;; ;;; init.el --- Where all the magic begins
;; ;;
;; ;; This file loads Org-mode and then loads the rest of our Emacs initialization from Emacs lisp
;; ;; embedded in literate Org-mode files.

;; ;; Load up Org Mode and (now included) Org Babel for elisp embedded in Org Mode files


;; (let* ((org-dir (expand-file-name
;;                  "lisp" (expand-file-name
;;                          "org")))
;;        (org-contrib-dir (expand-file-name
;;                          "lisp" (expand-file-name
;;                                  "contrib" (expand-file-name
;;                                             ".." org-dir))))
;;        (load-path (append (list org-dir org-contrib-dir)
;;                           (or load-path nil))))
;;   ;; load up Org-mode and Org-babel
;;   (require 'org-install)
;;   (require 'ob-tangle))

;; ;; load up all literate org-mode files in this directory


;; ;;; init.el ends here
;;https://stackoverflow.com/questions/19336489/initializing-emacs-with-org-babel-debugger-entered-lisp-error-void-function
(package-initialize)
(require 'ob-tangle)
(org-babel-load-file "~/git/dotfiles/newemacs/emacs-literario.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Nextcloud/Talk/orgt430/gtd.org")))
 '(package-selected-packages
   (quote
    (company which-key helm htmlize pdf-tools magit emms elfeed 2048-game))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
