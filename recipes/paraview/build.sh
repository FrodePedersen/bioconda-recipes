#!/bin/bash

export PARAVIEW_VERSION=5.2.0
export PARAVIEW_VERSHORT=5.2

export INCLUDE_PATH="${PREFIX}/include"
export LIBRARY_PATH="${PREFIX}/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"
export LDFLAGS="-L${PREFIX}/lib"
export CPPFLAGS="-I${PREFIX}/include"

rm -R ./Plugins/*
mkdir build
cd build

PY_LIB="libpython${PY_VER}.so" 

ls -l ${PREFIX}/lib/

cmake \
    -D CMAKE_INSTALL_PREFIX=${PREFIX} \
    -D CMAKE_INSTALL_RPATH:STRING=${PREFIX}/lib \
    -D BUILD_SHARED_LIBS=ON \
    -D CMAKE_BUILD_TYPE=Release \
    -D BUILD_TESTING:BOOL=OFF \
    -D BUILD_DOCUMENTATION:BOOL=OFF \
    -D BUILD_EXAMPLES:BOOL=OFF \
    -D PARAVIEW_BUILD_QT_GUI:BOOL=OFF \
    -D PARAVIEW_INSTALL_DEVELOPMENT_FILES:BOOL=OFF \
    -D PARAVIEW_ENABLE_CATALYST:BOOL=OFF \
    -D PARAVIEW_ENABLE_PYTHON:BOOL=ON \
    -D PARAVIEW_ENABLE_WEB:BOOL=ON \
    -D OPENGL_gl_LIBRARY="" \
    -D OPENGL_glu_LIBRARY="${PREFIX}/lib/libGLU.so" \
    -D VTK_USE_X:BOOL=OFF \
    -D VTK_USE_OFFSCREEN:BOOL=ON \
    -D VTK_USE_SYSTEM_PROTOBUF:BOOL=ON \
    -D VTK_USE_SYSTEM_HDF5:BOOL=ON \
    -D VTK_USE_SYSTEM_ZLIB:BOOL=ON \
    -D VTK_USE_SYSTEM_JPEG:BOOL=ON \
    -D VTK_USE_SYSTEM_PNG:BOOL=ON \
    -D VTK_USE_SYSTEM_TIFF:BOOL=ON \
    -D VTK_USE_SYSTEM_OGGTHEORA=ON \
    -D VTK_USE_SYSTEM_PUGIXML:BOOL=OFF \
    -D VTK_USE_SYSTEM_LIBXML2:BOOL=ON \
    -D VTK_USE_SYSTEM_FREETYPE:BOOL=ON \
    -D VTK_USE_SYSTEM_TWISTED:BOOL=ON \
    -D VTK_USE_SYSTEM_AUTOBAHN:BOOL=OFF \
    -D VTK_USE_SYSTEM_GL2PS:BOOL=OFF \
    -D VTK_USE_SYSTEM_EXPAT:BOOL=ON \
    -D VTK_USE_SYSTEM_ZOPE:BOOL=ON \
    -D VTK_OPENGL_HAS_OSMESA:BOOL=ON \
    -D LINK_SEARCH_END_STATIC=ON \
    -D OSMESA_INCLUDE_DIR="$PREFIX/include" \
    -D OSMESA_LIBRARY="$PREFIX/lib/libOSMesa.so" \
    -D PUGIXML_LIBRARIES=${PREFIX}/lib/ \
    -D PUGIXML_INCLUDE_DIRS=${PREFIX}/include/ \
        ..

make -j4
make install
