cmake_minimum_required(VERSION 3.17)
project(untitled)

set(CMAKE_CXX_STANDARD 11)

add_executable(untitled main.cpp Cliente.cpp Cliente.h ReporteMuertes.cpp ReporteMuertes.h GestorFiltro.cpp GestorFiltro.h CadenaFiltro.cpp CadenaFiltro.h FiltroMuertesSospechosas.cpp FiltroMuertesSospechosas.h FiltroMuertesCasas.cpp FiltroMuertesCasas.h FiltroMuertesResidencias.cpp FiltroMuertesResidencias.h Filtro.cpp Filtro.h MinisterioSanidad.cpp MinisterioSanidad.h)