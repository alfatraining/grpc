
list(APPEND gpr_public_headers
	"${CMAKE_SOURCE_DIR}/include/grpc/support/alloc.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/atm.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/atm_gcc_atomic.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/atm_gcc_sync.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/atm_win32.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/avl.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/cmdline.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/cpu.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/histogram.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/host_port.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/log.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/log_win32.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/port_platform.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/slice.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/slice_buffer.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/string_util.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/subprocess.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/sync.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/sync_generic.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/sync_posix.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/sync_win32.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/thd.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/time.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/tls.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/tls_gcc.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/tls_msvc.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/tls_pthread.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/support/useful.h"
	)

list(APPEND gpr_private_headers
	"${CMAKE_SOURCE_DIR}/src/core/profiling/timers.h"
	"${CMAKE_SOURCE_DIR}/src/core/support/block_annotate.h"
	"${CMAKE_SOURCE_DIR}/src/core/support/env.h"
	"${CMAKE_SOURCE_DIR}/src/core/support/file.h"
	"${CMAKE_SOURCE_DIR}/src/core/support/murmur_hash.h"
	"${CMAKE_SOURCE_DIR}/src/core/support/stack_lockfree.h"
	"${CMAKE_SOURCE_DIR}/src/core/support/string.h"
	"${CMAKE_SOURCE_DIR}/src/core/support/string_win32.h"
	"${CMAKE_SOURCE_DIR}/src/core/support/thd_internal.h"
	"${CMAKE_SOURCE_DIR}/src/core/support/time_precise.h"
	)

list(APPEND gpr_srcs
	"${CMAKE_SOURCE_DIR}/src/core/profiling/basic_timers.c"
	"${CMAKE_SOURCE_DIR}/src/core/profiling/stap_timers.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/alloc.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/avl.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/cmdline.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/cpu_iphone.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/cpu_linux.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/cpu_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/cpu_windows.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/env_linux.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/env_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/env_win32.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/file.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/file_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/file_win32.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/histogram.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/host_port.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/log.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/log_android.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/log_linux.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/log_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/log_win32.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/murmur_hash.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/slice.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/slice_buffer.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/stack_lockfree.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/string.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/string_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/string_win32.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/subprocess_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/sync.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/sync_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/sync_win32.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/thd.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/thd_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/thd_win32.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/time.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/time_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/time_precise.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/time_win32.c"
	"${CMAKE_SOURCE_DIR}/src/core/support/tls_pthread.c"
	)

if(UNIX)
	find_package(Threads)
	set(additional_libraries ${CMAKE_THREAD_LIBS_INIT})
endif()

add_library(gpr ${gpr_public_headers} ${gpr_private_headers} ${gpr_srcs})
target_link_libraries(gpr ${additional_libraries})
set_target_properties(gpr PROPERTIES
	COMPILE_DEFINITIONS "${compile_definitions}"
	IMPORT_PREFIX ""
	IMPORT_SUFFIX _imp${CMAKE_IMPORT_LIBRARY_SUFFIX}
	INTERFACE_INCLUDE_DIRECTORIES "$<BUILD_INTERFACE:${grpc_SOURCE_DIR}>;$<BUILD_INTERFACE:${grpc_SOURCE_DIR}/include>;$<INSTALL_INTERFACE:include>"
	INCLUDE_DIRECTORIES "${grpc_SOURCE_DIR};${grpc_SOURCE_DIR}/include"
	PREFIX "")

install(TARGETS gpr
	EXPORT ${CMAKE_PROJECT_NAME}Config
	LIBRARY DESTINATION lib COMPONENT dev
	ARCHIVE DESTINATION lib COMPONENT dev
	RUNTIME DESTINATION bin COMPONENT bin)
