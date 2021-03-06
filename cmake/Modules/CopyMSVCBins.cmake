# Doesn't realy make sense anywhere else
if(NOT MSVC)
	return()
endif()

# Internal variable to avoid copying more than once
if(COPIED_DEPENDENCIES)
	return()
endif()

option(COPY_DEPENDENCIES "Automaticaly try copying all dependencies" ON)
if(NOT COPY_DEPENDENCIES)
	return()
endif()

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
	set(_bin_suffix 64)
else()
	set(_bin_suffix 32)
endif()

find_package(Libavcodec QUIET)
find_package(Libx264 QUIET)
find_package(Libfdk QUIET)
find_package(ssl QUIET)
find_package(Qt5Core QUIET)

file(GLOB FFMPEG_BIN_FILES
	"${FFMPEG_avcodec_INCLUDE_DIR}/../bin/avcodec-*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/../bin${_bin_suffix}/avcodec-*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/bin${_bin_suffix}/avcodec-*.dll"

	"${FFMPEG_avformat_INCLUDE_DIR}/../bin/avformat-*.dll"
	"${FFMPEG_avformat_INCLUDE_DIR}/../bin${_bin_suffix}/avformat-*.dll"
	"${FFMPEG_avformat_INCLUDE_DIR}/bin${_bin_suffix}/avformat-*.dll"

	"${FFMPEG_avutil_INCLUDE_DIR}/../bin/avutil-*.dll"
	"${FFMPEG_avutil_INCLUDE_DIR}/../bin${_bin_suffix}/avutil-*.dll"
	"${FFMPEG_avutil_INCLUDE_DIR}/bin${_bin_suffix}/avutil-*.dll"

	"${FFMPEG_avdevice_INCLUDE_DIR}/../bin/avdevice-*.dll"
	"${FFMPEG_avdevice_INCLUDE_DIR}/../bin${_bin_suffix}/avdevice-*.dll"
	"${FFMPEG_avdevice_INCLUDE_DIR}/bin${_bin_suffix}/avdevice-*.dll"

	"${FFMPEG_avfilter_INCLUDE_DIR}/../bin/avfilter-*.dll"
	"${FFMPEG_avfilter_INCLUDE_DIR}/../bin${_bin_suffix}/avfilter-*.dll"
	"${FFMPEG_avfilter_INCLUDE_DIR}/bin${_bin_suffix}/avfilter-*.dll"

	"${FFMPEG_postproc_INCLUDE_DIR}/../bin/postproc-*.dll"
	"${FFMPEG_postproc_INCLUDE_DIR}/../bin${_bin_suffix}/postproc-*.dll"
	"${FFMPEG_postproc_INCLUDE_DIR}/bin${_bin_suffix}/postproc-*.dll"

	"${FFMPEG_swscale_INCLUDE_DIR}/../bin/swscale-*.dll"
	"${FFMPEG_swscale_INCLUDE_DIR}/bin${_bin_suffix}/swscale-*.dll"
	"${FFMPEG_swscale_INCLUDE_DIR}/../bin${_bin_suffix}/swscale-*.dll"

	"${FFMPEG_swresample_INCLUDE_DIR}/../bin/swresample-*.dll"
	"${FFMPEG_swresample_INCLUDE_DIR}/../bin${_bin_suffix}/swresample-*.dll"
	"${FFMPEG_swresample_INCLUDE_DIR}/bin${_bin_suffix}/swresample-*.dll"

	"${FFMPEG_avcodec_INCLUDE_DIR}/../bin/libopus*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/../bin/opus*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/bin/libopus*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/bin/opus*.dll"

	"${FFMPEG_avcodec_INCLUDE_DIR}/../bin/libogg*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/../bin/libvorbis*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/bin/libogg*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/bin/libvorbis*.dll"

	"${FFMPEG_avcodec_INCLUDE_DIR}/../bin${_bin_suffix}/libopus*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/../bin${_bin_suffix}/opus*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/bin${_bin_suffix}/libopus*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/bin${_bin_suffix}/opus*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/../bin/libbz2*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/../bin/zlib*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/bin/libbz2*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/bin/zlib*.dll"

	"${FFMPEG_avcodec_INCLUDE_DIR}/../bin${_bin_suffix}/libbz2*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/../bin${_bin_suffix}/zlib*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/bin${_bin_suffix}/libbz2*.dll"
	"${FFMPEG_avcodec_INCLUDE_DIR}/bin${_bin_suffix}/zlib*.dll"
	)

