# dotfiles

Archivos de configuración de Debian.

En la carpeta i3 están las configuraciones de i3 e i3blocks.

En oldemacs está la antigua programación literaria en org-mode que tenía antes de Prelude.

El emacs.el es la configuración de Emacs Prelude que uso actualmente.

En newemacs estoy probando la nueva configuración literaria.

Estado de la autoinstalación de Emacs:

Ahora mismo se instala de forma semiautomática mi configuración. Me queda por resolver lo de que me pide que exista el archivo ~/Nextcloud/Documents/horario.txt, que además tiene que contener lo siguiente:

 ; -*-Org-*-

Además no se instalan todos los paquetes de forma automática, me tengo que ir al init.el y ejecutar

(package-refresh-contents)
(package-install-selected-packages)