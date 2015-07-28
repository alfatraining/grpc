
list(APPEND grpc_plugin_support_headers
	"${grpc_SOURCE_DIR}/src/compiler/config.h"
	"${grpc_SOURCE_DIR}/src/compiler/cpp_generator.h"
	"${grpc_SOURCE_DIR}/src/compiler/cpp_generator_helpers.h"
	"${grpc_SOURCE_DIR}/src/compiler/csharp_generator.h"
	"${grpc_SOURCE_DIR}/src/compiler/csharp_generator_helpers.h"
	"${grpc_SOURCE_DIR}/src/compiler/generator_helpers.h"
	"${grpc_SOURCE_DIR}/src/compiler/objective_c_generator.h"
	"${grpc_SOURCE_DIR}/src/compiler/objective_c_generator_helpers.h"
	"${grpc_SOURCE_DIR}/src/compiler/python_generator.h"
	"${grpc_SOURCE_DIR}/src/compiler/ruby_generator.h"
	"${grpc_SOURCE_DIR}/src/compiler/ruby_generator_helpers-inl.h"
	"${grpc_SOURCE_DIR}/src/compiler/ruby_generator_map-inl.h"
	"${grpc_SOURCE_DIR}/src/compiler/ruby_generator_string-inl.h"
)

list(APPEND grpc_plugin_support_source_files
	"${grpc_SOURCE_DIR}/src/compiler/cpp_generator.cc"
	"${grpc_SOURCE_DIR}/src/compiler/csharp_generator.cc"
	"${grpc_SOURCE_DIR}/src/compiler/objective_c_generator.cc"
	"${grpc_SOURCE_DIR}/src/compiler/python_generator.cc"
	"${grpc_SOURCE_DIR}/src/compiler/ruby_generator.cc"
)

add_library(grpc_plugin_support ${grpc_plugin_support_headers} ${grpc_plugin_support_source_files})
target_link_libraries(grpc_plugin_support libprotobuf)
set_target_properties(grpc_plugin_support PROPERTIES
	COMPILE_DEFINITIONS "${compile_definitions}"
	IMPORT_PREFIX ""
	IMPORT_SUFFIX _imp${CMAKE_IMPORT_LIBRARY_SUFFIX}
	INTERFACE_INCLUDE_DIRECTORIES "$<BUILD_INTERFACE:${grpc_SOURCE_DIR}>;$<BUILD_INTERFACE:${grpc_SOURCE_DIR}/include>"
	INCLUDE_DIRECTORIES "${grpc_SOURCE_DIR};${grpc_SOURCE_DIR}/include"
	PREFIX "")

set_property(TARGET grpc_plugin_support PROPERTY FOLDER plugins)
# install(TARGETS grpc_plugin_support
#     EXPORT ${CMAKE_PROJECT_NAME}Config
#     LIBRARY DESTINATION lib COMPONENT dev
#     ARCHIVE DESTINATION lib COMPONENT dev
#     RUNTIME DESTINATION bin COMPONENT bin)
