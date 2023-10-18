<p align="center">
  <a href="https://github.com/emanuelcastillo" rel="noopener">
 <img width=200px height=200px src="https://i.imgur.com/6wj0hh6.jpg" alt="Project logo"></a>
</p>

<h3 align="center">https://github.com/emanuelcastillo</h3>

<div align="center">

<!-- [![Build Status](https://travis-ci.com/emanuelcastillo/portafolio-laravel-sail-docker.svg?branch=main)](https://travis-ci.com/emanuelcastillo/portafolio-laravel-sail-docker)
[![Coverage Status](https://coveralls.io/repos/github/emanuelcastillo/portafolio-laravel-sail-docker/badge.svg?branch=main)](https://coveralls.io/github/emanuelcastillo/portafolio-laravel-sail-docker?branch=main) -->
[![GitHub](https://img.shields.io/badge/GitHub-Sigueme-ff69b4)](https://github.com/emanuelcastillo)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
![Versión](https://img.shields.io/badge/Versión-1.0.0-brightgreen)
![Pull Requests Abiertos](https://img.shields.io/github/issues-pr/emanuelcastillo/portafolio-laravel-sail-docker)
![Pull Requests Cerrados](https://img.shields.io/github/issues-pr-closed/emanuelcastillo/portafolio-laravel-sail-docker)
![Issues Abiertos](https://img.shields.io/github/issues/emanuelcastillo/portafolio-laravel-sail-docker)
![Issues Cerrados](https://img.shields.io/github/issues-closed/emanuelcastillo/portafolio-laravel-sail-docker)

</div>

---

<p align="center"> Portafolio por un estudiante de la poderosisima uvg claro que si
    <br> 
</p>

## 📝 Tabla de contenido 

- [Instalar Sail](#instalar_sail)
- [Configurar pgsql](#configurar_pgsql)
- [Mi patreon](#patreon)

## 🧐 Instalar sail <a name = "instalar_sail"></a>

# Generar un proyecto el laravel sail

crear un proyecto en sail con el comando curl haciendo una peticion https y cambiando **[nombre_proyecto]** por el nombre de tu proyecto

```bash
 curl -s "https://laravel.build/[nombre_proyecto]" | bash
```


# Configurar laravel sail docker wsl windows

- Si se tiene problemas con los purtos ya que tienes muchas otras aplicaciones utilizando puertos por defecto 
- como 3036, 80, 8080, 3000, 9000 etc...
- esté enlace te servirá, explica como cambiar configurar el .env en windows con docker powered by wsl engine
[https://stackoverflow.com/questions/67053449/unable-to-set-the-app-port-on-env-for-laravel-sail](https://stackoverflow.com/questions/67053449/unable-to-set-the-app-port-on-env-for-laravel-sail)

- este enlace sirve para crear un alias de sail para no usar .vendor/bin .... etc
[https://laravel.com/docs/10.x/sail#configuring-a-shell-alias](https://laravel.com/docs/10.x/sail#configuring-a-shell-alias)


- **Importante: para utilizar composer, como a mi me funciono, debes habilitar las extenciones php.ini**
habilitar
extension=dom
extension=xml
```bash
sudo apt-get install php8.1-curl
sudo apt-get install php8.1-curl
sudo nano etc/php/8.1/cli/php.ini
```

## 🏁 Config pgsql <a name = "configurar_pgsql"></a>

- en el archivo
[Archivo .env](.env)

- cambiar lo siguiente:


| Variable        | Valor                  |
| --------------- | ---------------------- |
| DB_CONNECTION   | pgsql                  |
| DB_HOST         | 192.168.10.10          |
| DB_PORT         | 5432                   |
| DB_DATABASE     | laravel                |
| DB_USERNAME     | sail                   |
| DB_PASSWORD     | password               |



- se debe cambiar segun los parametros y opciones de tu base de datos
- si creaste ambos contenedores, tanto el de laravel (server web) como el de pgsql (database) puedes omitir esta sección ;)

### Requisitos para correr este proyecto

- Necesitas tener, [node](https://nodejs.org/en/download), [deno](https://deno.com/), [bun](https://bun.sh/) o cualquier otro motor de js en tu computadora,
- Necesitas tener, [php 8.1](https://www.php.net/downloads.php) en adelante
- Necesitas tener, [Docker desktop](https://www.docker.com/products/docker-desktop/)
- Necesitas tener, [composer](https://getcomposer.org/download/)
- Necesitas tener, wsl si usas windows, aunque si quieres administrar los contenedores en sus respectivas terminales, puedes usar Docker Engine, si quieres utilizar wsl ve a [wsl & docker](https://docs.docker.com/desktop/wsl/)
- Necesitas tener conocimientos de Laravel, compooser y PHP
- Donar a mi patreon 

## Comandos Básicos de Laravel Sail

- **Iniciar Sail:**
```bash
sail up
```
- **Detener Sail:**

```bash
sail down
```
- **Iniciar Sail en Modo Daemon:**

```bash
sail up -d
```
- **Acceder a la Consola de Contenedor:**

```bash
sail shell
```
- **Ejecutar Comandos Artisan:**

```bash
sail artisan [comando]
```
- **Instalar Dependencias Composer:**

```bash
sail composer install
```
- **Ejecutar Pruebas PHPUnit:**

```bash
sail test
```
- **Acceder a la Base de Datos MySQL:**

```bash
sail mysql
```
- **Generar una Clave de Aplicación:**

```bash
sail artisan key:generate
```
- **Especificar la Versión de PHP:**

```bash
sail up --php=[versión]
```

## 💵💵💲Moni moni monica <a name = "patreon"></a>
- Apoyame
[Mi link](https://adsgt.com)