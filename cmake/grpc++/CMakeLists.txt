
if(MSVC)
	list(APPEND additional_compile_flags
		"/wd4800")
endif()

list(APPEND inc_dirs
	"${grpc_SOURCE_DIR}"
	"${grpc_SOURCE_DIR}/include")

add_library(grpc++ ${filegroup_grpcpp})
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
