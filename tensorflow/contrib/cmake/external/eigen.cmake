#new_http_archive(
#  name = "eigen_archive",
#  url = "https://bitbucket.org/eigen/eigen/get/...",
#  sha256 = "...",
#  build_file = "eigen.BUILD",
#)

include (ExternalProject)

set(eigen_archive_hash "ed4c9730b545")

set(eigen_INCLUDE_DIRS
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_BINARY_DIR}/external/eigen_archive
    ${CMAKE_CURRENT_BINARY_DIR}/external/eigen_archive/eigen-eigen-${eigen_archive_hash}
    ${tensorflow_source_dir}/third_party/eigen3
)
set(eigen_URL https://bitbucket.org/eigen/eigen/get/${eigen_archive_hash}.tar.gz)
set(eigen_HASH SHA256=3d9eceb8a2add299e37b1f32759157cc2574f7684936c151552a5ae3f33aebd5)
set(eigen_BUILD ${CMAKE_CURRENT_BINARY_DIR}/eigen/src/eigen)
set(eigen_INSTALL ${CMAKE_CURRENT_BINARY_DIR}/eigen/install)

ExternalProject_Add(eigen
    PREFIX eigen
    URL ${eigen_URL}
    URL_HASH ${eigen_HASH}
    DOWNLOAD_DIR "${DOWNLOAD_LOCATION}"
    INSTALL_DIR "${eigen_INSTALL}"
    CMAKE_CACHE_ARGS
        -DCMAKE_BUILD_TYPE:STRING=Release
        -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF
        -DCMAKE_INSTALL_PREFIX:STRING=${eigen_INSTALL}
        -DINCLUDE_INSTALL_DIR:STRING=${CMAKE_CURRENT_BINARY_DIR}/external/eigen_archive/eigen-eigen-${eigen_archive_hash}
)
