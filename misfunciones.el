(defun milibro ()
    "Leer una página aleatoria del diario."
    (interactive)
    (goto-line (random (count-lines (point-min) (point-max)))))   

(defun rat/anttel ()
  (interactive)
  "Ir al anterior chat de telegram."
  (switch-to-buffer "*Telega Root*")
  (previous-line)
  (push-button)
  )

(defun rat/sigtel ()
  (interactive)
  "Ir al siguiente chat de telegram."
  (switch-to-buffer "*Telega Root*")
  (next-line)
  (push-button)
)

(defun rat/terminal ()
    (interactive)
    "Abrir terminal en una nueva ventana"
    (term "/bin/bash")
    (switch-to-prev-buffer)
    (switch-to-buffer-other-frame "*terminal*")
    )
;; (defun rat/terminal ()
;;     (interactive)
;;     "Abrir terminal en una nueva ventana. Intento fallido de abrir varias terminales."
;;     (if (get-buffer "*terminal*")
;; 	(progn
;; 	  (switch-to-buffer-other-frame "*terminal*")
;; 	  (rename-buffer (format "*%s*"(random 10000000)))
;; 	  )
;;       (term "/bin/bash")
;;       (switch-to-prev-buffer)
;;       (switch-to-buffer-other-frame "*terminal*")
;;       ))
(defun rat/killydelete ()
  "Elimina un búfer y luego el frame."
  (interactive)
  (kill-buffer)
  (delete-frame))

(defun hledger-time ()
  "tiempo plano"
  (interactive)
  (insert (format-time-string "%Y-%m-%d"))
  )

(defun rat/publi ()
  "Publica una entrada del blog. Debe estar configurada la conexión ssh con clave."
    (interactive)
    (async-shell-command "scp -r ~/blog pi@192.168.1.125:/var/www/html/publish" "publicando")
    )
