# Tenemos los siguientes ficheros:
# 1. Fichero de usuarios
# 2. Fichero de actividades
# 3. Fichero con la propiedad medida en cada registro. Tenemos para test y train
# 4. Fichero con el vector de mediciones.Tenemos para test y train

# planteamos un data set con las siguientes columnas:
# usuario: id de usuario
# grupo: test/train dependiendo del grupo en el que se encontrara el usuario
# actividad que se quiere medir. se sugiere dejar sólo el nombre de la actividad
# descripción de la actividad. 


# original features 
1 tBodyAcc-mean()-X --> 
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
41 tGravityAcc-mean()-X
42 tGravityAcc-mean()-Y
43 tGravityAcc-mean()-Z
44 tGravityAcc-std()-X
45 tGravityAcc-std()-Y
46 tGravityAcc-std()-Z
81 tBodyAccJerk-mean()-X
82 tBodyAccJerk-mean()-Y
83 tBodyAccJerk-mean()-Z
84 tBodyAccJerk-std()-X
85 tBodyAccJerk-std()-Y
86 tBodyAccJerk-std()-Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
516 fBodyBodyAccJerkMag-mean()
517 fBodyBodyAccJerkMag-std()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()
555 angle(tBodyAccMean,gravity)
556 angle(tBodyAccJerkMean),gravityMean)
557 angle(tBodyGyroMean,gravityMean)
558 angle(tBodyGyroJerkMean,gravityMean)
559 angle(X,gravityMean)
560 angle(Y,gravityMean)
561 angle(Z,gravityMean)

tBodyAcc-XYZ --> Body acceleration signal time
tGravityAcc-XYZ --> Gravity acceleration signal time
tBodyAccJerk-XYZ --> Body linear acceleration Jerk signal time
tBodyGyro-XYZ --> angular velocity signal time
tBodyGyroJerk-XYZ --> angular velocity Jerk signal time
tBodyAccMag --> Body acceleration signal Euclidean norm
tGravityAccMag -->  Gravity acceleration signal Euclidean norm
tBodyAccJerkMag --> Body acceleration Jerk signal Euclidean norm
tBodyGyroMag --> angular velocity signal Euclidean norm
tBodyGyroJerkMag --> angular velocity Jerk signal Euclidean norm
fBodyAcc-XYZ --> Fast Fourier Transform of Body acceleration signal time
fBodyAccJerk-XYZ --> Fast Fourier Transform of Body linear acceleration Jerk signal time
fBodyGyro-XYZ --> Fast Fourier Transform of angular velocity signal time
fBodyAccMag --> Fast Fourier Transform of Body acceleration signal Euclidean norm
fBodyAccJerkMag --> Fast Fourier Transform of Body acceleration Jerk signal Euclidean norm
fBodyGyroMag --> Fast Fourier Transform of angular velocity signal Euclidean norm
fBodyGyroJerkMag --> Fast Fourier Transform of angular velocity Jerk signal Euclidean norm

# atributes to add to final features 
medida: podrá tener los valores BodyAcc, BodyGyro o Gravity
Jerk: Yes/NO indicando si se ha aplicado Jerk signal
Mag: Yes/NO indicando si se ha aplicado Euclidean norm
Medicion: Time/Frecuency. será Frecuency cuando sehaya aplicado  Fast Fourier Transform
Eje: X/Y/Z/NA si esa medida no está separada por ejes
Operacion: Media o Desviacion.
Valor: Valor de la medición

Generated Files
resultado.txt:tidy data
resultado_average.txt: mean of the value column, for each subject and each activity

