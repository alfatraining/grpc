cmake_minimum_required(VERSION 3.0)

project(grpc VERSION 0.10.0)

# debug libraries can coexist with release libraries, so make debug names different
set(CMAKE_DEBUG_POSTFIX "d")
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER "cmake")

option(BUILD_SHARED_LIBS "Build Shared Libraries" OFF)
option(BUILD_TESTS "Build tests" ON)
option(ENABLE_ALPN "Enable ALPN" ON)
if(MSVC)
	OPTION(MSVC_LINK_STATIC_RUNTIME "Link with msvc static runtime" OFF)
endif()

if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang")
	set(CMAKE_CXX_FLAGS "-std=c++11 -Wno-c++11-extensions ${CMAKE_CXX_FLAGS}")
endif()

if(${CMAKE_CXX_COMPILER_ID} MATCHES "GNU")
	set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")
endif()

if(BUILD_TESTS)
	enable_testing()
endif()

# statically link msvc runtime
if(MSVC AND MSVC_LINK_STATIC_RUNTIME)
	message(STATUS "Linking runtime statically")
	foreach(flag_var
		CMAKE_C_FLAGS CMAKE_C_FLAGS_DEBUG CMAKE_C_FLAGS_RELEASE
		CMAKE_C_FLAGS_MINSIZEREL CMAKE_C_FLAGS_RELWITHDEBINFO
		CMAKE_CXX_FLAGS CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_RELEASE
		CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELWITHDEBINFO)

		if(${flag_var} MATCHES "/MD")
			string(REGEX REPLACE "/MD" "/MT" ${flag_var} "${${flag_var}}")
		endif(${flag_var} MATCHES "/MD")
	endforeach(flag_var)
endif()

find_package(openssl REQUIRED CONFIG)
find_package(zlib REQUIRED CONFIG)
find_package(protobuf REQUIRED CONFIG)

########

if ("${CMAKE_SIZEOF_VOID_P}" STREQUAL "4")
	list(APPEND compile_definitions
		"_USE_32BIT_TIME_T")
endif()

if(MSVC)
	list(APPEND compile_definitions
		_CRT_SECURE_NO_WARNINGS)
	list(APPEND compile_definitions
		_WIN32_WINNT=0x600) # windows vista
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /wd4244 /wd4267")
endif()

include(cmake/cmake_filegroups.cmake)

add_subdirectory(cmake/gpr)
add_subdirectory(cmake/grpc)
add_subdirectory(cmake/grpc++)

if(BUILD_TESTS)
	add_subdirectory(cmake/test_libs)
	add_subdirectory(cmake/tests)
endif()

add_subdirectory(cmake/grpc_plugin_support)
add_subdirectory(cmake/grpc_plugins/cpp)
add_subdirectory(cmake/grpc_plugins/csharp)
add_subdirectory(cmake/grpc_plugins/python)
add_subdirectory(cmake/grpc_plugins/objective_c)
add_subdirectory(cmake/grpc_plugins/ruby)

install(DIRECTORY "include/"
	DESTINATION "include" COMPONENT dev
	FILES_MATCHING
	PATTERN "*.h")

install(EXPORT ${CMAKE_PROJECT_NAME}Config
	DESTINATION lib/cmake)
