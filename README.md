<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://i.imgur.com/6wj0hh6.jpg" alt="Project logo"></a>
</p>

<h3 align="center">undefined</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]()
[![GitHub Issues](https://img.shields.io/github/issues/kylelobo/The-Documentation-Compendium.svg)](https://github.com/kylelobo/The-Documentation-Compendium/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/kylelobo/The-Documentation-Compendium.svg)](https://github.com/kylelobo/The-Documentation-Compendium/pulls)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> Portafolio por un estudiante de la poderosisima uvg claro que si
    <br> 
</p>

## 📝 Table of Contents

- [About](#istalar_sail)
- [Getting Started](#configurar_pgsql)
- [Deployment](#deployment)
- [Usage](#usage)
- [Built Using](#built_using)
- [TODO](../TODO.md)
- [Contributing](../CONTRIBUTING.md)
- [Authors](#authors)
- [Acknowledgments](#acknowledgement)

## 🧐 Instalar sail <a name = "istalar_sail"></a>

# Generar un proyecto el laravel sail

crear un proyecto en sail con el comando curl haciendo una peticion https y cambiando **[nombre_proyecto]** por el nombre de tu proyecto

```bash
 curl -s "https://laravel.build/[nombre_proyecto]" | bash
```


# Configurar laravel sail docker wsl windows

- Si se tiene problemas con los purtos ya que tienes muchas otras aplicaciones utilizando puertos por defecto 
- como 3036, 80, 8080, 3000, 9000 etc...
- esté enlace te servirá, explica como cambiar configurar el .env en windows con docker powered by wsl engine
[https://stackoverflow.com/questions/67053449/unable-to-set-the-app-port-on-env-for-laravel-sail](URL)

- este enlace sirve para crear un alias de sail para no usar .vendor/bin .... etc
[https://laravel.com/docs/10.x/sail#configuring-a-shell-alias](URL)

 


## 🏁 Config pgsql <a name = "configurar_pgsql"></a>

- en el archivo
[Archivo .env](.env)

- cambiar lo siguiente:

DB_CONNECTION=pgsql
DB_HOST=pgsql
DB_PORT=5432
DB_DATABASE=laravel
DB_USERNAME=sail
DB_PASSWORD=password

- se debe cambiar segun los parametros y opciones de tu base de datos

### Requisitos para correr este proyecto

- Necesitas tener, node, deno, bun o cualquier otro motor de js en tu computadora,
- Necesitas tener, php 8.1 en adelante
- Necesitas tener, Docker desktop
- Necesitas tener, wsl si usas windows, aunque si quieres administrar los contenedores en sus respectivas terminales, puedes usar Docker Engine
- Necesitas tener conocimientos de Laravel y PHP
- Donar a mi patreon 

## Comandos Básicos de Laravel Sail

- **Iniciar Sail:**
```bash
sail up
```
- **Detener Sail:**

```bash
Copy code
sail down
```
- **Iniciar Sail en Modo Daemon:**

```bash
Copy code
sail up -d
```
- **Acceder a la Consola de Contenedor:**

```bash
Copy code
sail shell
```
- **Ejecutar Comandos Artisan:**

```bash
Copy code
sail artisan [comando]
```
- **Instalar Dependencias Composer:**

```bash
Copy code
sail composer install
```
- **Ejecutar Pruebas PHPUnit:**

```bash
Copy code
sail test
```
- **Acceder a la Base de Datos MySQL:**

```bash
Copy code
sail mysql
```
- **Generar una Clave de Aplicación:**

```bash
Copy code
sail artisan key:generate
```
- **Especificar la Versión de PHP:**

```bash
Copy code
sail up --php=[versión]
```