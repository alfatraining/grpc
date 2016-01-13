
if(UNIX)
	find_package(Threads)
	set(additional_libraries ${CMAKE_THREAD_LIBS_INIT})
endif()

add_library(gpr ${filegroup_gpr})
target_link_libraries(gpr ${additional_libraries})
set_target_properties(gpr PROPERTIES
	COMPILE_DEFINITIONS "${compile_definitions}"
	IMPORT_PREFIX ""
	IMPORT_SUFFIX _imp${CMAKE_IMPORT_LIBRARY_SUFFIX}
	INTERFACE_INCLUDE_DIRECTORIES "$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}>;$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>;$<INSTALL_INTERFACE:include>"
	INCLUDE_DIRECTORIES "${CMAKE_SOURCE_DIR};${CMAKE_SOURCE_DIR}/include"
	PREFIX "")

install(TARGETS gpr
	EXPORT ${CMAKE_PROJECT_NAME}Config
	LIBRARY DESTINATION lib COMPONENT dev
	ARCHIVE DESTINATION lib COMPONENT dev
	RUNTIME DESTINATION bin COMPONENT bin)
