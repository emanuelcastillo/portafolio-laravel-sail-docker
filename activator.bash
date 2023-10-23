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
    clear
    composer install
    if [ "$opcion" = "s" ] || [ "$opcion" = "S" ]; then
        php artisan sail:install
        alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
    fi
    echo "\n"
    echo "\n"
    echo "\n"
    echo -e "
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
E::::::::::::::::::::Em::::m   m::::m   m::::ma:::::aaaa::::::a d:::::::::::::::::d e::::::::eeeeeeee         v:::::v         
E::::::::::::::::::::Em::::m   m::::m   m::::m a::::::::::aa:::a d:::::::::ddd::::d  ee:::::::::::::e          v:::v          
EEEEEEEEEEEEEEEEEEEEEEmmmmmm   mmmmmm   mmmmmm  aaaaaaaaaa  aaaa  ddddddddd   ddddd    eeeeeeeeeeeeee           vvv                                                                               
    ${NOCOLOR}Sígueme en https://github.com/emanuelcastillo
    
    ejecuta -> sail up
    para levantar el contenedor de sail

    "
else
    echo "El archivo php.ini no se encuentra en la ruta especificada."
fi
