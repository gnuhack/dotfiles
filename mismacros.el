(defmacro my-package-install (package &rest body)
  "Installs PACKAGE.
    If the PACKAGE cannot be installed, remind the user to add the package-archives. Then, the user can configure the
    PACKAGE."
  (declare (indent 1))
  `(progn
     ;;First stage; package installation
     (unless (package-installed-p ,package)
       (unless package-archive-contents
         (package-refresh-contents))
       (or (ignore-errors (package-install ,package))
           (message "Did you add MELPA to the `package-archives'")))
     ;;Second stage; package configuration
     (require ,package)
     ,@body
     )
  )