file(GLOB X264_BIN_FILES
	"${X264_INCLUDE_DIR}/../bin${_bin_suffix}/libx264-*.dll"
	"${X264_INCLUDE_DIR}/../bin/libx264-*.dll"
	"${X264_INCLUDE_DIR}/bin/libx264-*.dll"
	"${X264_INCLUDE_DIR}/bin${_bin_suffix}/libx264-*.dll")

file(GLOB FREETYPE_BIN_FILES
	"${FREETYPE_INCLUDE_DIR_ft2build}/../../bin${_bin_suffix}/libfreetype*-*.dll"
	"${FREETYPE_INCLUDE_DIR_ft2build}/../../bin/libfreetype*-*.dll"
	"${FREETYPE_INCLUDE_DIR_ft2build}/../bin${_bin_suffix}/libfreetype*-*.dll"
	"${FREETYPE_INCLUDE_DIR_ft2build}/../bin/libfreetype*-*.dll"
	"${FREETYPE_INCLUDE_DIR_ft2build}/bin/libfreetype*-*.dll"
	"${FREETYPE_INCLUDE_DIR_ft2build}/bin${_bin_suffix}/libfreetype*-*.dll")

file(GLOB LIBFDK_BIN_FILES
	"${Libfdk_INCLUDE_DIR}/../bin${_bin_suffix}/libfdk*-*.dll"
	"${Libfdk_INCLUDE_DIR}/../bin/libfdk*-*.dll"
	"${Libfdk_INCLUDE_DIR}/bin/libfdk*-*.dll"
	"${Libfdk_INCLUDE_DIR}/bin${_bin_suffix}/libfdk*-*.dll")

file(GLOB SSL_BIN_FILES
	"${SSL_INCLUDE_DIR}/../bin${_bin_suffix}/ssleay32*.dll"
	"${SSL_INCLUDE_DIR}/../bin${_bin_suffix}/libeay32*.dll"
	"${SSL_INCLUDE_DIR}/../bin/ssleay32*.dll"
	"${SSL_INCLUDE_DIR}/../bin/libeay32*.dll"
	"${SSL_INCLUDE_DIR}/bin${_bin_suffix}/ssleay32*.dll"
	"${SSL_INCLUDE_DIR}/bin${_bin_suffix}/libeay32*.dll"
	"${SSL_INCLUDE_DIR}/bin/ssleay32*.dll"
	"${SSL_INCLUDE_DIR}/bin/libeay32*.dll")

file(GLOB CURL_BIN_FILES
	"${CURL_INCLUDE_DIR}/../build/Win${_bin_suffix}/VC12/DLL Release - DLL Windows SSPI/libcurl.dll"
	"${CURL_INCLUDE_DIR}/../bin${_bin_suffix}/libcurl*.dll"
	"${CURL_INCLUDE_DIR}/../bin${_bin_suffix}/curl*.dll"
	"${CURL_INCLUDE_DIR}/../bin/libcurl*.dll"
	"${CURL_INCLUDE_DIR}/../bin/curl*.dll"
	"${CURL_INCLUDE_DIR}/bin${_bin_suffix}/libcurl*.dll"
	"${CURL_INCLUDE_DIR}/bin${_bin_suffix}/curl*.dll"
	"${CURL_INCLUDE_DIR}/bin/libcurl*.dll"
	"${CURL_INCLUDE_DIR}/bin/curl*.dll"
	)

if (ZLIB_LIB)
	GET_FILENAME_COMPONENT(ZLIB_BIN_PATH ${ZLIB_LIB} PATH)
endif()
file(GLOB ZLIB_BIN_FILES
	"${ZLIB_BIN_PATH}/zlib*.dll")

if (NOT ZLIB_BIN_FILES)
	file(GLOB ZLIB_BIN_FILES
		"${ZLIB_INCLUDE_DIR}/../bin${_bin_suffix}/zlib*.dll"
		"${ZLIB_INCLUDE_DIR}/../bin/zlib*.dll"
		"${ZLIB_INCLUDE_DIR}/bin${_bin_suffix}/zlib*.dll"
		"${ZLIB_INCLUDE_DIR}/bin/zlib*.dll"
		)
endif()

