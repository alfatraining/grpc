
list(APPEND grpc_cpp_plugin_headers
)

list(APPEND grpc_cpp_plugin_source_files
	"${grpc_SOURCE_DIR}/src/compiler/cpp_plugin.cc"
)

add_executable(grpc_cpp_plugin ${grpc_cpp_plugin_headers} ${grpc_cpp_plugin_source_files})
target_link_libraries(grpc_cpp_plugin grpc_plugin_support libprotoc)

set_target_properties(grpc_cpp_plugin PROPERTIES
	COMPILE_DEFINITIONS "${compile_definitions}"
	INCLUDE_DIRECTORIES "${grpc_SOURCE_DIR};${grpc_SOURCE_DIR}/include")

set_property(TARGET grpc_cpp_plugin PROPERTY FOLDER plugins)

install(TARGETS grpc_cpp_plugin
    EXPORT ${CMAKE_PROJECT_NAME}Config
    LIBRARY DESTINATION lib COMPONENT dev
    ARCHIVE DESTINATION lib COMPONENT dev
    RUNTIME DESTINATION bin COMPONENT bin)
