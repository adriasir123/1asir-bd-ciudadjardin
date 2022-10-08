<h1 style="text-align:center">PROYECTO ESTACIÓN METEOROLÓGICA</h1>

<h3 style="text-align:center">por Adrián Jaramillo Rodríguez</h3>

***

[TOC]

***

AVISO: borramos la máquina virtual con raspbian en ISO, así que he tenido que volver a crear una nueva máquina virtual.

# Actualización del sistema 

Antes de empezar con el proceso de instalación de lamp, debemos actualizar 2 cosas:

* Nuestra Raspberry

```bash
sudo rpi-update
```

* Nuestro sistema

```bash
sudo apt update
```

```bash
sudo apt upgrade
```

# Instalando servidor web

1. Ejecutamos la siguiente orden
```bash
sudo apt install apache2
```

2. Para comprobar si la instalación se hizo correctamente, entramos en un navegador y escribimos la dirección IP que tengamos en nuestra Raspberry.

   ![1543925211510](C:\Users\Alumno\AppData\Roaming\Typora\typora-user-images\1543925211510.png)

Si nos aparece la siguiente pantalla, significa que la instalación del servidor web se hizo correctamente.

3. Cambiaremos ahora propietarios y permisos

   ```bash
   cd /var/www/
   sudo chown -R www-data:www-data html
   sudo find html -type d -print -exec chmod 775 {} \;
   sudo find html -type f -print -exec chmod 664 {} \;
   ```
4. Añadimos nuestro usuario al grupo "www-data"
   ```bash
   sudo usermod -a -G www-data pi
   ```

5. Si hemos seguido los pasos correctamente, tendremos ya instalado nuestro servidor web.

# Instalando PHP

1. Instalamos PHP 7

   ```bash
   sudo apt-get install php
   ```

   Para comprobar que la instalación se ha hecho correctamente y que tenemos la última versión, podemos ejecutar el siguiente comando:

   ```bash
   php -v	
   ```

   ![1544002544968](C:\Users\Alumno\AppData\Roaming\Typora\typora-user-images\1544002544968.png)

   Como vemos, hemos podido instalar correctamente php, y tenemos la última versión disponible.

2. Actualizamos de nuevo los paquetes

   ```bash
   sudo apt update
   sudo apt upgrade
   ```

3. Ejecutamos el siguiente comando 

   ```bash
   sudo apt install -t stretch -y php7.0 libapache2-mod-php7.0 php7.0-mysql
   ```

4. Reiniciamos el servidor apache

   ````bash
   sudo /etc/init.d/apache2 restart
   ````

5. Ejecutamos el siguiente comando para comprobar que nuestro servidor web está funcionando

   ```bash
   sudo /etc/init.d/apache2 status
   ```

6. Para comprobar que php está funcionando, creamos una página web con la siguiente ruta

   ```bash
   /var/www/html/index.php
   ```

   y el siguiente contenido

   ```php
   <?php phpinfo(); ?>
   ```

   ![1544003840805](C:\Users\Alumno\AppData\Roaming\Typora\typora-user-images\1544003840805.png)

Con la siguiente captura vemos por tanto, que php está funcionando correctamente.

# Instalando MariaDB

1. Ejecutamos la siguiente orden para instalar MariaDB

   ```bash
   sudo apt install mariadb-server
   ```

2. Para comprobar que tenemos mariadb instalado, podemos ejecutar el siguiente comando

   ```bash
   sudo mariadb
   ```

   ![1544004491806](C:\Users\Alumno\AppData\Roaming\Typora\typora-user-images\1544004491806.png)

Como podemos ver, hemos podido acceder correctamente a mariadb.