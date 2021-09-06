# Gigimovies

# Consigna

En Gigigo necesitamos crear una App para que nuestros empleados puedan gestionar sus películas favoritas. 🎬
Para ello utilizaremos el API publico de The Movie DB (https://developers.themoviedb.org/3/getting- started/introduction).
La aplicación deberá tener una pantalla principal con dos tabs.
En la primera Tab mostraremos al usuario un listado de películas populares (https://developers.themoviedb.org/3/movies/get-popular-movies) Además de un SearchBar por si queremos hacer una búsqueda personalizada (https://developers.themoviedb.org/3/search/search- movies). Cada película, además tendrá la opción de marcar como favorita. De esta manera en la segunda Tab el usuario podrá visualizar el listado de películas que haya marcado como favoritas.

# Consideraciones

No hace falta hacer unit test para todo. Con tener uno por módulo sea UI u otro componente, es suficiente.
No entregar un proyecto funcional. Apoyar lo que se entregue con argumentos técnicos.

# Definiciones y argumentos técnicos

El proyecto está hecho enteramente en Swift utilizando Xcode 12.4, la arquitectura elegida fue VIPER aunque al ser un proyecto tan pequeño lo ideal seria utilizar algo mas sencillo como MVP ya que no se necesita tanta organización. Me decidi por VIPER ya que fue uno de los requisitos de la búsqueda por la cual desarrollé esta app.

Creo que lo ideal para el manejo de las peliculas favoritas es a hacerlo a través del backend, desde nuestro lado enviariamos la pelicula que el usuario marcó como favorita y luego le pediriamos mediante otro endpoint al servidor el array de las peliculas favoritas del usuario.

Otra manera posible si no se tiene acceso al backend como en este caso y se requiere que las peliculas persistan es hacerlo mediante base de datos guardando todo de forma local, se me ocurre para ese caso el framework Realm o algo mas nativo como CoreData.

La manera que eleji yo para este caso es el de hacer un Manager que sigue un patron singleton y guardar el array de peliculas favoritas ahi. Claro está que cada vez que el usuario mate la app las peliculas favoritas seran eliminadas. 

# Librerias

Como gestor de librerias utilicé cocoapods y mediante el mismo instalé dos dependencias Kingfisher: Utilizado para optimizar el manejo de imagenes https://github.com/onevcat/Kingfisher y

Swiftlint: que es una herramienta que utilizo para que mi codigo cumpla con reglas de sintaxis para un mejor orden y un código mas limpio https://github.com/realm/SwiftLint

# Diseño

Para esta app no tuve muy en cuenta el diseño ya que por falta de tiempo elegí priorizar el código. Para ver un diseño de mi autoria podeis clonar https://github.com/guidofa/brastlewark

