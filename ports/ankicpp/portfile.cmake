vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO natancamargo/ankicpp
    REF "${VERSION}"
    SHA512 dbd11f55f63f33a5d528399970a34fb0c1f45633464c86c331b80650eeeffd14a4a24f6c9ca6558769c652700c35723fd8913c9f403651869723bd68629a6ccf
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

# TODO: fix debug/share does not exist
file(MAKE_DIRECTORY "${CURRENT_PACKAGES_DIR}/debug/share/ankicpp")

vcpkg_cmake_config_fixup(PACKAGE_NAME "ankicpp")

# TODO: understand why this removal solves include error
# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")