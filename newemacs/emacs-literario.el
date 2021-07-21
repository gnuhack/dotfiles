;; This is only needed once, near the top of the file
  ;; (eval-when-compile
  ;;   ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;;   (add-to-list 'load-path "~/emacs.d/elpa")
  ;;   (require 'use-package))

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(setq package-list '(ido magit 2048-game))

(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ))

                                        ; activate all the packages (in particular autoloads)
(package-initialize)

                                        ; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

                                        ; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; https://www.masteringemacs.org/article/introduction-to-ido-mode
(ido-mode)

;; Con C-c <flechas> se hace o deshace la config de ventanas
(winner-mode)

;; Asignaciones de teclas
(global-set-key (kbd "M-o") 'other-window)

(global-visual-line-mode)


(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'misterioso)

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
