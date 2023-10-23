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

# Comprobar si el usuario tiene permisos de superusuario
if [ "$EUID" -ne 0 ]; then
    echo "Este script debe ejecutarse como superusuario (root). Utiliza la siguiente instrucción: sudo bash activator"
    exit 1
fi

read -p "Vas a usar << Sail? >> (s/n): " opcion

# Comprueba si el archivo php.ini existe
if [ "$opcion" = "s" ] || [ "$opcion" = "S" ]; then
    alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
fi

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
E::::::::::::::::::::Em::::m   m::::m   m::::ma:::::aaaa::::::a d:::::::::::::::::d e::::::::eeeeeeee         v:::::v
E::::::::::::::::::::Em::::m   m::::m   m::::m a::::::::::aa:::a d:::::::::ddd::::d  ee:::::::::::::e          v:::v
EEEEEEEEEEEEEEEEEEEEEEmmmmmm   mmmmmm   mmmmmm  aaaaaaaaaa  aaaa  ddddddddd   ddddd    eeeeeeeeeeeeee           vvv
    ${NOCOLOR}Sígueme en https://github.com/emanuelcastillo

    ejecuta -> sail up
    para levantar el contenedor de sail

"

if [ "$opcion" = "s" ] || [ "$opcion" = "S" ]; then
    docker compose up -d
fi

\