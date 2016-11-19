#!/bin/bash

USUARIOS="Usuarios.dat"
EMPRESAS="EmpresasPorUsuario.dat"

USUARIO=$1

# Muestra por salida estandar la o las empresas para las cuales fue dado de alta
# Nombre Empresa,Fecha Alta,Estado(Activo/Inactivo)

USUARIO_ID=$(grep ";$USUARIO;" $USUARIOS | sed "s@^\([^;]*\);[^;]*;[^;]*;[^;]*@\1@")

grep ";$USUARIO_ID;1;" $EMPRESAS | sed "s@^\([^;]*\);[^;]*;[^;]*;\([^;]*\)@\1,ACTIVO,\2@g"

grep ";$USUARIO_ID;0;" $EMPRESAS | sed "s@^\([^;]*\);[^;]*;[^;]*;\([^;]*\)@\1,INACTIVO,\2@g"
