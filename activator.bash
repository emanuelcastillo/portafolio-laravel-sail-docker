#!/bin/bash
clear
RED='\033[0;31m'
NOCOLOR='\033[0;32m'
YELL='\033[1;35m'
echo -e "${RED}Comando creado por ${NOCOLOR}https://github.com/emanuelcastillo"
# Ensure that Docker is running...
if [ $? -ne 0 ]; then
    echo "Docker is not running."
    
    exit 1
fi

if [ "$EUID" -ne 0 ]; then
    echo "Este script debe ejecutarse como superusuario (root). Utiliza la siguiente instrucción: sudo bash activator"
    exit 1
fi

# Define el alias sail
SAIL_ALIAS='alias sail="[ -f sail ] && sh sail || sh vendor/bin/sail"'

# Verifica si el archivo ~/.bashrc existe y si no, créalo
if [ ! -f "$HOME/.bashrc" ]; then
    touch "$HOME/.bashrc"
fi

# Verifica si el alias ya está en ~/.bashrc
if ! grep -qF "$SAIL_ALIAS" "$HOME/.bashrc"; then
    # Agrega el alias al archivo ~/.bashrc
    echo "$SAIL_ALIAS" >> "$HOME/.bashrc"
fi

# Verifica si el archivo ~/.bash_profile existe y si no, créalo
if [ ! -f "$HOME/.bash_profile" ]; then
    touch "$HOME/.bash_profile"
fi

# Verifica si el alias ya está en ~/.bash_profile
if ! grep -qF "$SAIL_ALIAS" "$HOME/.bash_profile"; then
    # Agrega el alias al archivo ~/.bash_profile
    echo "$SAIL_ALIAS" >> "$HOME/.bash_profile"
fi

# Muestra un mensaje de confirmación
echo "El alias 'sail' se ha agregado a ~/.bashrc y ~/.bash_profile."

# Comprobar si PHP está instalado
if ! command -v php &>/dev/null; then
    echo "PHP no está instalado. Por favor, instala PHP y vuelve a ejecutar el script."
    sudo add-apt-repository ppa:ondrej/php
    sudo apt update
    sudo apt install php8.2
    sudo phpenmod curl
    sudo service php8.2-fpm restart
    exit 1
fi

# Habilitar las extensiones
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
for extension in "${extensions_to_enable[@]}"; do
    sudo phpenmod -v 8.2 -s cli "$extension"
done
php artisan sail:add
php artisan sail:install --devcontainer
# Comprobar si Composer está instalado
if ! command -v composer &>/dev/null; then
    echo "Composer no está instalado. Por favor, instala Composer y vuelve a ejecutar el script."
    exit 1
fi

# Cargar cambios en la sesión actual
source "$HOME/.bashrc"
source "$HOME/.bash_profile"

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

    ejecuta -> sail composer install 
    para levantar el sitio web de sail

"
composer install
docker compose up -d
