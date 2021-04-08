cmake_minimum_required(VERSION 3.17)
project(DSP1_S3)

set(CMAKE_CXX_STANDARD 14)

add_executable(DSP1_S3 main.cpp Cliente.cpp Cliente.h GestorFiltros.cpp GestorFiltros.h CadenaFiltros.cpp CadenaFiltros.h Filtro.cpp Filtro.h FiltroPrioridad.cpp FiltroPrioridad.h Formulario.cpp Formulario.h FiltroEncriptacion.cpp FiltroEncriptacion.h Target.cpp Target.h)