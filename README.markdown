Comunidad de Estudiantes
========================

NOTA: Tener instalado bundler antes de continuar.

Una vez instalado bundler pueden correr los siguientes comandos y la
aplicación debería iniciarse en http://localhost:3000

           $ bundle install --binstubs
           $ bin/rake community_engine:install
           $ bin/rake db:migrate

Una vez terminada las migraciones pueden iniciar el servidor con:

           $ bin/rails s




