#!/bin/bash
clear

RED='\033[0;31m'
NOCOLOR='\033[0;32m'
YELL='\033[1;35m'
echo -e "${RED}Comando creado por ${NOCOLOR}https://github.com/emanuelcastillo"


# Comprobar si PHP está instalado
echo "PHP sera instalado de forma global."
sudo apt update
sudo apt install php8.2
# Comprobar si Composer está instalado
echo "Composer sera instalado de forma global."
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

# Comprobar si Docker está en ejecución
if ! docker --version &>/dev/null; then
    echo "Docker no está instalado o no se está ejecutando. Por favor, instala Docker y asegúrate de que esté en ejecución."
    exit 1
fi

# Definir el alias 'sail' si no está definido
SAIL_ALIAS='alias sail="[ -f sail ] && sh sail || sh vendor/bin/sail"'

# Verificar si el archivo ~/.bashrc existe y si no, crearlo
if [ ! -f "$HOME/.bashrc" ]; then
    touch "$HOME/.bashrc"
fi

# Verificar si el alias 'sail' ya está en ~/.bashrc
if ! grep -qF "$SAIL_ALIAS" "$HOME/.bashrc"; then
    echo "$SAIL_ALIAS" >> "$HOME/.bashrc"
fi

# Verificar si el archivo ~/.bash_profile existe y si no, crearlo
if [ ! -f "$HOME/.bash_profile" ]; then
    touch "$HOME/.bash_profile"
fi

# Verificar si el alias 'sail' ya está en ~/.bash_profile
if ! grep -qF "$SAIL_ALIAS" "$HOME/.bash_profile"; then
    echo "$SAIL_ALIAS" >> "$HOME/.bash_profile"
fi

# Habilitar extensiones de PHP
extensions_to_enable=(
    opcache
    pdo
    calendar
    ctype
    exif
    ffi
    fileinfo
    ftp
    gettext
    iconv
    phar
    posix
    readline
    shmop
    sockets
    sysvmsg
    sysvsem
    sysvshm
    tokenizer
)

sudo apt install php8.2-dom
sudo apt install php8.2-xml
for extension in "${extensions_to_enable[@]}"; do
    sudo phpenmod -v 8.2 -s cli "$extension"
done

# Reiniciar el servicio PHP-FPM (ajusta esto según tu sistema)
sudo service php8.2-fpm restart

# Recargar los cambios en la sesión actual
source "$HOME/.bashrc"
source "$HOME/.bash_profile"

# Composer install
composer install

# Mensaje de confirmación
echo -e "
    \n
    \n
    \n
    ${YELL}
                                                                           dddddddd
EEEEEEEEEEEEEEEEEEEEEE                                                     d::::::d
E::::::::::::::::::::E                                                     d::::::d
E::::::::::::::::::::E                                                     d::::::d
EE::::::EEEEEEEEE::::E                                                     d:::::d
  E:::::E       EEEEEE   mmmmmmm    mmmmmmm     aaaaaaaaaaaaa      ddddddddd:::::d     eeeeeeeeeeee  vvvvvvv           vvvvvvv
  E:::::E              mm:::::::m  m:::::::mm   a::::::::::::a   dd::::::::::::::d   ee::::::::::::ee v:::::v         v:::::v
  E::::::EEEEEEEEEE   m::::::::::mm::::::::::m  aaaaaaaaa:::::a d::::::::::::::::d  e::::::eeeee:::::eev:::::v       v:::::v
  E:::::::::::::::E   m::::::::::::::::::::::m           a::::ad:::::::ddddd:::::d e::::::e     e:::::e v:::::v     v:::::v
  E:::::::::::::::E   m:::::mmm::::::mmm:::::m    aaaaaaa:::::ad::::::d    d:::::d e:::::::eeeee::::::e  v:::::v   v:::::v
  E::::::EEEEEEEEEE   m::::m   m::::m   m::::m  aa::::::::::::ad:::::d     d:::::d e:::::::::::::::::e    v:::::v v:::::v
  E:::::E             m::::m   m::::m   m::::m a::::aaaa::::::ad:::::d     d:::::d e::::::eeeeeeeeeee      v:::::v:::::v
  E:::::E       EEEEEEm::::m   m::::m   m::::ma::::a    a:::::ad:::::d     d:::::d e:::::::e                v:::::::::v
EE::::::EEEEEEEE:::::Em::::m   m::::m   m::::ma::::a    a:::::ad::::::ddddd::::::dde::::::::e                v:::::::v
E::::::::::::::::::::Em::::m   m::::m   m::::m a::::::::::aa:::a d:::::::::::::::::d e::::::::eeeeeeee         v:::::v
E::::::::::::::::::::Em::::m   m::::m   m::::m a::::::::::aa:::a d:::::::::::::::::d e::::::::eeeeeeee         v:::::v
EEEEEEEEEEEEEEEEEEEEEEmmmmmm   mmmmmm   mmmmmm  aaaaaaaaaa  aaaa  ddddddddd   ddddd    eeeeeeeeeeeeee           vvv
    ${NOCOLOR}Sígueme en https://github.com/emanuelcastillo

    Ejecuta 'sail up' para levantar el sitio web de Sail
"