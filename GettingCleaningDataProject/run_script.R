library(dplyr)
library(plyr)
library(tidyr)
library(stringr)

# etiquetas_add_features: function that creates a new column with the information that we want to separate
#  columns: 
# medida: 
# Jerk: Indica si la medida 
# Mag
# Medicion
# Axis
# operacion
etiquetas_add_features <- function(df, cadenaBusqueda) {
  # df features data frame
  # cadenaBusqueda: column we want to analyze. measure to incorporate to data frame: medida, Jerk, Mag, Medicion, Axis u operacion
  if (cadenaBusqueda == "Jerk") { # possible values: TRUE FALSE
    vLogical <- grepl("Jerk", df[[2]])
    colAdd <- vLogical
  } else if (cadenaBusqueda == "Mag") { #possible values: TRUE FALSE
    vLogical <- grepl("Mag-", df[[2]])
    colAdd <- vLogical
  } else if (cadenaBusqueda == "Time/Frecuency") {
    vLogical <- grepl("^t", df[[2]]) # TRUE sera Time. False sera Frecuency
    vCharacter <- as.character(factor(vLogical == TRUE, labels=c('Frecuency', 'Time')))
    
    colAdd <- vCharacter
  } else if (cadenaBusqueda == "Axis") {
    a <- str_sub(etiquetas_measures[[2]], -1) # me quedo con el ultimo caracter
    a[a != "X" & a != "Y" & a != "Z"] <- NA # sustituyo los valores que no son X/Y/Z por NA
    
    colAdd <- a
  } else if (cadenaBusqueda == "medida") { # BodyAcc, BodyGyro o Gravity
    v <- df[[2]]
    vLogical1 <- grepl("BodyAcc", df[[2]])
    #vLogical1[vLogical1 == TRUE] <- "BodyAcc"
    vLogical1[vLogical1 == TRUE] <- 1
    vLogical1[vLogical1 == FALSE] <- 0
    
    vLogical2 <- grepl("BodyGyro", df[[2]])
    #vLogical2[vLogical2 == TRUE] <- "BodyGyro"
    vLogical2[vLogical2 == TRUE] <- 2
    vLogical2[vLogical2 == FALSE] <- 0
    
    vLogical3 <- grepl("Gravity", df[[2]])
    #vLogical3[vLogical3 == TRUE] <- "Gravity"
    vLogical3[vLogical3 == TRUE] <- 4
    vLogical3[vLogical3 == FALSE] <- 0
    d <- data.frame(vLogical1, vLogical2, vLogical3)
    d <- mutate(d, cuarta = d$vLogical1 + d$vLogical2 + d$vLogical3)
    
    d$cuarta[d$cuarta == "1"] <- "BodyAcc"
    d$cuarta[d$cuarta == "2"] <- "BodyGyro"
    d$cuarta[d$cuarta == "4"] <- "Gravity"
    
    colAdd <- d$cuarta
    
  } else if (cadenaBusqueda == "operacion") {
    #etiquetas_measures2 <-  separate(etiquetas_measures, V2, c("feature", "operation", "Axis"))[[3]] # mean/std
    vLogical <- grepl("-mean()", df[[2]]) # TRUE sera mean False sera std
    vCharacter <- as.character(factor(vLogical == TRUE, labels=c('mean', 'std')))
    
    colAdd <- vCharacter
  } else if (cadenaBusqueda == "medida2") {
    etiquetas_measures2 <-  separate(etiquetas_measures, V2, c("feature", "operation", "Axis"))[[2]] # BodyAcc BodyGyro Gravity
    colAdd <- etiquetas_measures2
  }
  
  cbind(df, colAdd)
  
}
# Lectura de ficheros de datos en data frames
# 1. Fichero de actividades: 

df_activity <- read.table("activity_labels.txt", header = FALSE, sep= " ")

# 2. Fichero de columnas features.txt
df_features <- read.table("features.txt", header = FALSE, sep= " ")

