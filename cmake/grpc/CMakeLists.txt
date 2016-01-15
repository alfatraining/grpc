
if(MSVC)
	list(APPEND compile_definitions
		_WINSOCK_DEPRECATED_NO_WARNINGS)
	list(APPEND additional_compile_flags
		"/wd4267 /wd4244 /wd4090")
endif()

if(GRPC_DISABLE_OPENSSL_ALPN)
    list(APPEND compile_definitions
        TSI_OPENSSL_ALPN_SUPPORT=0)
endif()

list(APPEND inc_dirs
	"${CMAKE_SOURCE_DIR}"
	"${CMAKE_SOURCE_DIR}/include")

if(WIN32)
	list(APPEND additional_libs
		"ws2_32.lib")
endif()

if(UNIX)
    list(APPEND additional_libs
        "dl")
endif()

add_library(grpc ${filegroup_grpc})
target_link_libraries(grpc gpr ssleay32 libeay32 zlib ${additional_libs})
set_target_properties(grpc PROPERTIES
	COMPILE_DEFINITIONS "${compile_definitions}"
	COMPILE_FLAGS "${additional_compile_flags}"
	INCLUDE_DIRECTORIES "${inc_dirs}")

install(TARGETS grpc
    EXPORT ${CMAKE_PROJECT_NAME}Config
    LIBRARY DESTINATION lib COMPONENT dev
    ARCHIVE DESTINATION lib COMPONENT dev
    RUNTIME DESTINATION bin COMPONENT bin)
