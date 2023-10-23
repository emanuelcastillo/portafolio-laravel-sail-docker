#!/bin/bash
clear
RED='\033[0;31m'
NOCOLOR='\033[0;32m'
YELL='\033[1;35m'
echo -e "${RED}Comando creado por ${NOCOLOR}https://github.com/emanuelcastillo"

# Comprobar si el usuario tiene permisos de superusuario
if [ "$EUID" -ne 0 ]; then
    echo "Este script debe ejecutarse como superusuario (root). Utiliza la siguiente instrucción: sudo bash activator"
    exit 1
fi

read -p "Vas a usar << Sail? >> (s/n): " opcion

sudo apt update

# Instalar paquetes esenciales de PHP
sudo apt install php8.1-mysql php8.1-curl php8.1-intl php8.1-odbc php8.1-pgsql php8.1-sqlite3 php8.1-tidy php8.1-zip unzip p7zip-full

# Instalar php8.1-common y php8.1-json
sudo apt install php8.1-common php8.1-json

# Obtén la ruta al archivo php.ini
PHP_INI_PATH=$(php -i | grep -oP 'Loaded Configuration File => \K.*')

# Comprueba si el archivo php.ini existe
if [ -f "$PHP_INI_PATH" ]; then
    for MODULO in "intl odbc openssl pdo_pgsql sodium sqlite3 tidy"; do
        # Habilita el módulo si no está habilitado
        if ! grep -q "^extension=$MODULO.so" "$PHP_INI_PATH"; then
            echo "extension=$MODULO.so" >> "$PHP_INI_PATH"
            echo "Habilitando el módulo $MODULO..."
        else
            echo "El módulo $MODULO ya está habilitado."
        fi
    done

    # Reinicia el servidor web (cambia el comando según tu sistema)
    # Ejemplo para Apache:
    # systemctl restart apache2
    # Ejemplo para Nginx:
    # systemctl restart nginx
    composer install
    if [ "$opcion" = "s" ] || [ "$opcion" = "S" ]; then
        php artisan sail:install
        alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
    fi
    read -p "Deseas levantar << Sail? >> (s/n): " upsail
    if [ "$upsail" = "s" ] || [ "$upsail" = "S" ]; then
        sail up -d
    fi
    clear
    echo -e "
    ${YELL}   ____        _       _ _           _   _             _            
    / __ \      (_)     (_) |         | \ | |           | |           
    | |  | |_ __  _ _ __  _| |_   _  __|  \| | ___   ___ | |_ ___ _ __ 
    | |  | | '_ \| | '_ \| | | | | |/ _\` . \` |/ _ \ / _ \| __/ _ \ '__|
    | |__| | | | | | | | | | | |_| | (_| |\  | (_) | (_) | ||  __/ |   
    \____/|_| |_|_|_| |_|_|_|\__,_|\__,_| \_|\___/ \___/ \__\___|_|   
                                                                        
    ${NOCOLOR}Sígueme en https://github.com/emanuelcastillo"
else
    echo "El archivo php.ini no se encuentra en la ruta especificada."
fi