# Me quedo con las variables que me interesan, definidas en este vector. son las que contienen medias y desviaciones tipicas
columnas <- c(1, 2, 3, 4, 5, 41, 42, 43, 44, 45, 46, 81, 82, 83, 84, 85, 86, 121, 122, 123, 124, 125, 126, 161, 162, 163, 164, 165, 166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266, 267, 268, 269, 270, 271, 345, 346, 347, 348, 349, 350, 424, 425, 426, 427, 428, 429, 503, 504, 516, 517, 529, 530, 542, 543)
etiquetas_measures <- df_features[columnas,]
# ampliamos el data frame con el resto de columnas que necesito: medida: BodyAcc, BodyGyro o Gravity; Jerk TRUE/FALSE; Mag TRUE/FALSE; Medicion: Time/Frecuency; Eje:X/Y/Z; operacion: mean/std




etiquetas_measures <- etiquetas_add_features(etiquetas_measures, "Jerk")
etiquetas_measures <- etiquetas_add_features(etiquetas_measures, "Mag")
etiquetas_measures <- etiquetas_add_features(etiquetas_measures, "Time/Frecuency")
etiquetas_measures <- etiquetas_add_features(etiquetas_measures, "Axis")
etiquetas_measures <- etiquetas_add_features(etiquetas_measures, "medida")
etiquetas_measures <- etiquetas_add_features(etiquetas_measures, "operacion")

# column names
colnames(etiquetas_measures) <- c("id", "feature", "Jerk", "euclideanNorm", "measure", "axis", "featurefinal", "operation")
# etiquetas_measures2 <- select(etiquetas_measures, id, description, Jerk, EuclideanNorm, Measure, Axis, feature, operation)

# paso 3. lectura de los ficheros de sujetos
df_subject_test <- read.table("test/subject_test.txt", header = FALSE, sep= " ")
df_subject_test <- mutate(df_subject_test, grupo = "test")
colnames(df_subject_test) <- c("usuario", "grupo")
df_subject_train <- read.table("train/subject_train.txt", header = FALSE, sep= " ")
df_subject_train <- mutate(df_subject_train, grupo = "train")
colnames(df_subject_train) <- c("usuario", "grupo")

# paso 4. lectura de los ficheros de actividad medida en cada registro
df_activity_row_test <- read.table("test/y_test.txt", header = FALSE, sep= " ")
# añado la descripcion de la actividad
df_activity_row_test <- merge(df_activity_row_test, df_activity)
colnames(df_activity_row_test)  <- c("identificadoractivity", "activity")

df_activity_row_train <- read.table("train/y_train.txt", header = FALSE, sep= " ")
df_activity_row_train <- merge(df_activity_row_train, df_activity)
colnames(df_activity_row_train)  <- c("identificadoractivity", "activity")

# paso 5. lecura de la malla de datos
df_measures_test <- read.table("test/x_test.txt", header = FALSE)
df_measures_train <- read.table("train/x_train.txt", header = FALSE)

# en esos data frames, cada columna de cada fila tiene una feature. Tendrá asociado un registro del data frame etiquetas_measures.
df_measures_test2 <- df_measures_test[, columnas]
colnames(df_measures_test2) <- etiquetas_measures[, 2]
df_measures_train2 <- df_measures_train[, columnas]
colnames(df_measures_train2) <- etiquetas_measures[, 2]

# creamos un data set, a partir  de los data frames df_subject_test, df_activity_row_test, df_measures_test2
df_test <- cbind(df_subject_test, df_activity_row_test, df_measures_test2)
df_train <- cbind(df_subject_train, df_activity_row_train, df_measures_train2)

# unimos el data frame test y train
datos <- rbind(df_test, df_train)

# en este punto tengo las columnas 
# usuario
# grupo
# actividad id
# actividad descripcion
# vector de datos.

# Now, we have to gather "vector de datos". The remaining columns  have not been modified
result <- gather(datos, "feature", "value", -usuario:-activity)

result_all <- join(result, etiquetas_measures, "feature")
# Tengo un data frame con las columnas
# Usuario
# grupo: test or train
# identificadorActivity
# activity
# original feature
# valor
# id feature
# Jerk
# EuclideanNorm
# Measure
# Axis
# feature final
# operation
# dato. valor

# ahora me quedo con las columnas que necesito. Quito la actividad id,id, description
result_all <- select(result_all, usuario, grupo, activity, featurefinal, Jerk, euclideanNorm, measure, axis, operation, value)
#lo vuelco a un fichero .tx
write.table(result_all, "resultado.txt", sep=" ")

# get the average of each variable for each activity and each subject.
data2 <- plyr::ddply(result_all, vector, plyr::summarize, value=mean(valor))
write.table(data2, "resultado_average.txt", sep=" ")

