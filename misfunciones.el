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
(defun hledger-time ()
  "tiempo plano"
  (interactive)
(insert (format-time-string "%Y-%m-%d"))
 )