if (CMAKE_CONFIGURATION_TYPES MATCHES "Debug")
	file(GLOB QT_DEBUG_BIN_FILES
		"${Qt5Core_DIR}/../../../bin/Qt5Cored.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5Guid.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5Widgetsd.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5WebChanneld.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5WebEngined.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5WebEngineCored.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5WebEngineWidgetsd.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5Qmld.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5Quickd.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5Networkd.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5Positioningd.dll"
		"${Qt5Core_DIR}/../../../bin/libGLESv2d.dll"
		"${Qt5Core_DIR}/../../../bin/libEGLd.dll")
	file(GLOB QT_DEBUG_PLAT_BIN_FILES
		"${Qt5Core_DIR}/../../../plugins/platforms/qwindowsd.dll")
endif()

if (CMAKE_CONFIGURATION_TYPES MATCHES "Rel")
	file(GLOB QT_BIN_FILES
		"${Qt5Core_DIR}/../../../bin/Qt5Core.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5Gui.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5Widgets.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5WebChannel.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5WebEngine.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5WebEngineCore.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5WebEngineWidgets.dll"
		"${Qt5Core_DIR}/../../../bin/QtWebEngineProcess.exe"
		"${Qt5Core_DIR}/../../../resources/qtwebengine_resources.pak"
		"${Qt5Core_DIR}/../../../resources/qtwebengine_resources_100p.pak"
		"${Qt5Core_DIR}/../../../resources/qtwebengine_resources_200p.pak"
		"${Qt5Core_DIR}/../../../bin/Qt5Qml.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5Quick.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5Network.dll"
		"${Qt5Core_DIR}/../../../bin/Qt5Positioning.dll"
		"${Qt5Core_DIR}/../../../bin/libGLESv2.dll"
		"${Qt5Core_DIR}/../../../bin/libEGL.dll")
	file(GLOB QT_PLAT_BIN_FILES
		"${Qt5Core_DIR}/../../../plugins/platforms/qwindows.dll")
endif()

file(GLOB QT_ICU_BIN_FILES
	"${Qt5Core_DIR}/../../../bin/icu*.dll")

if (CMAKE_CONFIGURATION_TYPES MATCHES "Debug")
	file(GLOB PRG_DEBUG_BIN_FILES
		"${PrgPath}/bin/Debug/*.dll"
		"${PrgPath}/bin/Debug/icudtl.dat")
endif()

if (CMAKE_CONFIGURATION_TYPES MATCHES "Rel")
	file(GLOB PRG_RELEASE_BIN_FILES
		"${PrgPath}/bin/Release/*.dll"
		"${PrgPath}/bin/Release/icudtl.dat")
endif()

if (CMAKE_CONFIGURATION_TYPES MATCHES "Rel")
	file(GLOB WIN_CRT_BIN_FILES
		"${CMAKE_SOURCE_DIR}/deps/win-crt/*.dll")
endif()

if (CMAKE_CONFIGURATION_TYPES MATCHES "Debug")
	file(GLOB AUTH_SDK_DEBUG_BIN_FILES
		"${AuthSDKPath}/Debug/*.dll")
endif()

if (CMAKE_CONFIGURATION_TYPES MATCHES "Rel")
	file(GLOB AUTH_SDK_RELEASE_BIN_FILES
		"${AuthSDKPath}/Release/*.dll")
endif()

if (CMAKE_CONFIGURATION_TYPES MATCHES "Rel")
	file(GLOB D3D_BIN_FILES
		"${D3DPath}/*.dll")
endif()

if (CMAKE_CONFIGURATION_TYPES MATCHES "Rel")
  file(GLOB TBLIVE_COPYING_FILES
    "${CMAKE_SOURCE_DIR}/COPYING")
endif()

set(ALL_BASE_BIN_FILES
	${FFMPEG_BIN_FILES}
	${X264_BIN_FILES}
	${CURL_BIN_FILES}
	${SSL_BIN_FILES}
	${ZLIB_BIN_FILES}
	${LIBFDK_BIN_FILES}
	${FREETYPE_BIN_FILES}
	${D3D_BIN_FILES}
	${QT_ICU_BIN_FILES})

set(ALL_REL_BIN_FILES
	${QT_BIN_FILES}
	${PRG_RELEASE_BIN_FILES}
	${AUTH_SDK_RELEASE_BIN_FILES}
  ${TBLIVE_COPYING_FILES}
	${WIN_CRT_BIN_FILES})

