;; package -- Summary
;;; Commentary:
;;---------------- APARIENCIA ----------------
;;; Code:
(menu-bar-mode 0)
(scroll-bar-mode 0)

;;---------------- KEYBINDINGS ---------------

(key-chord-define-global "jj" 'ace-window)

;;---------------- ELFEED ----------------
;;DONE Aprender a instalar automáticamente paquetes.
;;TODO Quitar los warnings de la izquierda ">>"

(prelude-require-packages '(elfeed));;Añadir después de elfeed el resto de paquetes a autoinstalar.
(provide 'emacs)\n;;; emacs.el ends here
