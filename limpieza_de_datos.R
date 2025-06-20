library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)
datos<- read.csv("C:/Users/ev269/Downloads/netflix_recuperacion.csv")

# A)	Visualiza la distribución de NAs.
vis_miss(datos)

# tratamiento de NAs
# media numerico 
as.numeric(datos$release_year)
as.numeric(datos$duration)

# 1 
media_release<- mean(datos$release_year,na.rm=TRUE)
datos$release_year[is.na(datos$release_year)]<- media_release

# 2 
media_duration<- mean(datos$duration,na.rm=TRUE)
datos$release_year[is.na(datos$duration)]<- media_duration


# imputar con la moda 
moda_shows<-names(sort(table(datos$show_id),decreasing=TRUE))
datos$show_id[is.na(datos$show_id)]<-moda_shows

moda_type<-names(sort(table(datos$type),decreasing=TRUE))
datos$type[is.na(datos$type)]<-moda_type

moda_title<-names(sort(table(datos$title),decreasing=TRUE))
datos$title[is.na(datos$title)]<-moda_title

moda_director<-names(sort(table(datos$director),decreasing=TRUE))
datos$director[is.na(datos$director)]<-moda_director

moda_country<-names(sort(table(datos$country),decreasing=TRUE))
datos$country[is.na(datos$country)]<-moda_country

moda_rating<-names(sort(table(datos$rating),decreasing=TRUE))
datos$rating[is.na(datos$rating)]<-moda_rating

moda_date<-names(sort(table(datos$date_added),decreasing=TRUE))
datos$date_added[is.na(datos$date_added)]<-moda_date

moda_listen<-names(sort(table(datos$listed_in),decreasing=TRUE))
datos$listed_in[is.na(datos$listed_in)]<-moda_listen