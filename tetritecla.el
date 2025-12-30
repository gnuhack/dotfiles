;; -*- lexical-binding: t; -*-
(make-variable-buffer-local
  (defvar tetritecla-basic-mode nil
    "Alterna tetritecla-basic-mode."))

(defvar tetritecla-basic-mode-map (make-sparse-keymap)
  "El keymap para tetritecla-basic-mode")

;; Definición de las teclas para jugar.
(define-key tetritecla-basic-mode-map (kbd "j")
  (lambda ()
    (interactive)
    (tetris-move-left)))
    
(define-key tetritecla-basic-mode-map (kbd "k")
  (lambda ()
    (interactive)
    (tetris-rotate-prev)))     

(define-key tetritecla-basic-mode-map (kbd "i")
  (lambda ()
    (interactive)
    (tetris-rotate-next)))     

(define-key tetritecla-basic-mode-map (kbd "h")
  (lambda ()
    (interactive)
    (tetris-move-down)))

(define-key tetritecla-basic-mode-map (kbd "l")
  (lambda ()
    (interactive)
    (tetris-move-right)))

(add-to-list 'minor-mode-alist '(tetritecla-basic-mode " tetritecla"))
(add-to-list 'minor-mode-map-alist (cons 'tetritecla-basic-mode tetritecla-basic-mode-map))

(defun tetritecla-basic-mode (&optional ARG)
  "Modo para jugar al tetris con las teclas de Vim."
  (interactive (list 'toggle))
  (setq tetritecla-basic-mode
        (if (eq ARG 'toggle)
            (not tetritecla-basic-mode)
          (> ARG 0)))

  
  ;; Aviso de activación de modo
  (if tetritecla-basic-mode
      (message "tetritecla-basic-mode activado")
    (message "tetritecla-basic-mode desactivado")))
