
list(APPEND grpcpp_private_headers
	"${CMAKE_SOURCE_DIR}/src/cpp/client/secure_credentials.h"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/secure_auth_context.h"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/secure_server_credentials.h"
)

list(APPEND grpcpp_source_files
	"${CMAKE_SOURCE_DIR}/src/cpp/client/secure_credentials.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/auth_property_iterator.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/secure_auth_context.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/secure_channel_arguments.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/secure_create_auth_context.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/secure_server_credentials.cc"
)

if(MSVC)
	list(APPEND additional_compile_flags
		"/wd4800")
endif()

list(APPEND inc_dirs
	"${grpc_SOURCE_DIR}"
	"${grpc_SOURCE_DIR}/include")

add_library(grpc++ ${grpcpp_source_files} ${grpcpp_private_headers} ${filegroup_grpcpp_base})
target_link_libraries(grpc++ grpc libprotobuf ${additional_libs})
set_target_properties(grpc++ PROPERTIES
	COMPILE_DEFINITIONS "${compile_definitions}"
	COMPILE_FLAGS "${additional_compile_flags}"
	INCLUDE_DIRECTORIES "${inc_dirs}")

install(TARGETS grpc++
	EXPORT ${CMAKE_PROJECT_NAME}Config
	LIBRARY DESTINATION lib COMPONENT dev
	ARCHIVE DESTINATION lib COMPONENT dev
	RUNTIME DESTINATION bin COMPONENT bin)
