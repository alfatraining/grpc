
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

list(APPEND inc_dirs
	"${CMAKE_BINARY_DIR}")

# =========================== helpful macros ===========================

macro(add_library_with_proto libname sources)
	set(_proto_files "")
	set(_protogen_files "")
	foreach(src ${sources})
		get_filename_component(src_ext ${src} EXT)
		if ("${src_ext}" STREQUAL ".proto")
			get_filename_component(src_base_dir ${src} DIRECTORY)
			get_filename_component(src_filename_we ${src} NAME_WE)
			file(RELATIVE_PATH _relative_filename ${grpc_SOURCE_DIR} "${src_base_dir}/${src_filename_we}")
			list(APPEND _proto_files ${src})
			list(APPEND _protogen_files
				"${CMAKE_BINARY_DIR}/${_relative_filename}.grpc.pb.cc"
				"${CMAKE_BINARY_DIR}/${_relative_filename}.pb.cc"
				"${CMAKE_BINARY_DIR}/${_relative_filename}.grpc.pb.h"
				"${CMAKE_BINARY_DIR}/${_relative_filename}.pb.h")
		endif()
	endforeach()

	set_source_files_properties(${_protogen_files} PROPERTIES GENERATED TRUE)
	add_library(${libname} ${sources} ${_protogen_files})
	target_link_libraries(${libname} libprotobuf)

	# turn off warnings for protobuf generated files
	if(MSVC)
		set_source_files_properties(${_protogen_files} PROPERTIES COMPILE_FLAGS "/wd4267 /wd4244 /wd4996 /wd4800")
	endif()

	foreach(protofile ${_proto_files})
		get_filename_component(base_dir ${protofile} DIRECTORY)
		get_filename_component(protofile_name ${protofile} NAME)
		# message(STATUS "protofile: ${protofile} - ${base_dir}")
		add_custom_command(TARGET ${libname} PRE_BUILD
			COMMAND "$<TARGET_FILE:protoc>" --grpc_out="${CMAKE_BINARY_DIR}" --cpp_out="${CMAKE_BINARY_DIR}" --proto_path="${grpc_SOURCE_DIR}" --plugin=protoc-gen-grpc="$<TARGET_FILE:grpc_cpp_plugin>" "${protofile}"
			COMMAND echo Compiling ${protofile_name})
	endforeach()
endmacro()

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
	# INCLUDE_DIRECTORIES "${grpc_SOURCE_DIR};${grpc_SOURCE_DIR}/include"
	PREFIX "")

set_property(TARGET gpr_test_util PROPERTY FOLDER tests)

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
	# INCLUDE_DIRECTORIES "${grpc_SOURCE_DIR};${grpc_SOURCE_DIR}/include"
	PREFIX "")

set_property(TARGET grpc_test_util PROPERTY FOLDER tests)

# ============================== grpc++_test_util ==============================

list(APPEND grpcpp_test_util_sources
	"${grpc_SOURCE_DIR}/test/cpp/util/cli_call.h"
	"${grpc_SOURCE_DIR}/test/cpp/util/create_test_channel.h"
	"${grpc_SOURCE_DIR}/test/cpp/util/string_ref_helper.h"
	"${grpc_SOURCE_DIR}/test/cpp/util/subprocess.h"
	"${grpc_SOURCE_DIR}/test/cpp/util/messages.proto"
	"${grpc_SOURCE_DIR}/test/cpp/util/echo.proto"
	"${grpc_SOURCE_DIR}/test/cpp/util/echo_duplicate.proto"
	"${grpc_SOURCE_DIR}/test/cpp/util/cli_call.cc"
	"${grpc_SOURCE_DIR}/test/cpp/util/create_test_channel.cc"
	"${grpc_SOURCE_DIR}/test/cpp/util/string_ref_helper.cc"
	"${grpc_SOURCE_DIR}/test/cpp/util/subprocess.cc"
	)

add_library_with_proto(grpcpp_test_util "${grpcpp_test_util_sources}")
target_link_libraries(grpcpp_test_util grpc grpc_test_util gpr_test_util)
set_target_properties(grpcpp_test_util PROPERTIES
	COMPILE_DEFINITIONS "${compile_definitions}"
	INCLUDE_DIRECTORIES "${inc_dirs}"
	COMPILE_FLAGS "${additional_compile_flags}"
	IMPORT_PREFIX ""
	IMPORT_SUFFIX _imp${CMAKE_IMPORT_LIBRARY_SUFFIX}
	INTERFACE_INCLUDE_DIRECTORIES "$<BUILD_INTERFACE:${inc_dirs}>;$<BUILD_INTERFACE:${grpc_SOURCE_DIR}/include>"
	PREFIX "")

set_property(TARGET grpcpp_test_util PROPERTY FOLDER tests)

# ============================== grpc++_test_config ==============================

# requires gflags

# list(APPEND grpcpp_test_config_sources
# 	"${grpc_SOURCE_DIR}/test/cpp/util/test_config.h"
# 	"${grpc_SOURCE_DIR}/test/cpp/util/test_config.cc"
# 	)

# add_library(grpcpp_test_config ${grpcpp_test_config_sources})
# target_link_libraries(grpcpp_test_config grpc grpc_test_util gpr_test_util)
# set_target_properties(grpcpp_test_config PROPERTIES
# 	COMPILE_DEFINITIONS "${compile_definitions}"
# 	INCLUDE_DIRECTORIES "${inc_dirs}"
# 	COMPILE_FLAGS "${additional_compile_flags}"
# 	IMPORT_PREFIX ""
# 	IMPORT_SUFFIX _imp${CMAKE_IMPORT_LIBRARY_SUFFIX}
# 	INTERFACE_INCLUDE_DIRECTORIES "$<BUILD_INTERFACE:${grpc_SOURCE_DIR}>;$<BUILD_INTERFACE:${grpc_SOURCE_DIR}/include>"
# 	# INCLUDE_DIRECTORIES "${grpc_SOURCE_DIR};${grpc_SOURCE_DIR}/include"
# 	PREFIX "")

# set_property(TARGET grpcpp_test_config PROPERTY FOLDER tests)
