
if(MSVC)
	list(APPEND additional_compile_flags
		"/wd4244")
endif()

if ("${CMAKE_SIZEOF_VOID_P}" STREQUAL "4")
	list(APPEND compile_definitions
		"_USE_32BIT_TIME_T")
endif()

if(MSVC)
	list(APPEND compile_definitions
		_CRT_SECURE_NO_WARNINGS)
endif()

# ============================== gpr_test_util ==============================

list(APPEND gpr_test_util_private_headers
	"${grpc_SOURCE_DIR}/test/core/util/test_config.h")

list(APPEND gpr_test_util_source_files
	"${grpc_SOURCE_DIR}/test/core/util/test_config.c")

add_library(gpr_test_util ${gpr_test_util_private_headers} ${gpr_test_util_source_files})
target_link_libraries(gpr_test_util gpr grpc)
set_target_properties(gpr_test_util PROPERTIES
	COMPILE_DEFINITIONS "${compile_definitions}"
	INCLUDE_DIRECTORIES "${inc_dirs}"
    IMPORT_PREFIX ""
    IMPORT_SUFFIX _imp${CMAKE_IMPORT_LIBRARY_SUFFIX}
    INTERFACE_INCLUDE_DIRECTORIES "$<BUILD_INTERFACE:${grpc_SOURCE_DIR}>;$<BUILD_INTERFACE:${grpc_SOURCE_DIR}/include>"
    INCLUDE_DIRECTORIES "${grpc_SOURCE_DIR};${grpc_SOURCE_DIR}/include"
    PREFIX "")


# ============================== grpc_test_util ==============================

list(APPEND grpc_test_util_private_headers
	"${grpc_SOURCE_DIR}/test/core/end2end/data/ssl_test_data.h"
    "${grpc_SOURCE_DIR}/test/core/end2end/cq_verifier.h"
    "${grpc_SOURCE_DIR}/test/core/iomgr/endpoint_tests.h"
    "${grpc_SOURCE_DIR}/test/core/security/oauth2_utils.h"
    "${grpc_SOURCE_DIR}/test/core/util/grpc_profiler.h"
    "${grpc_SOURCE_DIR}/test/core/util/parse_hexstring.h"
    "${grpc_SOURCE_DIR}/test/core/util/port.h"
    "${grpc_SOURCE_DIR}/test/core/util/slice_splitter.h")

list(APPEND grpc_test_util_source_files
    "${grpc_SOURCE_DIR}/test/core/end2end/data/server1_cert.c"
    "${grpc_SOURCE_DIR}/test/core/end2end/data/server1_key.c"
    "${grpc_SOURCE_DIR}/test/core/end2end/data/test_root_cert.c"
    "${grpc_SOURCE_DIR}/test/core/end2end/cq_verifier.c"
    "${grpc_SOURCE_DIR}/test/core/iomgr/endpoint_tests.c"
    "${grpc_SOURCE_DIR}/test/core/security/oauth2_utils.c"
    "${grpc_SOURCE_DIR}/test/core/util/grpc_profiler.c"
    "${grpc_SOURCE_DIR}/test/core/util/parse_hexstring.c"
    "${grpc_SOURCE_DIR}/test/core/util/port_posix.c"
    "${grpc_SOURCE_DIR}/test/core/util/port_windows.c"
    "${grpc_SOURCE_DIR}/test/core/util/slice_splitter.c")

add_library(grpc_test_util ${grpc_test_util_private_headers} ${grpc_test_util_source_files})
target_link_libraries(grpc_test_util gpr_test_util)
set_target_properties(grpc_test_util PROPERTIES
	COMPILE_DEFINITIONS "${compile_definitions}"
	INCLUDE_DIRECTORIES "${inc_dirs}"
	COMPILE_FLAGS "${additional_compile_flags}"
    IMPORT_PREFIX ""
    IMPORT_SUFFIX _imp${CMAKE_IMPORT_LIBRARY_SUFFIX}
    INTERFACE_INCLUDE_DIRECTORIES "$<BUILD_INTERFACE:${grpc_SOURCE_DIR}>;$<BUILD_INTERFACE:${grpc_SOURCE_DIR}/include>"
    INCLUDE_DIRECTORIES "${grpc_SOURCE_DIR};${grpc_SOURCE_DIR}/include"
    PREFIX "")
