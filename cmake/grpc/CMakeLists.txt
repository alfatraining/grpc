
list(APPEND grpc_public_headers
    "${CMAKE_SOURCE_DIR}/include/grpc/grpc_security.h"
	)

list(APPEND grpc_private_headers
    "${CMAKE_SOURCE_DIR}/src/core/security/auth_filters.h"
    "${CMAKE_SOURCE_DIR}/src/core/security/base64.h"
    "${CMAKE_SOURCE_DIR}/src/core/security/credentials.h"
    "${CMAKE_SOURCE_DIR}/src/core/security/handshake.h"
    "${CMAKE_SOURCE_DIR}/src/core/security/json_token.h"
    "${CMAKE_SOURCE_DIR}/src/core/security/jwt_verifier.h"
    "${CMAKE_SOURCE_DIR}/src/core/security/secure_endpoint.h"
    "${CMAKE_SOURCE_DIR}/src/core/security/security_connector.h"
    "${CMAKE_SOURCE_DIR}/src/core/security/security_context.h"
    "${CMAKE_SOURCE_DIR}/src/core/tsi/fake_transport_security.h"
    "${CMAKE_SOURCE_DIR}/src/core/tsi/ssl_transport_security.h"
    "${CMAKE_SOURCE_DIR}/src/core/tsi/transport_security.h"
    "${CMAKE_SOURCE_DIR}/src/core/tsi/transport_security_interface.h"
    )

list(APPEND grpc_source_files
    "${CMAKE_SOURCE_DIR}/src/core/httpcli/httpcli_security_connector.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/base64.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/client_auth_filter.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/credentials.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/credentials_metadata.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/credentials_posix.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/credentials_win32.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/google_default_credentials.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/handshake.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/json_token.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/jwt_verifier.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/secure_endpoint.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/security_connector.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/security_context.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/server_auth_filter.c"
    "${CMAKE_SOURCE_DIR}/src/core/security/server_secure_chttp2.c"
    "${CMAKE_SOURCE_DIR}/src/core/surface/init_secure.c"
    "${CMAKE_SOURCE_DIR}/src/core/surface/secure_channel_create.c"
    "${CMAKE_SOURCE_DIR}/src/core/tsi/fake_transport_security.c"
    "${CMAKE_SOURCE_DIR}/src/core/tsi/ssl_transport_security.c"
    "${CMAKE_SOURCE_DIR}/src/core/tsi/transport_security.c"
    )

if(MSVC)
	list(APPEND compile_definitions
		_WINSOCK_DEPRECATED_NO_WARNINGS)
	list(APPEND additional_compile_flags
		"/wd4267 /wd4244 /wd4090")
endif()

if(NOT ENABLE_ALPN)
    list(APPEND compile_definitions
        TSI_OPENSSL_ALPN_SUPPORT=0)
endif()

list(APPEND inc_dirs
	"${grpc_SOURCE_DIR}"
	"${grpc_SOURCE_DIR}/include")

if(WIN32)
	list(APPEND additional_libs
		"ws2_32.lib")
endif()

if(UNIX)
    list(APPEND additional_libs
        "dl")
endif()

add_library(grpc ${grpc_public_headers} ${grpc_private_headers} ${grpc_source_files} ${filegroup_grpc_base} ${filegroup_census})
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
