(defun milibro ()
    "Leer una página aleatoria del diario."
    (interactive)
    (goto-line (random (count-lines (point-min) (point-max)))))   