set(ALL_DBG_BIN_FILES
	${QT_DEBUG_BIN_FILES}
	${PRG_DEBUG_BIN_FILES}
	${AUTH_SDK_DEBUG_BIN_FILES})

set(ALL_PLATFORM_BIN_FILES)

set(ALL_PLATFORM_REL_BIN_FILES
	${QT_PLAT_BIN_FILES})

set(ALL_PLATFORM_DBG_BIN_FILES
	${QT_DEBUG_PLAT_BIN_FILES})

foreach(list
		ALL_BASE_BIN_FILES ALL_REL_BIN_FILES ALL_DBG_BIN_FILES
		ALL_PLATFORM_BIN_FILES ALL_PLATFORM_REL_BIN_FILES ALL_PLATFORM_DBG_BIN_FILES)
	if(${list})
		list(REMOVE_DUPLICATES ${list})
	endif()
endforeach()

message(STATUS "FFmpeg files: ${FFMPEG_BIN_FILES}")
message(STATUS "x264 files: ${X264_BIN_FILES}")
message(STATUS "Libfdk files: ${LIBFDK_BIN_FILES}")
message(STATUS "Freetype files: ${FREETYPE_BIN_FILES}")
message(STATUS "curl files: ${CURL_BIN_FILES}")
message(STATUS "ssl files: ${SSL_BIN_FILES}")
message(STATUS "zlib files: ${ZLIB_BIN_FILES}")
message(STATUS "QT Debug files: ${QT_DEBUG_BIN_FILES}")
message(STATUS "QT Debug Platform files: ${QT_DEBUG_PLAT_BIN_FILES}")
message(STATUS "QT Release files: ${QT_BIN_FILES}")
message(STATUS "QT Release Platform files: ${QT_PLAT_BIN_FILES}")
message(STATUS "QT ICU files: ${QT_ICU_BIN_FILES}")
message(STATUS "Prg files: ${PRG_BIN_FILES}")

foreach(BinFile ${ALL_BASE_BIN_FILES})
	message(STATUS "copying ${BinFile} to ${CMAKE_SOURCE_DIR}/additional_install_files/exec${_bin_suffix}")
	file(COPY "${BinFile}" DESTINATION "${CMAKE_SOURCE_DIR}/additional_install_files/exec${_bin_suffix}/")
endforeach()

foreach(BinFile ${ALL_REL_BIN_FILES})
	message(STATUS "copying ${BinFile} to ${CMAKE_SOURCE_DIR}/additional_install_files/exec${_bin_suffix}r")
	file(COPY "${BinFile}" DESTINATION "${CMAKE_SOURCE_DIR}/additional_install_files/exec${_bin_suffix}r/")
endforeach()

foreach(BinFile ${ALL_DBG_BIN_FILES})
	message(STATUS "copying ${BinFile} to ${CMAKE_SOURCE_DIR}/additional_install_files/exec${_bin_suffix}d")
	file(COPY "${BinFile}" DESTINATION "${CMAKE_SOURCE_DIR}/additional_install_files/exec${_bin_suffix}d/")
endforeach()

foreach(BinFile ${ALL_PLATFORM_BIN_FILES})
	make_directory("${CMAKE_SOURCE_DIR}/additional_install_files/exec${_bin_suffix}/platforms")
	file(COPY "${BinFile}" DESTINATION "${CMAKE_SOURCE_DIR}/additional_install_files/exec${_bin_suffix}/platforms/")
endforeach()

foreach(BinFile ${ALL_PLATFORM_REL_BIN_FILES})
	make_directory("${CMAKE_SOURCE_DIR}/additional_install_files/exec${_bin_suffix}r/platforms")
	file(COPY "${BinFile}" DESTINATION "${CMAKE_SOURCE_DIR}/additional_install_files/exec${_bin_suffix}r/platforms/")
endforeach()

foreach(BinFile ${ALL_PLATFORM_DBG_BIN_FILES})
	make_directory("${CMAKE_SOURCE_DIR}/additional_install_files/exec${_bin_suffix}d/platforms")
	file(COPY "${BinFile}" DESTINATION "${CMAKE_SOURCE_DIR}/additional_install_files/exec${_bin_suffix}d/platforms/")
endforeach()

set(COPIED_DEPENDENCIES TRUE CACHE BOOL "Dependencies have been copied, set to false to copy again" FORCE)
