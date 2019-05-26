# Tenemos los siguientes ficheros:
# 1. Fichero de usuarios
# 2. Fichero de actividades
# 3. Fichero con la propiedad medida en cada registro. Tenemos para test y train
# 4. Fichero con el vector de mediciones.Tenemos para test y train

# planteamos un data set con las siguientes columnas:
# usuario: id de usuario
# grupo: test/train dependiendo del grupo en el que se encontrara el usuario
# actividad que se quiere medir. se sugiere dejar sólo el nombre de la actividad
# feature: de los valores originales de features: BodyAcc, BodyGyro y Gravity
# cada una de esas features cuenta con algunos atributos,que serán:
Jerk: Yes/NO indicando si se ha aplicado Jerk signal
Mag: Yes/NO indicando si se ha aplicado Euclidean norm
Medicion: Time/Frecuency. será Frecuency cuando sehaya aplicado  Fast Fourier Transform
Eje: X/Y/Z/NA si esa medida no está separada por ejes
Operacion: Media o Desviacion.

# en el script, se han seleccionado las columnas, del fichero features, que hacen referencia a medias o desviaciones típicas, quedando un vector con los elementos
(1, 2, 3, 4, 5, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 271, 345, 346, 347, 348, 349, 350, 424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 529, 530, 542, 543)
 
# se recuperan las etiquetas de cada uno de esos elementos y se extraen las propiedades citadas arriba, de esas features.
# se ha construido la funcion etiquetas_add_features para tratar cada uno de esos atributos.

# una vez leido el fichero con todas las mediciones, se han transformado esas columnas, en nuevas filas, haciendo gather.
# después, se han relacionado esas filas, con los features originales, con las features finales y sus atributos.

# Finalmente, se han obtenido las medias que nos piden en el punto 5 del proyecto.


Generated Files
resultado.txt:tidy data
resultado_average.txt: mean of the value column, for each subject and each activity

