# if(MSVC)
# 	add_definitions("_CRT_SECURE_NO_WARNINGS")
# endif()

function(grpc_test test_name test_files)
	add_executable(${test_name} ${test_files})
	set_target_properties(${test_name} PROPERTIES
		COMPILE_DEFINITIONS "${compile_definitions}")
	target_link_libraries(${test_name} grpc_test_util)

	add_test(NAME ${test_name}
		COMMAND ${test_name}
		WORKING_DIRECTORY ${grpc_SOURCE_DIR})
	
	# message(STATUS "Set working dir to ${grpc_SOURCE_DIR}")

	set_property(TARGET ${test_name} PROPERTY FOLDER tests)
endfunction()

function(grpc_util util_name util_file)
	add_executable(${util_name} ${util_file})
	set_target_properties(${util_name} PROPERTIES
		COMPILE_DEFINITIONS "${compile_definitions}")
	target_link_libraries(${util_name} grpc_test_util)

	set_property(TARGET ${util_name} PROPERTY FOLDER tests/utils)
endfunction()

grpc_util(fling_client "${grpc_SOURCE_DIR}/test/core/fling/client.c")
grpc_util(fling_server "${grpc_SOURCE_DIR}/test/core/fling/server.c")
grpc_util(gen_hpack_tables "${grpc_SOURCE_DIR}/tools/codegen/core/gen_hpack_tables.c")
grpc_util(grpc_create_jwt "${grpc_SOURCE_DIR}/test/core/security/create_jwt.c")
grpc_util(grpc_fetch_oauth2 "${grpc_SOURCE_DIR}/test/core/security/fetch_oauth2.c")
grpc_util(grpc_print_google_default_creds_token "${grpc_SOURCE_DIR}/test/core/security/print_google_default_creds_token.c")
grpc_util(grpc_verify_jwt "${grpc_SOURCE_DIR}/test/core/security/verify_jwt.c")
grpc_util(json_rewrite "${grpc_SOURCE_DIR}/test/core/json/json_rewrite.c")

if(NOT WIN32)
	grpc_util(low_level_ping_pong_benchmark "${grpc_SOURCE_DIR}/test/core/network_benchmarks/low_level_ping_pong.c")
endif()

# grpc_test(alarm_test "${grpc_SOURCE_DIR}/test/core/iomgr/alarm_test.c")
# grpc_test(alarm_heap_test "${grpc_SOURCE_DIR}/test/core/iomgr/alarm_heap_test.c")
# grpc_test(alarm_list_test "${grpc_SOURCE_DIR}/test/core/iomgr/alarm_list_test.c")
grpc_test(alpn_test "${grpc_SOURCE_DIR}/test/core/transport/chttp2/alpn_test.c")
grpc_test(bin_encoder_test "${grpc_SOURCE_DIR}/test/core/transport/chttp2/bin_encoder_test.c")
grpc_test(chttp2_status_conversion_test "${grpc_SOURCE_DIR}/test/core/transport/chttp2/status_conversion_test.c")
# grpc_test(chttp2_stream_encoder_test "${grpc_SOURCE_DIR}/test/core/transport/chttp2/stream_encoder_test.c")
grpc_test(chttp2_stream_map_test "${grpc_SOURCE_DIR}/test/core/transport/chttp2/stream_map_test.c")
# grpc_test(gpr_cancellable_test "${grpc_SOURCE_DIR}/test/core/support/cancellable_test.c")
grpc_test(gpr_cmdline_test "${grpc_SOURCE_DIR}/test/core/support/cmdline_test.c")
grpc_test(gpr_env_test "${grpc_SOURCE_DIR}/test/core/support/env_test.c")
grpc_test(gpr_file_test "${grpc_SOURCE_DIR}/test/core/support/file_test.c")
grpc_test(gpr_histogram_test "${grpc_SOURCE_DIR}/test/core/support/histogram_test.c")
grpc_test(gpr_host_port_test "${grpc_SOURCE_DIR}/test/core/support/host_port_test.c")
grpc_test(gpr_log_test "${grpc_SOURCE_DIR}/test/core/support/log_test.c")
grpc_test(gpr_slice_buffer_test "${grpc_SOURCE_DIR}/test/core/support/slice_buffer_test.c")
grpc_test(gpr_slice_test "${grpc_SOURCE_DIR}/test/core/support/slice_test.c")
grpc_test(gpr_stack_lockfree_test "${grpc_SOURCE_DIR}/test/core/support/stack_lockfree_test.c")
grpc_test(gpr_string_test "${grpc_SOURCE_DIR}/test/core/support/string_test.c")
grpc_test(gpr_sync_test "${grpc_SOURCE_DIR}/test/core/support/sync_test.c")
grpc_test(gpr_thd_test "${grpc_SOURCE_DIR}/test/core/support/thd_test.c")
grpc_test(gpr_time_test "${grpc_SOURCE_DIR}/test/core/support/time_test.c")
grpc_test(gpr_tls_test "${grpc_SOURCE_DIR}/test/core/support/tls_test.c")
grpc_test(gpr_useful_test "${grpc_SOURCE_DIR}/test/core/support/useful_test.c")
grpc_test(grpc_auth_context_test "${grpc_SOURCE_DIR}/test/core/security/auth_context_test.c")
grpc_test(grpc_base64_test "${grpc_SOURCE_DIR}/test/core/security/base64_test.c")
grpc_test(grpc_byte_buffer_reader_test "${grpc_SOURCE_DIR}/test/core/surface/byte_buffer_reader_test.c")
grpc_test(grpc_channel_stack_test "${grpc_SOURCE_DIR}/test/core/channel/channel_stack_test.c")

# not quite working
# grpc_test(grpc_completion_queue_test "${grpc_SOURCE_DIR}/test/core/surface/completion_queue_test.c")

grpc_test(grpc_credentials_test "${grpc_SOURCE_DIR}/test/core/security/credentials_test.c")
grpc_test(grpc_json_token_test "${grpc_SOURCE_DIR}/test/core/security/json_token_test.c")
grpc_test(grpc_jwt_verifier_test "${grpc_SOURCE_DIR}/test/core/security/jwt_verifier_test.c")

grpc_test(grpc_security_connector_test "${grpc_SOURCE_DIR}/test/core/security/security_connector_test.c")
# grpc_test(grpc_stream_op_test "${grpc_SOURCE_DIR}/test/core/transport/stream_op_test.c")
grpc_test(hpack_parser_test "${grpc_SOURCE_DIR}/test/core/transport/chttp2/hpack_parser_test.c")
grpc_test(hpack_table_test "${grpc_SOURCE_DIR}/test/core/transport/chttp2/hpack_table_test.c")
grpc_test(httpcli_format_request_test "${grpc_SOURCE_DIR}/test/core/httpcli/format_request_test.c")
grpc_test(httpcli_parser_test "${grpc_SOURCE_DIR}/test/core/httpcli/parser_test.c")
grpc_test(json_rewrite_test "${grpc_SOURCE_DIR}/test/core/json/json_rewrite_test.c")
grpc_test(json_test "${grpc_SOURCE_DIR}/test/core/json/json_test.c")
grpc_test(lame_client_test "${grpc_SOURCE_DIR}/test/core/surface/lame_client_test.c")
grpc_test(message_compress_test "${grpc_SOURCE_DIR}/test/core/compression/message_compress_test.c")
# grpc_test(multi_init_test "${grpc_SOURCE_DIR}/test/core/surface/multi_init_test.c")
grpc_test(multiple_server_queues_test "${grpc_SOURCE_DIR}/test/core/end2end/multiple_server_queues_test.c")
grpc_test(murmur_hash_test "${grpc_SOURCE_DIR}/test/core/support/murmur_hash_test.c")
# grpc_test(no_server_test "${grpc_SOURCE_DIR}/test/core/end2end/no_server_test.c")
grpc_test(resolve_address_test "${grpc_SOURCE_DIR}/test/core/iomgr/resolve_address_test.c")
grpc_test(sockaddr_utils_test "${grpc_SOURCE_DIR}/test/core/iomgr/sockaddr_utils_test.c")

# GOOD GOD!!! Too many tests

# secure_endpoint_test.exe: build_libs $(OUT_DIR)
# 	echo Building secure_endpoint_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/test/core/security/secure_endpoint_test.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/secure_endpoint_test.exe" Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/secure_endpoint_test.obj
# secure_endpoint_test: secure_endpoint_test.exe
# 	echo Running secure_endpoint_test
# 	$(OUT_DIR)/secure_endpoint_test.exe
# sockaddr_utils_test: sockaddr_utils_test.exe
# 	echo Running sockaddr_utils_test
# 	$(OUT_DIR)/sockaddr_utils_test.exe
# time_averaged_stats_test.exe: build_libs $(OUT_DIR)
# 	echo Building time_averaged_stats_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/test/core/iomgr/time_averaged_stats_test.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/time_averaged_stats_test.exe" Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/time_averaged_stats_test.obj
# time_averaged_stats_test: time_averaged_stats_test.exe
# 	echo Running time_averaged_stats_test
# 	$(OUT_DIR)/time_averaged_stats_test.exe
# timeout_encoding_test.exe: build_libs $(OUT_DIR)
# 	echo Building timeout_encoding_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/test/core/transport/chttp2/timeout_encoding_test.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/timeout_encoding_test.exe" Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/timeout_encoding_test.obj
# timeout_encoding_test: timeout_encoding_test.exe
# 	echo Running timeout_encoding_test
# 	$(OUT_DIR)/timeout_encoding_test.exe
# timers_test.exe: build_libs $(OUT_DIR)
# 	echo Building timers_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/test/core/profiling/timers_test.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/timers_test.exe" Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/timers_test.obj
# timers_test: timers_test.exe
# 	echo Running timers_test
# 	$(OUT_DIR)/timers_test.exe
# transport_metadata_test.exe: build_libs $(OUT_DIR)
# 	echo Building transport_metadata_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/test/core/transport/metadata_test.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/transport_metadata_test.exe" Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/metadata_test.obj
# transport_metadata_test: transport_metadata_test.exe
# 	echo Running transport_metadata_test
# 	$(OUT_DIR)/transport_metadata_test.exe
# transport_security_test.exe: build_libs $(OUT_DIR)
# 	echo Building transport_security_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/test/core/tsi/transport_security_test.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/transport_security_test.exe" Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/transport_security_test.obj
# transport_security_test: transport_security_test.exe
# 	echo Running transport_security_test
# 	$(OUT_DIR)/transport_security_test.exe
# uri_parser_test.exe: build_libs $(OUT_DIR)
# 	echo Building uri_parser_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/test/core/client_config/uri_parser_test.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/uri_parser_test.exe" Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/uri_parser_test.obj
# uri_parser_test: uri_parser_test.exe
# 	echo Running uri_parser_test
# 	$(OUT_DIR)/uri_parser_test.exe
# interop_client.exe: build_libs $(OUT_DIR)
# 	echo Building interop_client
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/interop_client.exe" Debug/interop_client_main.lib Debug/interop_client_helper.lib Debug/grpc++_test_util.lib Debug/grpc_test_util.lib Debug/grpc++.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib Debug/grpc++_test_config.lib $(LIBS) $(OUT_DIR)/dummy.obj
# interop_client: interop_client.exe
# 	echo Running interop_client
# 	$(OUT_DIR)/interop_client.exe
# interop_server.exe: build_libs $(OUT_DIR)
# 	echo Building interop_server
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/interop_server.exe" Debug/interop_server_main.lib Debug/interop_server_helper.lib Debug/grpc++_test_util.lib Debug/grpc_test_util.lib Debug/grpc++.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib Debug/grpc++_test_config.lib $(LIBS) $(OUT_DIR)/dummy.obj
# interop_server: interop_server.exe
# 	echo Running interop_server
# 	$(OUT_DIR)/interop_server.exe
# chttp2_fake_security_bad_hostname_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_bad_hostname_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_bad_hostname_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_bad_hostname.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_bad_hostname_test: chttp2_fake_security_bad_hostname_test.exe
# 	echo Running chttp2_fake_security_bad_hostname_test
# 	$(OUT_DIR)/chttp2_fake_security_bad_hostname_test.exe
# chttp2_fake_security_cancel_after_accept_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_cancel_after_accept_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_cancel_after_accept_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_cancel_after_accept.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_cancel_after_accept_test: chttp2_fake_security_cancel_after_accept_test.exe
# 	echo Running chttp2_fake_security_cancel_after_accept_test
# 	$(OUT_DIR)/chttp2_fake_security_cancel_after_accept_test.exe
# chttp2_fake_security_cancel_after_accept_and_writes_closed_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_cancel_after_accept_and_writes_closed_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_cancel_after_accept_and_writes_closed_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_cancel_after_accept_and_writes_closed_test: chttp2_fake_security_cancel_after_accept_and_writes_closed_test.exe
# 	echo Running chttp2_fake_security_cancel_after_accept_and_writes_closed_test
# 	$(OUT_DIR)/chttp2_fake_security_cancel_after_accept_and_writes_closed_test.exe
# chttp2_fake_security_cancel_after_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_cancel_after_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_cancel_after_invoke_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_cancel_after_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_cancel_after_invoke_test: chttp2_fake_security_cancel_after_invoke_test.exe
# 	echo Running chttp2_fake_security_cancel_after_invoke_test
# 	$(OUT_DIR)/chttp2_fake_security_cancel_after_invoke_test.exe
# chttp2_fake_security_cancel_before_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_cancel_before_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_cancel_before_invoke_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_cancel_before_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_cancel_before_invoke_test: chttp2_fake_security_cancel_before_invoke_test.exe
# 	echo Running chttp2_fake_security_cancel_before_invoke_test
# 	$(OUT_DIR)/chttp2_fake_security_cancel_before_invoke_test.exe
# chttp2_fake_security_cancel_in_a_vacuum_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_cancel_in_a_vacuum_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_cancel_in_a_vacuum_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_cancel_in_a_vacuum_test: chttp2_fake_security_cancel_in_a_vacuum_test.exe
# 	echo Running chttp2_fake_security_cancel_in_a_vacuum_test
# 	$(OUT_DIR)/chttp2_fake_security_cancel_in_a_vacuum_test.exe
# chttp2_fake_security_census_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_census_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_census_simple_request_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_census_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_census_simple_request_test: chttp2_fake_security_census_simple_request_test.exe
# 	echo Running chttp2_fake_security_census_simple_request_test
# 	$(OUT_DIR)/chttp2_fake_security_census_simple_request_test.exe
# chttp2_fake_security_disappearing_server_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_disappearing_server_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_disappearing_server_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_disappearing_server.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_disappearing_server_test: chttp2_fake_security_disappearing_server_test.exe
# 	echo Running chttp2_fake_security_disappearing_server_test
# 	$(OUT_DIR)/chttp2_fake_security_disappearing_server_test.exe
# chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test: chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test.exe
# 	echo Running chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test
# 	$(OUT_DIR)/chttp2_fake_security_early_server_shutdown_finishes_inflight_calls_test.exe
# chttp2_fake_security_early_server_shutdown_finishes_tags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_early_server_shutdown_finishes_tags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_early_server_shutdown_finishes_tags_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_early_server_shutdown_finishes_tags_test: chttp2_fake_security_early_server_shutdown_finishes_tags_test.exe
# 	echo Running chttp2_fake_security_early_server_shutdown_finishes_tags_test
# 	$(OUT_DIR)/chttp2_fake_security_early_server_shutdown_finishes_tags_test.exe
# chttp2_fake_security_empty_batch_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_empty_batch_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_empty_batch_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_empty_batch.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_empty_batch_test: chttp2_fake_security_empty_batch_test.exe
# 	echo Running chttp2_fake_security_empty_batch_test
# 	$(OUT_DIR)/chttp2_fake_security_empty_batch_test.exe
# chttp2_fake_security_graceful_server_shutdown_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_graceful_server_shutdown_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_graceful_server_shutdown_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_graceful_server_shutdown_test: chttp2_fake_security_graceful_server_shutdown_test.exe
# 	echo Running chttp2_fake_security_graceful_server_shutdown_test
# 	$(OUT_DIR)/chttp2_fake_security_graceful_server_shutdown_test.exe
# chttp2_fake_security_invoke_large_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_invoke_large_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_invoke_large_request_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_invoke_large_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_invoke_large_request_test: chttp2_fake_security_invoke_large_request_test.exe
# 	echo Running chttp2_fake_security_invoke_large_request_test
# 	$(OUT_DIR)/chttp2_fake_security_invoke_large_request_test.exe
# chttp2_fake_security_max_concurrent_streams_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_max_concurrent_streams_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_max_concurrent_streams_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_max_concurrent_streams.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_max_concurrent_streams_test: chttp2_fake_security_max_concurrent_streams_test.exe
# 	echo Running chttp2_fake_security_max_concurrent_streams_test
# 	$(OUT_DIR)/chttp2_fake_security_max_concurrent_streams_test.exe
# chttp2_fake_security_max_message_length_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_max_message_length_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_max_message_length_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_max_message_length.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_max_message_length_test: chttp2_fake_security_max_message_length_test.exe
# 	echo Running chttp2_fake_security_max_message_length_test
# 	$(OUT_DIR)/chttp2_fake_security_max_message_length_test.exe
# chttp2_fake_security_no_op_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_no_op_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_no_op_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_no_op.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_no_op_test: chttp2_fake_security_no_op_test.exe
# 	echo Running chttp2_fake_security_no_op_test
# 	$(OUT_DIR)/chttp2_fake_security_no_op_test.exe
# chttp2_fake_security_ping_pong_streaming_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_ping_pong_streaming_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_ping_pong_streaming_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_ping_pong_streaming.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_ping_pong_streaming_test: chttp2_fake_security_ping_pong_streaming_test.exe
# 	echo Running chttp2_fake_security_ping_pong_streaming_test
# 	$(OUT_DIR)/chttp2_fake_security_ping_pong_streaming_test.exe
# chttp2_fake_security_registered_call_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_registered_call_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_registered_call_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_registered_call.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_registered_call_test: chttp2_fake_security_registered_call_test.exe
# 	echo Running chttp2_fake_security_registered_call_test
# 	$(OUT_DIR)/chttp2_fake_security_registered_call_test.exe
# chttp2_fake_security_request_response_with_binary_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_request_response_with_binary_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_request_response_with_binary_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_request_response_with_binary_metadata_and_payload_test: chttp2_fake_security_request_response_with_binary_metadata_and_payload_test.exe
# 	echo Running chttp2_fake_security_request_response_with_binary_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_fake_security_request_response_with_binary_metadata_and_payload_test.exe
# chttp2_fake_security_request_response_with_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_request_response_with_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_request_response_with_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_request_response_with_metadata_and_payload_test: chttp2_fake_security_request_response_with_metadata_and_payload_test.exe
# 	echo Running chttp2_fake_security_request_response_with_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_fake_security_request_response_with_metadata_and_payload_test.exe
# chttp2_fake_security_request_response_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_request_response_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_request_response_with_payload_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_request_response_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_request_response_with_payload_test: chttp2_fake_security_request_response_with_payload_test.exe
# 	echo Running chttp2_fake_security_request_response_with_payload_test
# 	$(OUT_DIR)/chttp2_fake_security_request_response_with_payload_test.exe
# chttp2_fake_security_request_response_with_payload_and_call_creds_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_request_response_with_payload_and_call_creds_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_request_response_with_payload_and_call_creds_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_request_response_with_payload_and_call_creds.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_request_response_with_payload_and_call_creds_test: chttp2_fake_security_request_response_with_payload_and_call_creds_test.exe
# 	echo Running chttp2_fake_security_request_response_with_payload_and_call_creds_test
# 	$(OUT_DIR)/chttp2_fake_security_request_response_with_payload_and_call_creds_test.exe
# chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test: chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test.exe
# 	echo Running chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_fake_security_request_response_with_trailing_metadata_and_payload_test.exe
# chttp2_fake_security_request_with_compressed_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_request_with_compressed_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_request_with_compressed_payload_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_request_with_compressed_payload_test: chttp2_fake_security_request_with_compressed_payload_test.exe
# 	echo Running chttp2_fake_security_request_with_compressed_payload_test
# 	$(OUT_DIR)/chttp2_fake_security_request_with_compressed_payload_test.exe
# chttp2_fake_security_request_with_flags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_request_with_flags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_request_with_flags_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_request_with_flags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_request_with_flags_test: chttp2_fake_security_request_with_flags_test.exe
# 	echo Running chttp2_fake_security_request_with_flags_test
# 	$(OUT_DIR)/chttp2_fake_security_request_with_flags_test.exe
# chttp2_fake_security_request_with_large_metadata_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_request_with_large_metadata_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_request_with_large_metadata_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_request_with_large_metadata.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_request_with_large_metadata_test: chttp2_fake_security_request_with_large_metadata_test.exe
# 	echo Running chttp2_fake_security_request_with_large_metadata_test
# 	$(OUT_DIR)/chttp2_fake_security_request_with_large_metadata_test.exe
# chttp2_fake_security_request_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_request_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_request_with_payload_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_request_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_request_with_payload_test: chttp2_fake_security_request_with_payload_test.exe
# 	echo Running chttp2_fake_security_request_with_payload_test
# 	$(OUT_DIR)/chttp2_fake_security_request_with_payload_test.exe
# chttp2_fake_security_server_finishes_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_server_finishes_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_server_finishes_request_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_server_finishes_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_server_finishes_request_test: chttp2_fake_security_server_finishes_request_test.exe
# 	echo Running chttp2_fake_security_server_finishes_request_test
# 	$(OUT_DIR)/chttp2_fake_security_server_finishes_request_test.exe
# chttp2_fake_security_simple_delayed_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_simple_delayed_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_simple_delayed_request_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_simple_delayed_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_simple_delayed_request_test: chttp2_fake_security_simple_delayed_request_test.exe
# 	echo Running chttp2_fake_security_simple_delayed_request_test
# 	$(OUT_DIR)/chttp2_fake_security_simple_delayed_request_test.exe
# chttp2_fake_security_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_simple_request_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_simple_request_test: chttp2_fake_security_simple_request_test.exe
# 	echo Running chttp2_fake_security_simple_request_test
# 	$(OUT_DIR)/chttp2_fake_security_simple_request_test.exe
# chttp2_fake_security_simple_request_with_high_initial_sequence_number_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fake_security_simple_request_with_high_initial_sequence_number_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fake_security_simple_request_with_high_initial_sequence_number_test.exe" Debug/end2end_fixture_chttp2_fake_security.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fake_security_simple_request_with_high_initial_sequence_number_test: chttp2_fake_security_simple_request_with_high_initial_sequence_number_test.exe
# 	echo Running chttp2_fake_security_simple_request_with_high_initial_sequence_number_test
# 	$(OUT_DIR)/chttp2_fake_security_simple_request_with_high_initial_sequence_number_test.exe
# chttp2_fullstack_bad_hostname_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_bad_hostname_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_bad_hostname_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_bad_hostname.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_bad_hostname_test: chttp2_fullstack_bad_hostname_test.exe
# 	echo Running chttp2_fullstack_bad_hostname_test
# 	$(OUT_DIR)/chttp2_fullstack_bad_hostname_test.exe
# chttp2_fullstack_cancel_after_accept_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_cancel_after_accept_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_cancel_after_accept_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_cancel_after_accept.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_cancel_after_accept_test: chttp2_fullstack_cancel_after_accept_test.exe
# 	echo Running chttp2_fullstack_cancel_after_accept_test
# 	$(OUT_DIR)/chttp2_fullstack_cancel_after_accept_test.exe
# chttp2_fullstack_cancel_after_accept_and_writes_closed_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_cancel_after_accept_and_writes_closed_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_cancel_after_accept_and_writes_closed_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_cancel_after_accept_and_writes_closed_test: chttp2_fullstack_cancel_after_accept_and_writes_closed_test.exe
# 	echo Running chttp2_fullstack_cancel_after_accept_and_writes_closed_test
# 	$(OUT_DIR)/chttp2_fullstack_cancel_after_accept_and_writes_closed_test.exe
# chttp2_fullstack_cancel_after_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_cancel_after_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_cancel_after_invoke_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_cancel_after_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_cancel_after_invoke_test: chttp2_fullstack_cancel_after_invoke_test.exe
# 	echo Running chttp2_fullstack_cancel_after_invoke_test
# 	$(OUT_DIR)/chttp2_fullstack_cancel_after_invoke_test.exe
# chttp2_fullstack_cancel_before_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_cancel_before_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_cancel_before_invoke_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_cancel_before_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_cancel_before_invoke_test: chttp2_fullstack_cancel_before_invoke_test.exe
# 	echo Running chttp2_fullstack_cancel_before_invoke_test
# 	$(OUT_DIR)/chttp2_fullstack_cancel_before_invoke_test.exe
# chttp2_fullstack_cancel_in_a_vacuum_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_cancel_in_a_vacuum_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_cancel_in_a_vacuum_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_cancel_in_a_vacuum_test: chttp2_fullstack_cancel_in_a_vacuum_test.exe
# 	echo Running chttp2_fullstack_cancel_in_a_vacuum_test
# 	$(OUT_DIR)/chttp2_fullstack_cancel_in_a_vacuum_test.exe
# chttp2_fullstack_census_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_census_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_census_simple_request_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_census_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_census_simple_request_test: chttp2_fullstack_census_simple_request_test.exe
# 	echo Running chttp2_fullstack_census_simple_request_test
# 	$(OUT_DIR)/chttp2_fullstack_census_simple_request_test.exe
# chttp2_fullstack_disappearing_server_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_disappearing_server_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_disappearing_server_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_disappearing_server.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_disappearing_server_test: chttp2_fullstack_disappearing_server_test.exe
# 	echo Running chttp2_fullstack_disappearing_server_test
# 	$(OUT_DIR)/chttp2_fullstack_disappearing_server_test.exe
# chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test: chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test.exe
# 	echo Running chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test
# 	$(OUT_DIR)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_test.exe
# chttp2_fullstack_early_server_shutdown_finishes_tags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_early_server_shutdown_finishes_tags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_early_server_shutdown_finishes_tags_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_early_server_shutdown_finishes_tags_test: chttp2_fullstack_early_server_shutdown_finishes_tags_test.exe
# 	echo Running chttp2_fullstack_early_server_shutdown_finishes_tags_test
# 	$(OUT_DIR)/chttp2_fullstack_early_server_shutdown_finishes_tags_test.exe
# chttp2_fullstack_empty_batch_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_empty_batch_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_empty_batch_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_empty_batch.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_empty_batch_test: chttp2_fullstack_empty_batch_test.exe
# 	echo Running chttp2_fullstack_empty_batch_test
# 	$(OUT_DIR)/chttp2_fullstack_empty_batch_test.exe
# chttp2_fullstack_graceful_server_shutdown_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_graceful_server_shutdown_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_graceful_server_shutdown_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_graceful_server_shutdown_test: chttp2_fullstack_graceful_server_shutdown_test.exe
# 	echo Running chttp2_fullstack_graceful_server_shutdown_test
# 	$(OUT_DIR)/chttp2_fullstack_graceful_server_shutdown_test.exe
# chttp2_fullstack_invoke_large_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_invoke_large_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_invoke_large_request_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_invoke_large_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_invoke_large_request_test: chttp2_fullstack_invoke_large_request_test.exe
# 	echo Running chttp2_fullstack_invoke_large_request_test
# 	$(OUT_DIR)/chttp2_fullstack_invoke_large_request_test.exe
# chttp2_fullstack_max_concurrent_streams_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_max_concurrent_streams_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_max_concurrent_streams_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_max_concurrent_streams.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_max_concurrent_streams_test: chttp2_fullstack_max_concurrent_streams_test.exe
# 	echo Running chttp2_fullstack_max_concurrent_streams_test
# 	$(OUT_DIR)/chttp2_fullstack_max_concurrent_streams_test.exe
# chttp2_fullstack_max_message_length_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_max_message_length_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_max_message_length_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_max_message_length.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_max_message_length_test: chttp2_fullstack_max_message_length_test.exe
# 	echo Running chttp2_fullstack_max_message_length_test
# 	$(OUT_DIR)/chttp2_fullstack_max_message_length_test.exe
# chttp2_fullstack_no_op_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_no_op_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_no_op_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_no_op.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_no_op_test: chttp2_fullstack_no_op_test.exe
# 	echo Running chttp2_fullstack_no_op_test
# 	$(OUT_DIR)/chttp2_fullstack_no_op_test.exe
# chttp2_fullstack_ping_pong_streaming_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_ping_pong_streaming_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_ping_pong_streaming_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_ping_pong_streaming.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_ping_pong_streaming_test: chttp2_fullstack_ping_pong_streaming_test.exe
# 	echo Running chttp2_fullstack_ping_pong_streaming_test
# 	$(OUT_DIR)/chttp2_fullstack_ping_pong_streaming_test.exe
# chttp2_fullstack_registered_call_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_registered_call_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_registered_call_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_registered_call.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_registered_call_test: chttp2_fullstack_registered_call_test.exe
# 	echo Running chttp2_fullstack_registered_call_test
# 	$(OUT_DIR)/chttp2_fullstack_registered_call_test.exe
# chttp2_fullstack_request_response_with_binary_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_response_with_binary_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_response_with_binary_metadata_and_payload_test: chttp2_fullstack_request_response_with_binary_metadata_and_payload_test.exe
# 	echo Running chttp2_fullstack_request_response_with_binary_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_test.exe
# chttp2_fullstack_request_response_with_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_response_with_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_response_with_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_response_with_metadata_and_payload_test: chttp2_fullstack_request_response_with_metadata_and_payload_test.exe
# 	echo Running chttp2_fullstack_request_response_with_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_fullstack_request_response_with_metadata_and_payload_test.exe
# chttp2_fullstack_request_response_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_response_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_response_with_payload_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_response_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_response_with_payload_test: chttp2_fullstack_request_response_with_payload_test.exe
# 	echo Running chttp2_fullstack_request_response_with_payload_test
# 	$(OUT_DIR)/chttp2_fullstack_request_response_with_payload_test.exe
# chttp2_fullstack_request_response_with_payload_and_call_creds_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_response_with_payload_and_call_creds_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_response_with_payload_and_call_creds_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_response_with_payload_and_call_creds.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_response_with_payload_and_call_creds_test: chttp2_fullstack_request_response_with_payload_and_call_creds_test.exe
# 	echo Running chttp2_fullstack_request_response_with_payload_and_call_creds_test
# 	$(OUT_DIR)/chttp2_fullstack_request_response_with_payload_and_call_creds_test.exe
# chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test: chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test.exe
# 	echo Running chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_test.exe
# chttp2_fullstack_request_with_compressed_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_with_compressed_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_with_compressed_payload_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_with_compressed_payload_test: chttp2_fullstack_request_with_compressed_payload_test.exe
# 	echo Running chttp2_fullstack_request_with_compressed_payload_test
# 	$(OUT_DIR)/chttp2_fullstack_request_with_compressed_payload_test.exe
# chttp2_fullstack_request_with_flags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_with_flags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_with_flags_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_with_flags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_with_flags_test: chttp2_fullstack_request_with_flags_test.exe
# 	echo Running chttp2_fullstack_request_with_flags_test
# 	$(OUT_DIR)/chttp2_fullstack_request_with_flags_test.exe
# chttp2_fullstack_request_with_large_metadata_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_with_large_metadata_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_with_large_metadata_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_with_large_metadata.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_with_large_metadata_test: chttp2_fullstack_request_with_large_metadata_test.exe
# 	echo Running chttp2_fullstack_request_with_large_metadata_test
# 	$(OUT_DIR)/chttp2_fullstack_request_with_large_metadata_test.exe
# chttp2_fullstack_request_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_with_payload_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_with_payload_test: chttp2_fullstack_request_with_payload_test.exe
# 	echo Running chttp2_fullstack_request_with_payload_test
# 	$(OUT_DIR)/chttp2_fullstack_request_with_payload_test.exe
# chttp2_fullstack_server_finishes_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_server_finishes_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_server_finishes_request_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_server_finishes_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_server_finishes_request_test: chttp2_fullstack_server_finishes_request_test.exe
# 	echo Running chttp2_fullstack_server_finishes_request_test
# 	$(OUT_DIR)/chttp2_fullstack_server_finishes_request_test.exe
# chttp2_fullstack_simple_delayed_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_simple_delayed_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_simple_delayed_request_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_simple_delayed_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_simple_delayed_request_test: chttp2_fullstack_simple_delayed_request_test.exe
# 	echo Running chttp2_fullstack_simple_delayed_request_test
# 	$(OUT_DIR)/chttp2_fullstack_simple_delayed_request_test.exe
# chttp2_fullstack_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_simple_request_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_simple_request_test: chttp2_fullstack_simple_request_test.exe
# 	echo Running chttp2_fullstack_simple_request_test
# 	$(OUT_DIR)/chttp2_fullstack_simple_request_test.exe
# chttp2_fullstack_simple_request_with_high_initial_sequence_number_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_simple_request_with_high_initial_sequence_number_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_simple_request_with_high_initial_sequence_number_test: chttp2_fullstack_simple_request_with_high_initial_sequence_number_test.exe
# 	echo Running chttp2_fullstack_simple_request_with_high_initial_sequence_number_test
# 	$(OUT_DIR)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_test.exe
# chttp2_fullstack_compression_bad_hostname_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_bad_hostname_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_bad_hostname_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_bad_hostname.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_bad_hostname_test: chttp2_fullstack_compression_bad_hostname_test.exe
# 	echo Running chttp2_fullstack_compression_bad_hostname_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_bad_hostname_test.exe
# chttp2_fullstack_compression_cancel_after_accept_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_cancel_after_accept_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_cancel_after_accept_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_cancel_after_accept.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_cancel_after_accept_test: chttp2_fullstack_compression_cancel_after_accept_test.exe
# 	echo Running chttp2_fullstack_compression_cancel_after_accept_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_cancel_after_accept_test.exe
# chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_test: chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_test.exe
# 	echo Running chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_test.exe
# chttp2_fullstack_compression_cancel_after_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_cancel_after_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_cancel_after_invoke_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_cancel_after_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_cancel_after_invoke_test: chttp2_fullstack_compression_cancel_after_invoke_test.exe
# 	echo Running chttp2_fullstack_compression_cancel_after_invoke_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_cancel_after_invoke_test.exe
# chttp2_fullstack_compression_cancel_before_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_cancel_before_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_cancel_before_invoke_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_cancel_before_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_cancel_before_invoke_test: chttp2_fullstack_compression_cancel_before_invoke_test.exe
# 	echo Running chttp2_fullstack_compression_cancel_before_invoke_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_cancel_before_invoke_test.exe
# chttp2_fullstack_compression_cancel_in_a_vacuum_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_cancel_in_a_vacuum_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_cancel_in_a_vacuum_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_cancel_in_a_vacuum_test: chttp2_fullstack_compression_cancel_in_a_vacuum_test.exe
# 	echo Running chttp2_fullstack_compression_cancel_in_a_vacuum_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_cancel_in_a_vacuum_test.exe
# chttp2_fullstack_compression_census_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_census_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_census_simple_request_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_census_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_census_simple_request_test: chttp2_fullstack_compression_census_simple_request_test.exe
# 	echo Running chttp2_fullstack_compression_census_simple_request_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_census_simple_request_test.exe
# chttp2_fullstack_compression_disappearing_server_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_disappearing_server_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_disappearing_server_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_disappearing_server.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_disappearing_server_test: chttp2_fullstack_compression_disappearing_server_test.exe
# 	echo Running chttp2_fullstack_compression_disappearing_server_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_disappearing_server_test.exe
# chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_test: chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_test.exe
# 	echo Running chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_test.exe
# chttp2_fullstack_compression_early_server_shutdown_finishes_tags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_early_server_shutdown_finishes_tags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_early_server_shutdown_finishes_tags_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_early_server_shutdown_finishes_tags_test: chttp2_fullstack_compression_early_server_shutdown_finishes_tags_test.exe
# 	echo Running chttp2_fullstack_compression_early_server_shutdown_finishes_tags_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_early_server_shutdown_finishes_tags_test.exe
# chttp2_fullstack_compression_empty_batch_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_empty_batch_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_empty_batch_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_empty_batch.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_empty_batch_test: chttp2_fullstack_compression_empty_batch_test.exe
# 	echo Running chttp2_fullstack_compression_empty_batch_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_empty_batch_test.exe
# chttp2_fullstack_compression_graceful_server_shutdown_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_graceful_server_shutdown_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_graceful_server_shutdown_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_graceful_server_shutdown_test: chttp2_fullstack_compression_graceful_server_shutdown_test.exe
# 	echo Running chttp2_fullstack_compression_graceful_server_shutdown_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_graceful_server_shutdown_test.exe
# chttp2_fullstack_compression_invoke_large_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_invoke_large_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_invoke_large_request_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_invoke_large_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_invoke_large_request_test: chttp2_fullstack_compression_invoke_large_request_test.exe
# 	echo Running chttp2_fullstack_compression_invoke_large_request_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_invoke_large_request_test.exe
# chttp2_fullstack_compression_max_concurrent_streams_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_max_concurrent_streams_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_max_concurrent_streams_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_max_concurrent_streams.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_max_concurrent_streams_test: chttp2_fullstack_compression_max_concurrent_streams_test.exe
# 	echo Running chttp2_fullstack_compression_max_concurrent_streams_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_max_concurrent_streams_test.exe
# chttp2_fullstack_compression_max_message_length_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_max_message_length_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_max_message_length_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_max_message_length.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_max_message_length_test: chttp2_fullstack_compression_max_message_length_test.exe
# 	echo Running chttp2_fullstack_compression_max_message_length_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_max_message_length_test.exe
# chttp2_fullstack_compression_no_op_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_no_op_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_no_op_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_no_op.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_no_op_test: chttp2_fullstack_compression_no_op_test.exe
# 	echo Running chttp2_fullstack_compression_no_op_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_no_op_test.exe
# chttp2_fullstack_compression_ping_pong_streaming_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_ping_pong_streaming_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_ping_pong_streaming_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_ping_pong_streaming.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_ping_pong_streaming_test: chttp2_fullstack_compression_ping_pong_streaming_test.exe
# 	echo Running chttp2_fullstack_compression_ping_pong_streaming_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_ping_pong_streaming_test.exe
# chttp2_fullstack_compression_registered_call_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_registered_call_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_registered_call_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_registered_call.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_registered_call_test: chttp2_fullstack_compression_registered_call_test.exe
# 	echo Running chttp2_fullstack_compression_registered_call_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_registered_call_test.exe
# chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_test: chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_test.exe
# 	echo Running chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_test.exe
# chttp2_fullstack_compression_request_response_with_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_response_with_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_response_with_metadata_and_payload_test: chttp2_fullstack_compression_request_response_with_metadata_and_payload_test.exe
# 	echo Running chttp2_fullstack_compression_request_response_with_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_metadata_and_payload_test.exe
# chttp2_fullstack_compression_request_response_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_response_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_payload_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_response_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_response_with_payload_test: chttp2_fullstack_compression_request_response_with_payload_test.exe
# 	echo Running chttp2_fullstack_compression_request_response_with_payload_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_payload_test.exe
# chttp2_fullstack_compression_request_response_with_payload_and_call_creds_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_response_with_payload_and_call_creds_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_payload_and_call_creds_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_response_with_payload_and_call_creds.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_response_with_payload_and_call_creds_test: chttp2_fullstack_compression_request_response_with_payload_and_call_creds_test.exe
# 	echo Running chttp2_fullstack_compression_request_response_with_payload_and_call_creds_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_payload_and_call_creds_test.exe
# chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_test: chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_test.exe
# 	echo Running chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_test.exe
# chttp2_fullstack_compression_request_with_compressed_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_with_compressed_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_with_compressed_payload_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_with_compressed_payload_test: chttp2_fullstack_compression_request_with_compressed_payload_test.exe
# 	echo Running chttp2_fullstack_compression_request_with_compressed_payload_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_with_compressed_payload_test.exe
# chttp2_fullstack_compression_request_with_flags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_with_flags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_with_flags_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_with_flags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_with_flags_test: chttp2_fullstack_compression_request_with_flags_test.exe
# 	echo Running chttp2_fullstack_compression_request_with_flags_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_with_flags_test.exe
# chttp2_fullstack_compression_request_with_large_metadata_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_with_large_metadata_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_with_large_metadata_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_with_large_metadata.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_with_large_metadata_test: chttp2_fullstack_compression_request_with_large_metadata_test.exe
# 	echo Running chttp2_fullstack_compression_request_with_large_metadata_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_with_large_metadata_test.exe
# chttp2_fullstack_compression_request_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_with_payload_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_with_payload_test: chttp2_fullstack_compression_request_with_payload_test.exe
# 	echo Running chttp2_fullstack_compression_request_with_payload_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_with_payload_test.exe
# chttp2_fullstack_compression_server_finishes_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_server_finishes_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_server_finishes_request_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_server_finishes_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_server_finishes_request_test: chttp2_fullstack_compression_server_finishes_request_test.exe
# 	echo Running chttp2_fullstack_compression_server_finishes_request_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_server_finishes_request_test.exe
# chttp2_fullstack_compression_simple_delayed_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_simple_delayed_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_simple_delayed_request_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_simple_delayed_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_simple_delayed_request_test: chttp2_fullstack_compression_simple_delayed_request_test.exe
# 	echo Running chttp2_fullstack_compression_simple_delayed_request_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_simple_delayed_request_test.exe
# chttp2_fullstack_compression_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_simple_request_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_simple_request_test: chttp2_fullstack_compression_simple_request_test.exe
# 	echo Running chttp2_fullstack_compression_simple_request_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_simple_request_test.exe
# chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_test: chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_test.exe
# 	echo Running chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_test.exe
# chttp2_simple_ssl_fullstack_bad_hostname_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_bad_hostname_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_bad_hostname_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_bad_hostname.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_bad_hostname_test: chttp2_simple_ssl_fullstack_bad_hostname_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_bad_hostname_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_bad_hostname_test.exe
# chttp2_simple_ssl_fullstack_cancel_after_accept_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_cancel_after_accept_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_cancel_after_accept_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_cancel_after_accept.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_cancel_after_accept_test: chttp2_simple_ssl_fullstack_cancel_after_accept_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_cancel_after_accept_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_cancel_after_accept_test.exe
# chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test: chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_cancel_after_accept_and_writes_closed_test.exe
# chttp2_simple_ssl_fullstack_cancel_after_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_cancel_after_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_cancel_after_invoke_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_cancel_after_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_cancel_after_invoke_test: chttp2_simple_ssl_fullstack_cancel_after_invoke_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_cancel_after_invoke_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_cancel_after_invoke_test.exe
# chttp2_simple_ssl_fullstack_cancel_before_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_cancel_before_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_cancel_before_invoke_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_cancel_before_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_cancel_before_invoke_test: chttp2_simple_ssl_fullstack_cancel_before_invoke_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_cancel_before_invoke_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_cancel_before_invoke_test.exe
# chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test: chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_cancel_in_a_vacuum_test.exe
# chttp2_simple_ssl_fullstack_census_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_census_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_census_simple_request_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_census_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_census_simple_request_test: chttp2_simple_ssl_fullstack_census_simple_request_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_census_simple_request_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_census_simple_request_test.exe
# chttp2_simple_ssl_fullstack_disappearing_server_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_disappearing_server_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_disappearing_server_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_disappearing_server.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_disappearing_server_test: chttp2_simple_ssl_fullstack_disappearing_server_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_disappearing_server_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_disappearing_server_test.exe
# chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test: chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_inflight_calls_test.exe
# chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test: chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_early_server_shutdown_finishes_tags_test.exe
# chttp2_simple_ssl_fullstack_empty_batch_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_empty_batch_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_empty_batch_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_empty_batch.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_empty_batch_test: chttp2_simple_ssl_fullstack_empty_batch_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_empty_batch_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_empty_batch_test.exe
# chttp2_simple_ssl_fullstack_graceful_server_shutdown_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_graceful_server_shutdown_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_graceful_server_shutdown_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_graceful_server_shutdown_test: chttp2_simple_ssl_fullstack_graceful_server_shutdown_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_graceful_server_shutdown_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_graceful_server_shutdown_test.exe
# chttp2_simple_ssl_fullstack_invoke_large_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_invoke_large_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_invoke_large_request_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_invoke_large_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_invoke_large_request_test: chttp2_simple_ssl_fullstack_invoke_large_request_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_invoke_large_request_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_invoke_large_request_test.exe
# chttp2_simple_ssl_fullstack_max_concurrent_streams_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_max_concurrent_streams_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_max_concurrent_streams_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_max_concurrent_streams.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_max_concurrent_streams_test: chttp2_simple_ssl_fullstack_max_concurrent_streams_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_max_concurrent_streams_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_max_concurrent_streams_test.exe
# chttp2_simple_ssl_fullstack_max_message_length_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_max_message_length_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_max_message_length_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_max_message_length.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_max_message_length_test: chttp2_simple_ssl_fullstack_max_message_length_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_max_message_length_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_max_message_length_test.exe
# chttp2_simple_ssl_fullstack_no_op_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_no_op_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_no_op_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_no_op.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_no_op_test: chttp2_simple_ssl_fullstack_no_op_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_no_op_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_no_op_test.exe
# chttp2_simple_ssl_fullstack_ping_pong_streaming_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_ping_pong_streaming_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_ping_pong_streaming_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_ping_pong_streaming.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_ping_pong_streaming_test: chttp2_simple_ssl_fullstack_ping_pong_streaming_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_ping_pong_streaming_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_ping_pong_streaming_test.exe
# chttp2_simple_ssl_fullstack_registered_call_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_registered_call_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_registered_call_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_registered_call.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_registered_call_test: chttp2_simple_ssl_fullstack_registered_call_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_registered_call_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_registered_call_test.exe
# chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test: chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_response_with_binary_metadata_and_payload_test.exe
# chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test: chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_response_with_metadata_and_payload_test.exe
# chttp2_simple_ssl_fullstack_request_response_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_request_response_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_response_with_payload_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_request_response_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_request_response_with_payload_test: chttp2_simple_ssl_fullstack_request_response_with_payload_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_request_response_with_payload_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_response_with_payload_test.exe
# chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_request_response_with_payload_and_call_creds.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test: chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_response_with_payload_and_call_creds_test.exe
# chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test: chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_response_with_trailing_metadata_and_payload_test.exe
# chttp2_simple_ssl_fullstack_request_with_compressed_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_request_with_compressed_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_with_compressed_payload_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_request_with_compressed_payload_test: chttp2_simple_ssl_fullstack_request_with_compressed_payload_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_request_with_compressed_payload_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_with_compressed_payload_test.exe
# chttp2_simple_ssl_fullstack_request_with_flags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_request_with_flags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_with_flags_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_request_with_flags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_request_with_flags_test: chttp2_simple_ssl_fullstack_request_with_flags_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_request_with_flags_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_with_flags_test.exe
# chttp2_simple_ssl_fullstack_request_with_large_metadata_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_request_with_large_metadata_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_with_large_metadata_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_request_with_large_metadata.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_request_with_large_metadata_test: chttp2_simple_ssl_fullstack_request_with_large_metadata_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_request_with_large_metadata_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_with_large_metadata_test.exe
# chttp2_simple_ssl_fullstack_request_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_request_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_with_payload_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_request_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_request_with_payload_test: chttp2_simple_ssl_fullstack_request_with_payload_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_request_with_payload_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_request_with_payload_test.exe
# chttp2_simple_ssl_fullstack_server_finishes_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_server_finishes_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_server_finishes_request_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_server_finishes_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_server_finishes_request_test: chttp2_simple_ssl_fullstack_server_finishes_request_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_server_finishes_request_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_server_finishes_request_test.exe
# chttp2_simple_ssl_fullstack_simple_delayed_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_simple_delayed_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_simple_delayed_request_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_simple_delayed_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_simple_delayed_request_test: chttp2_simple_ssl_fullstack_simple_delayed_request_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_simple_delayed_request_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_simple_delayed_request_test.exe
# chttp2_simple_ssl_fullstack_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_simple_request_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_simple_request_test: chttp2_simple_ssl_fullstack_simple_request_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_simple_request_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_simple_request_test.exe
# chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_fullstack.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test: chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test.exe
# 	echo Running chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test
# 	$(OUT_DIR)/chttp2_simple_ssl_fullstack_simple_request_with_high_initial_sequence_number_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_bad_hostname.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test: chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_bad_hostname_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_cancel_after_accept.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test: chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test: chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_accept_and_writes_closed_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_cancel_after_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test: chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_after_invoke_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_cancel_before_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test: chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_before_invoke_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test: chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_cancel_in_a_vacuum_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_census_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test: chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_census_simple_request_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_disappearing_server.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test: chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_disappearing_server_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test: chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_inflight_calls_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test: chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_early_server_shutdown_finishes_tags_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_empty_batch.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test: chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_empty_batch_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test: chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_graceful_server_shutdown_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_invoke_large_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test: chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_invoke_large_request_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_max_concurrent_streams.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test: chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_max_concurrent_streams_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_max_message_length.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test: chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_max_message_length_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_no_op_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_no_op_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_no_op_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_no_op.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_no_op_test: chttp2_simple_ssl_with_oauth2_fullstack_no_op_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_no_op_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_no_op_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_ping_pong_streaming.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test: chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_ping_pong_streaming_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_registered_call.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test: chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_registered_call_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test: chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_binary_metadata_and_payload_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test: chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_metadata_and_payload_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_request_response_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test: chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_request_response_with_payload_and_call_creds.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test: chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_payload_and_call_creds_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test: chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_response_with_trailing_metadata_and_payload_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_request_with_compressed_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_request_with_compressed_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_compressed_payload_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_request_with_compressed_payload_test: chttp2_simple_ssl_with_oauth2_fullstack_request_with_compressed_payload_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_request_with_compressed_payload_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_compressed_payload_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_request_with_flags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_request_with_flags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_flags_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_request_with_flags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_request_with_flags_test: chttp2_simple_ssl_with_oauth2_fullstack_request_with_flags_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_request_with_flags_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_flags_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_request_with_large_metadata.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test: chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_large_metadata_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_request_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test: chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_request_with_payload_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_server_finishes_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test: chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_server_finishes_request_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_simple_delayed_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test: chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_simple_delayed_request_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test: chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_test.exe
# chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test.exe" Debug/end2end_fixture_chttp2_simple_ssl_with_oauth2_fullstack.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test: chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test.exe
# 	echo Running chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test
# 	$(OUT_DIR)/chttp2_simple_ssl_with_oauth2_fullstack_simple_request_with_high_initial_sequence_number_test.exe
# chttp2_socket_pair_bad_hostname_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_bad_hostname_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_bad_hostname_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_bad_hostname.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_bad_hostname_test: chttp2_socket_pair_bad_hostname_test.exe
# 	echo Running chttp2_socket_pair_bad_hostname_test
# 	$(OUT_DIR)/chttp2_socket_pair_bad_hostname_test.exe
# chttp2_socket_pair_cancel_after_accept_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_cancel_after_accept_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_cancel_after_accept_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_cancel_after_accept.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_cancel_after_accept_test: chttp2_socket_pair_cancel_after_accept_test.exe
# 	echo Running chttp2_socket_pair_cancel_after_accept_test
# 	$(OUT_DIR)/chttp2_socket_pair_cancel_after_accept_test.exe
# chttp2_socket_pair_cancel_after_accept_and_writes_closed_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_cancel_after_accept_and_writes_closed_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_cancel_after_accept_and_writes_closed_test: chttp2_socket_pair_cancel_after_accept_and_writes_closed_test.exe
# 	echo Running chttp2_socket_pair_cancel_after_accept_and_writes_closed_test
# 	$(OUT_DIR)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_test.exe
# chttp2_socket_pair_cancel_after_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_cancel_after_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_cancel_after_invoke_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_cancel_after_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_cancel_after_invoke_test: chttp2_socket_pair_cancel_after_invoke_test.exe
# 	echo Running chttp2_socket_pair_cancel_after_invoke_test
# 	$(OUT_DIR)/chttp2_socket_pair_cancel_after_invoke_test.exe
# chttp2_socket_pair_cancel_before_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_cancel_before_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_cancel_before_invoke_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_cancel_before_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_cancel_before_invoke_test: chttp2_socket_pair_cancel_before_invoke_test.exe
# 	echo Running chttp2_socket_pair_cancel_before_invoke_test
# 	$(OUT_DIR)/chttp2_socket_pair_cancel_before_invoke_test.exe
# chttp2_socket_pair_cancel_in_a_vacuum_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_cancel_in_a_vacuum_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_cancel_in_a_vacuum_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_cancel_in_a_vacuum_test: chttp2_socket_pair_cancel_in_a_vacuum_test.exe
# 	echo Running chttp2_socket_pair_cancel_in_a_vacuum_test
# 	$(OUT_DIR)/chttp2_socket_pair_cancel_in_a_vacuum_test.exe
# chttp2_socket_pair_census_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_census_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_census_simple_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_census_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_census_simple_request_test: chttp2_socket_pair_census_simple_request_test.exe
# 	echo Running chttp2_socket_pair_census_simple_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_census_simple_request_test.exe
# chttp2_socket_pair_disappearing_server_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_disappearing_server_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_disappearing_server_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_disappearing_server.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_disappearing_server_test: chttp2_socket_pair_disappearing_server_test.exe
# 	echo Running chttp2_socket_pair_disappearing_server_test
# 	$(OUT_DIR)/chttp2_socket_pair_disappearing_server_test.exe
# chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test: chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test.exe
# 	echo Running chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test
# 	$(OUT_DIR)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_test.exe
# chttp2_socket_pair_early_server_shutdown_finishes_tags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_early_server_shutdown_finishes_tags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_early_server_shutdown_finishes_tags_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_early_server_shutdown_finishes_tags_test: chttp2_socket_pair_early_server_shutdown_finishes_tags_test.exe
# 	echo Running chttp2_socket_pair_early_server_shutdown_finishes_tags_test
# 	$(OUT_DIR)/chttp2_socket_pair_early_server_shutdown_finishes_tags_test.exe
# chttp2_socket_pair_empty_batch_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_empty_batch_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_empty_batch_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_empty_batch.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_empty_batch_test: chttp2_socket_pair_empty_batch_test.exe
# 	echo Running chttp2_socket_pair_empty_batch_test
# 	$(OUT_DIR)/chttp2_socket_pair_empty_batch_test.exe
# chttp2_socket_pair_graceful_server_shutdown_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_graceful_server_shutdown_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_graceful_server_shutdown_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_graceful_server_shutdown_test: chttp2_socket_pair_graceful_server_shutdown_test.exe
# 	echo Running chttp2_socket_pair_graceful_server_shutdown_test
# 	$(OUT_DIR)/chttp2_socket_pair_graceful_server_shutdown_test.exe
# chttp2_socket_pair_invoke_large_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_invoke_large_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_invoke_large_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_invoke_large_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_invoke_large_request_test: chttp2_socket_pair_invoke_large_request_test.exe
# 	echo Running chttp2_socket_pair_invoke_large_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_invoke_large_request_test.exe
# chttp2_socket_pair_max_concurrent_streams_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_max_concurrent_streams_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_max_concurrent_streams_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_max_concurrent_streams.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_max_concurrent_streams_test: chttp2_socket_pair_max_concurrent_streams_test.exe
# 	echo Running chttp2_socket_pair_max_concurrent_streams_test
# 	$(OUT_DIR)/chttp2_socket_pair_max_concurrent_streams_test.exe
# chttp2_socket_pair_max_message_length_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_max_message_length_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_max_message_length_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_max_message_length.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_max_message_length_test: chttp2_socket_pair_max_message_length_test.exe
# 	echo Running chttp2_socket_pair_max_message_length_test
# 	$(OUT_DIR)/chttp2_socket_pair_max_message_length_test.exe
# chttp2_socket_pair_no_op_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_no_op_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_no_op_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_no_op.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_no_op_test: chttp2_socket_pair_no_op_test.exe
# 	echo Running chttp2_socket_pair_no_op_test
# 	$(OUT_DIR)/chttp2_socket_pair_no_op_test.exe
# chttp2_socket_pair_ping_pong_streaming_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_ping_pong_streaming_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_ping_pong_streaming_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_ping_pong_streaming.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_ping_pong_streaming_test: chttp2_socket_pair_ping_pong_streaming_test.exe
# 	echo Running chttp2_socket_pair_ping_pong_streaming_test
# 	$(OUT_DIR)/chttp2_socket_pair_ping_pong_streaming_test.exe
# chttp2_socket_pair_registered_call_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_registered_call_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_registered_call_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_registered_call.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_registered_call_test: chttp2_socket_pair_registered_call_test.exe
# 	echo Running chttp2_socket_pair_registered_call_test
# 	$(OUT_DIR)/chttp2_socket_pair_registered_call_test.exe
# chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test: chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test.exe
# 	echo Running chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_test.exe
# chttp2_socket_pair_request_response_with_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_response_with_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_response_with_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_response_with_metadata_and_payload_test: chttp2_socket_pair_request_response_with_metadata_and_payload_test.exe
# 	echo Running chttp2_socket_pair_request_response_with_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_response_with_metadata_and_payload_test.exe
# chttp2_socket_pair_request_response_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_response_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_response_with_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_response_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_response_with_payload_test: chttp2_socket_pair_request_response_with_payload_test.exe
# 	echo Running chttp2_socket_pair_request_response_with_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_response_with_payload_test.exe
# chttp2_socket_pair_request_response_with_payload_and_call_creds_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_response_with_payload_and_call_creds_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_response_with_payload_and_call_creds_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_response_with_payload_and_call_creds.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_response_with_payload_and_call_creds_test: chttp2_socket_pair_request_response_with_payload_and_call_creds_test.exe
# 	echo Running chttp2_socket_pair_request_response_with_payload_and_call_creds_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_response_with_payload_and_call_creds_test.exe
# chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test: chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test.exe
# 	echo Running chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_test.exe
# chttp2_socket_pair_request_with_compressed_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_with_compressed_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_with_compressed_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_with_compressed_payload_test: chttp2_socket_pair_request_with_compressed_payload_test.exe
# 	echo Running chttp2_socket_pair_request_with_compressed_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_with_compressed_payload_test.exe
# chttp2_socket_pair_request_with_flags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_with_flags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_with_flags_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_with_flags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_with_flags_test: chttp2_socket_pair_request_with_flags_test.exe
# 	echo Running chttp2_socket_pair_request_with_flags_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_with_flags_test.exe
# chttp2_socket_pair_request_with_large_metadata_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_with_large_metadata_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_with_large_metadata_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_with_large_metadata.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_with_large_metadata_test: chttp2_socket_pair_request_with_large_metadata_test.exe
# 	echo Running chttp2_socket_pair_request_with_large_metadata_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_with_large_metadata_test.exe
# chttp2_socket_pair_request_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_with_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_with_payload_test: chttp2_socket_pair_request_with_payload_test.exe
# 	echo Running chttp2_socket_pair_request_with_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_with_payload_test.exe
# chttp2_socket_pair_server_finishes_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_server_finishes_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_server_finishes_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_server_finishes_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_server_finishes_request_test: chttp2_socket_pair_server_finishes_request_test.exe
# 	echo Running chttp2_socket_pair_server_finishes_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_server_finishes_request_test.exe
# chttp2_socket_pair_simple_delayed_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_simple_delayed_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_simple_delayed_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_simple_delayed_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_simple_delayed_request_test: chttp2_socket_pair_simple_delayed_request_test.exe
# 	echo Running chttp2_socket_pair_simple_delayed_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_simple_delayed_request_test.exe
# chttp2_socket_pair_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_simple_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_simple_request_test: chttp2_socket_pair_simple_request_test.exe
# 	echo Running chttp2_socket_pair_simple_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_simple_request_test.exe
# chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test: chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test.exe
# 	echo Running chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test
# 	$(OUT_DIR)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_test.exe
# chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_bad_hostname.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test: chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_test.exe
# chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_cancel_after_accept.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test: chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_test.exe
# chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test: chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_test.exe
# chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_cancel_after_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test: chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_test.exe
# chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_cancel_before_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test: chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_test.exe
# chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test: chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_test.exe
# chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_census_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test: chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_test.exe
# chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_disappearing_server.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test: chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_test.exe
# chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test: chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_test.exe
# chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test: chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_test.exe
# chttp2_socket_pair_one_byte_at_a_time_empty_batch_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_empty_batch_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_empty_batch.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_empty_batch_test: chttp2_socket_pair_one_byte_at_a_time_empty_batch_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_empty_batch_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_test.exe
# chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test: chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_test.exe
# chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_invoke_large_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test: chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_test.exe
# chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_max_concurrent_streams.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test: chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_test.exe
# chttp2_socket_pair_one_byte_at_a_time_max_message_length_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_max_message_length_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_max_message_length.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_max_message_length_test: chttp2_socket_pair_one_byte_at_a_time_max_message_length_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_max_message_length_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_test.exe
# chttp2_socket_pair_one_byte_at_a_time_no_op_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_no_op_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_no_op_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_no_op.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_no_op_test: chttp2_socket_pair_one_byte_at_a_time_no_op_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_no_op_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_no_op_test.exe
# chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_ping_pong_streaming.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test: chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_test.exe
# chttp2_socket_pair_one_byte_at_a_time_registered_call_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_registered_call_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_registered_call_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_registered_call.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_registered_call_test: chttp2_socket_pair_one_byte_at_a_time_registered_call_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_registered_call_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_registered_call_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test: chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test: chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_response_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test: chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_response_with_payload_and_call_creds.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test: chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_and_call_creds_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test: chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_test: chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_with_flags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_with_flags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_flags_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_with_flags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_with_flags_test: chttp2_socket_pair_one_byte_at_a_time_request_with_flags_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_with_flags_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_flags_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_with_large_metadata.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test: chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test: chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_test.exe
# chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_server_finishes_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test: chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_test.exe
# chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_simple_delayed_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test: chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_test.exe
# chttp2_socket_pair_one_byte_at_a_time_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_simple_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_simple_request_test: chttp2_socket_pair_one_byte_at_a_time_simple_request_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_simple_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_simple_request_test.exe
# chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test: chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_test.exe
# chttp2_socket_pair_with_grpc_trace_bad_hostname_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_bad_hostname_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_bad_hostname_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_bad_hostname.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_bad_hostname_test: chttp2_socket_pair_with_grpc_trace_bad_hostname_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_bad_hostname_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_bad_hostname_test.exe
# chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_cancel_after_accept.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test: chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_test.exe
# chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test: chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_test.exe
# chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_cancel_after_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test: chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_test.exe
# chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_cancel_before_invoke.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test: chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_test.exe
# chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test: chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_test.exe
# chttp2_socket_pair_with_grpc_trace_census_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_census_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_census_simple_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_census_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_census_simple_request_test: chttp2_socket_pair_with_grpc_trace_census_simple_request_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_census_simple_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_census_simple_request_test.exe
# chttp2_socket_pair_with_grpc_trace_disappearing_server_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_disappearing_server_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_disappearing_server_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_disappearing_server.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_disappearing_server_test: chttp2_socket_pair_with_grpc_trace_disappearing_server_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_disappearing_server_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_disappearing_server_test.exe
# chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test: chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_test.exe
# chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test: chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_test.exe
# chttp2_socket_pair_with_grpc_trace_empty_batch_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_empty_batch_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_empty_batch_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_empty_batch.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_empty_batch_test: chttp2_socket_pair_with_grpc_trace_empty_batch_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_empty_batch_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_empty_batch_test.exe
# chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test: chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_test.exe
# chttp2_socket_pair_with_grpc_trace_invoke_large_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_invoke_large_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_invoke_large_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_invoke_large_request_test: chttp2_socket_pair_with_grpc_trace_invoke_large_request_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_invoke_large_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_test.exe
# chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_max_concurrent_streams.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test: chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_test.exe
# chttp2_socket_pair_with_grpc_trace_max_message_length_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_max_message_length_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_max_message_length_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_max_message_length.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_max_message_length_test: chttp2_socket_pair_with_grpc_trace_max_message_length_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_max_message_length_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_max_message_length_test.exe
# chttp2_socket_pair_with_grpc_trace_no_op_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_no_op_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_no_op_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_no_op.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_no_op_test: chttp2_socket_pair_with_grpc_trace_no_op_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_no_op_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_no_op_test.exe
# chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_ping_pong_streaming.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test: chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_test.exe
# chttp2_socket_pair_with_grpc_trace_registered_call_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_registered_call_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_registered_call_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_registered_call.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_registered_call_test: chttp2_socket_pair_with_grpc_trace_registered_call_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_registered_call_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_registered_call_test.exe
# chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test: chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_test.exe
# chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test: chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_test.exe
# chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_response_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test: chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_test.exe
# chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_response_with_payload_and_call_creds.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test: chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_and_call_creds_test.exe
# chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test: chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_test.exe
# chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_test: chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_test.exe
# chttp2_socket_pair_with_grpc_trace_request_with_flags_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_with_flags_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_flags_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_with_flags.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_with_flags_test: chttp2_socket_pair_with_grpc_trace_request_with_flags_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_with_flags_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_flags_test.exe
# chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_with_large_metadata.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test: chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_test.exe
# chttp2_socket_pair_with_grpc_trace_request_with_payload_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_with_payload_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_payload_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_with_payload.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_with_payload_test: chttp2_socket_pair_with_grpc_trace_request_with_payload_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_with_payload_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_payload_test.exe
# chttp2_socket_pair_with_grpc_trace_server_finishes_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_server_finishes_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_server_finishes_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_server_finishes_request_test: chttp2_socket_pair_with_grpc_trace_server_finishes_request_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_server_finishes_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_test.exe
# chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_simple_delayed_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test: chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_test.exe
# chttp2_socket_pair_with_grpc_trace_simple_request_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_simple_request_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_simple_request_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_simple_request.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_simple_request_test: chttp2_socket_pair_with_grpc_trace_simple_request_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_simple_request_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_simple_request_test.exe
# chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/end2end_certs.lib Debug/grpc_test_util.lib Debug/grpc.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test: chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_test.exe
# chttp2_fullstack_bad_hostname_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_bad_hostname_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_bad_hostname_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_bad_hostname.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_bad_hostname_unsecure_test: chttp2_fullstack_bad_hostname_unsecure_test.exe
# 	echo Running chttp2_fullstack_bad_hostname_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_bad_hostname_unsecure_test.exe
# chttp2_fullstack_cancel_after_accept_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_cancel_after_accept_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_cancel_after_accept_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_cancel_after_accept.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_cancel_after_accept_unsecure_test: chttp2_fullstack_cancel_after_accept_unsecure_test.exe
# 	echo Running chttp2_fullstack_cancel_after_accept_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_cancel_after_accept_unsecure_test.exe
# chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test: chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test.exe
# 	echo Running chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_cancel_after_accept_and_writes_closed_unsecure_test.exe
# chttp2_fullstack_cancel_after_invoke_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_cancel_after_invoke_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_cancel_after_invoke_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_cancel_after_invoke.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_cancel_after_invoke_unsecure_test: chttp2_fullstack_cancel_after_invoke_unsecure_test.exe
# 	echo Running chttp2_fullstack_cancel_after_invoke_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_cancel_after_invoke_unsecure_test.exe
# chttp2_fullstack_cancel_before_invoke_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_cancel_before_invoke_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_cancel_before_invoke_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_cancel_before_invoke.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_cancel_before_invoke_unsecure_test: chttp2_fullstack_cancel_before_invoke_unsecure_test.exe
# 	echo Running chttp2_fullstack_cancel_before_invoke_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_cancel_before_invoke_unsecure_test.exe
# chttp2_fullstack_cancel_in_a_vacuum_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_cancel_in_a_vacuum_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_cancel_in_a_vacuum_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_cancel_in_a_vacuum_unsecure_test: chttp2_fullstack_cancel_in_a_vacuum_unsecure_test.exe
# 	echo Running chttp2_fullstack_cancel_in_a_vacuum_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_cancel_in_a_vacuum_unsecure_test.exe
# chttp2_fullstack_census_simple_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_census_simple_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_census_simple_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_census_simple_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_census_simple_request_unsecure_test: chttp2_fullstack_census_simple_request_unsecure_test.exe
# 	echo Running chttp2_fullstack_census_simple_request_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_census_simple_request_unsecure_test.exe
# chttp2_fullstack_disappearing_server_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_disappearing_server_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_disappearing_server_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_disappearing_server.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_disappearing_server_unsecure_test: chttp2_fullstack_disappearing_server_unsecure_test.exe
# 	echo Running chttp2_fullstack_disappearing_server_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_disappearing_server_unsecure_test.exe
# chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test: chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe
# 	echo Running chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe
# chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test: chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test.exe
# 	echo Running chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_early_server_shutdown_finishes_tags_unsecure_test.exe
# chttp2_fullstack_empty_batch_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_empty_batch_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_empty_batch_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_empty_batch.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_empty_batch_unsecure_test: chttp2_fullstack_empty_batch_unsecure_test.exe
# 	echo Running chttp2_fullstack_empty_batch_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_empty_batch_unsecure_test.exe
# chttp2_fullstack_graceful_server_shutdown_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_graceful_server_shutdown_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_graceful_server_shutdown_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_graceful_server_shutdown_unsecure_test: chttp2_fullstack_graceful_server_shutdown_unsecure_test.exe
# 	echo Running chttp2_fullstack_graceful_server_shutdown_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_graceful_server_shutdown_unsecure_test.exe
# chttp2_fullstack_invoke_large_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_invoke_large_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_invoke_large_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_invoke_large_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_invoke_large_request_unsecure_test: chttp2_fullstack_invoke_large_request_unsecure_test.exe
# 	echo Running chttp2_fullstack_invoke_large_request_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_invoke_large_request_unsecure_test.exe
# chttp2_fullstack_max_concurrent_streams_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_max_concurrent_streams_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_max_concurrent_streams_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_max_concurrent_streams.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_max_concurrent_streams_unsecure_test: chttp2_fullstack_max_concurrent_streams_unsecure_test.exe
# 	echo Running chttp2_fullstack_max_concurrent_streams_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_max_concurrent_streams_unsecure_test.exe
# chttp2_fullstack_max_message_length_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_max_message_length_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_max_message_length_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_max_message_length.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_max_message_length_unsecure_test: chttp2_fullstack_max_message_length_unsecure_test.exe
# 	echo Running chttp2_fullstack_max_message_length_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_max_message_length_unsecure_test.exe
# chttp2_fullstack_no_op_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_no_op_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_no_op_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_no_op.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_no_op_unsecure_test: chttp2_fullstack_no_op_unsecure_test.exe
# 	echo Running chttp2_fullstack_no_op_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_no_op_unsecure_test.exe
# chttp2_fullstack_ping_pong_streaming_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_ping_pong_streaming_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_ping_pong_streaming_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_ping_pong_streaming.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_ping_pong_streaming_unsecure_test: chttp2_fullstack_ping_pong_streaming_unsecure_test.exe
# 	echo Running chttp2_fullstack_ping_pong_streaming_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_ping_pong_streaming_unsecure_test.exe
# chttp2_fullstack_registered_call_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_registered_call_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_registered_call_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_registered_call.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_registered_call_unsecure_test: chttp2_fullstack_registered_call_unsecure_test.exe
# 	echo Running chttp2_fullstack_registered_call_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_registered_call_unsecure_test.exe
# chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test: chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_request_response_with_binary_metadata_and_payload_unsecure_test.exe
# chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test: chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_request_response_with_metadata_and_payload_unsecure_test.exe
# chttp2_fullstack_request_response_with_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_response_with_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_response_with_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_response_with_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_response_with_payload_unsecure_test: chttp2_fullstack_request_response_with_payload_unsecure_test.exe
# 	echo Running chttp2_fullstack_request_response_with_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_request_response_with_payload_unsecure_test.exe
# chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test: chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_request_response_with_trailing_metadata_and_payload_unsecure_test.exe
# chttp2_fullstack_request_with_compressed_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_with_compressed_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_with_compressed_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_with_compressed_payload_unsecure_test: chttp2_fullstack_request_with_compressed_payload_unsecure_test.exe
# 	echo Running chttp2_fullstack_request_with_compressed_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_request_with_compressed_payload_unsecure_test.exe
# chttp2_fullstack_request_with_flags_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_with_flags_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_with_flags_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_with_flags.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_with_flags_unsecure_test: chttp2_fullstack_request_with_flags_unsecure_test.exe
# 	echo Running chttp2_fullstack_request_with_flags_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_request_with_flags_unsecure_test.exe
# chttp2_fullstack_request_with_large_metadata_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_with_large_metadata_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_with_large_metadata_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_with_large_metadata.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_with_large_metadata_unsecure_test: chttp2_fullstack_request_with_large_metadata_unsecure_test.exe
# 	echo Running chttp2_fullstack_request_with_large_metadata_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_request_with_large_metadata_unsecure_test.exe
# chttp2_fullstack_request_with_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_request_with_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_request_with_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_request_with_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_request_with_payload_unsecure_test: chttp2_fullstack_request_with_payload_unsecure_test.exe
# 	echo Running chttp2_fullstack_request_with_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_request_with_payload_unsecure_test.exe
# chttp2_fullstack_server_finishes_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_server_finishes_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_server_finishes_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_server_finishes_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_server_finishes_request_unsecure_test: chttp2_fullstack_server_finishes_request_unsecure_test.exe
# 	echo Running chttp2_fullstack_server_finishes_request_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_server_finishes_request_unsecure_test.exe
# chttp2_fullstack_simple_delayed_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_simple_delayed_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_simple_delayed_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_simple_delayed_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_simple_delayed_request_unsecure_test: chttp2_fullstack_simple_delayed_request_unsecure_test.exe
# 	echo Running chttp2_fullstack_simple_delayed_request_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_simple_delayed_request_unsecure_test.exe
# chttp2_fullstack_simple_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_simple_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_simple_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_simple_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_simple_request_unsecure_test: chttp2_fullstack_simple_request_unsecure_test.exe
# 	echo Running chttp2_fullstack_simple_request_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_simple_request_unsecure_test.exe
# chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test: chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test.exe
# 	echo Running chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_simple_request_with_high_initial_sequence_number_unsecure_test.exe
# chttp2_fullstack_compression_bad_hostname_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_bad_hostname_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_bad_hostname_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_bad_hostname.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_bad_hostname_unsecure_test: chttp2_fullstack_compression_bad_hostname_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_bad_hostname_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_bad_hostname_unsecure_test.exe
# chttp2_fullstack_compression_cancel_after_accept_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_cancel_after_accept_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_cancel_after_accept_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_cancel_after_accept.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_cancel_after_accept_unsecure_test: chttp2_fullstack_compression_cancel_after_accept_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_cancel_after_accept_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_cancel_after_accept_unsecure_test.exe
# chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_unsecure_test: chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_cancel_after_accept_and_writes_closed_unsecure_test.exe
# chttp2_fullstack_compression_cancel_after_invoke_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_cancel_after_invoke_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_cancel_after_invoke_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_cancel_after_invoke.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_cancel_after_invoke_unsecure_test: chttp2_fullstack_compression_cancel_after_invoke_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_cancel_after_invoke_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_cancel_after_invoke_unsecure_test.exe
# chttp2_fullstack_compression_cancel_before_invoke_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_cancel_before_invoke_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_cancel_before_invoke_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_cancel_before_invoke.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_cancel_before_invoke_unsecure_test: chttp2_fullstack_compression_cancel_before_invoke_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_cancel_before_invoke_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_cancel_before_invoke_unsecure_test.exe
# chttp2_fullstack_compression_cancel_in_a_vacuum_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_cancel_in_a_vacuum_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_cancel_in_a_vacuum_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_cancel_in_a_vacuum_unsecure_test: chttp2_fullstack_compression_cancel_in_a_vacuum_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_cancel_in_a_vacuum_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_cancel_in_a_vacuum_unsecure_test.exe
# chttp2_fullstack_compression_census_simple_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_census_simple_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_census_simple_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_census_simple_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_census_simple_request_unsecure_test: chttp2_fullstack_compression_census_simple_request_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_census_simple_request_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_census_simple_request_unsecure_test.exe
# chttp2_fullstack_compression_disappearing_server_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_disappearing_server_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_disappearing_server_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_disappearing_server.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_disappearing_server_unsecure_test: chttp2_fullstack_compression_disappearing_server_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_disappearing_server_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_disappearing_server_unsecure_test.exe
# chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_unsecure_test: chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe
# chttp2_fullstack_compression_early_server_shutdown_finishes_tags_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_early_server_shutdown_finishes_tags_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_early_server_shutdown_finishes_tags_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_early_server_shutdown_finishes_tags_unsecure_test: chttp2_fullstack_compression_early_server_shutdown_finishes_tags_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_early_server_shutdown_finishes_tags_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_early_server_shutdown_finishes_tags_unsecure_test.exe
# chttp2_fullstack_compression_empty_batch_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_empty_batch_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_empty_batch_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_empty_batch.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_empty_batch_unsecure_test: chttp2_fullstack_compression_empty_batch_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_empty_batch_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_empty_batch_unsecure_test.exe
# chttp2_fullstack_compression_graceful_server_shutdown_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_graceful_server_shutdown_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_graceful_server_shutdown_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_graceful_server_shutdown_unsecure_test: chttp2_fullstack_compression_graceful_server_shutdown_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_graceful_server_shutdown_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_graceful_server_shutdown_unsecure_test.exe
# chttp2_fullstack_compression_invoke_large_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_invoke_large_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_invoke_large_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_invoke_large_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_invoke_large_request_unsecure_test: chttp2_fullstack_compression_invoke_large_request_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_invoke_large_request_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_invoke_large_request_unsecure_test.exe
# chttp2_fullstack_compression_max_concurrent_streams_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_max_concurrent_streams_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_max_concurrent_streams_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_max_concurrent_streams.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_max_concurrent_streams_unsecure_test: chttp2_fullstack_compression_max_concurrent_streams_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_max_concurrent_streams_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_max_concurrent_streams_unsecure_test.exe
# chttp2_fullstack_compression_max_message_length_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_max_message_length_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_max_message_length_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_max_message_length.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_max_message_length_unsecure_test: chttp2_fullstack_compression_max_message_length_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_max_message_length_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_max_message_length_unsecure_test.exe
# chttp2_fullstack_compression_no_op_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_no_op_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_no_op_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_no_op.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_no_op_unsecure_test: chttp2_fullstack_compression_no_op_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_no_op_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_no_op_unsecure_test.exe
# chttp2_fullstack_compression_ping_pong_streaming_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_ping_pong_streaming_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_ping_pong_streaming_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_ping_pong_streaming.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_ping_pong_streaming_unsecure_test: chttp2_fullstack_compression_ping_pong_streaming_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_ping_pong_streaming_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_ping_pong_streaming_unsecure_test.exe
# chttp2_fullstack_compression_registered_call_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_registered_call_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_registered_call_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_registered_call.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_registered_call_unsecure_test: chttp2_fullstack_compression_registered_call_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_registered_call_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_registered_call_unsecure_test.exe
# chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_unsecure_test: chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_binary_metadata_and_payload_unsecure_test.exe
# chttp2_fullstack_compression_request_response_with_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_response_with_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_response_with_metadata_and_payload_unsecure_test: chttp2_fullstack_compression_request_response_with_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_request_response_with_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_metadata_and_payload_unsecure_test.exe
# chttp2_fullstack_compression_request_response_with_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_response_with_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_response_with_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_response_with_payload_unsecure_test: chttp2_fullstack_compression_request_response_with_payload_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_request_response_with_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_payload_unsecure_test.exe
# chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_unsecure_test: chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_response_with_trailing_metadata_and_payload_unsecure_test.exe
# chttp2_fullstack_compression_request_with_compressed_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_with_compressed_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_with_compressed_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_with_compressed_payload_unsecure_test: chttp2_fullstack_compression_request_with_compressed_payload_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_request_with_compressed_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_with_compressed_payload_unsecure_test.exe
# chttp2_fullstack_compression_request_with_flags_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_with_flags_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_with_flags_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_with_flags.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_with_flags_unsecure_test: chttp2_fullstack_compression_request_with_flags_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_request_with_flags_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_with_flags_unsecure_test.exe
# chttp2_fullstack_compression_request_with_large_metadata_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_with_large_metadata_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_with_large_metadata_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_with_large_metadata.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_with_large_metadata_unsecure_test: chttp2_fullstack_compression_request_with_large_metadata_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_request_with_large_metadata_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_with_large_metadata_unsecure_test.exe
# chttp2_fullstack_compression_request_with_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_request_with_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_request_with_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_request_with_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_request_with_payload_unsecure_test: chttp2_fullstack_compression_request_with_payload_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_request_with_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_request_with_payload_unsecure_test.exe
# chttp2_fullstack_compression_server_finishes_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_server_finishes_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_server_finishes_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_server_finishes_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_server_finishes_request_unsecure_test: chttp2_fullstack_compression_server_finishes_request_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_server_finishes_request_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_server_finishes_request_unsecure_test.exe
# chttp2_fullstack_compression_simple_delayed_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_simple_delayed_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_simple_delayed_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_simple_delayed_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_simple_delayed_request_unsecure_test: chttp2_fullstack_compression_simple_delayed_request_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_simple_delayed_request_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_simple_delayed_request_unsecure_test.exe
# chttp2_fullstack_compression_simple_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_simple_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_simple_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_simple_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_simple_request_unsecure_test: chttp2_fullstack_compression_simple_request_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_simple_request_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_simple_request_unsecure_test.exe
# chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_unsecure_test.exe" Debug/end2end_fixture_chttp2_fullstack_compression.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_unsecure_test: chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_unsecure_test.exe
# 	echo Running chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_unsecure_test
# 	$(OUT_DIR)/chttp2_fullstack_compression_simple_request_with_high_initial_sequence_number_unsecure_test.exe
# chttp2_socket_pair_bad_hostname_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_bad_hostname_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_bad_hostname_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_bad_hostname.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_bad_hostname_unsecure_test: chttp2_socket_pair_bad_hostname_unsecure_test.exe
# 	echo Running chttp2_socket_pair_bad_hostname_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_bad_hostname_unsecure_test.exe
# chttp2_socket_pair_cancel_after_accept_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_cancel_after_accept_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_cancel_after_accept_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_cancel_after_accept.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_cancel_after_accept_unsecure_test: chttp2_socket_pair_cancel_after_accept_unsecure_test.exe
# 	echo Running chttp2_socket_pair_cancel_after_accept_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_cancel_after_accept_unsecure_test.exe
# chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test: chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test.exe
# 	echo Running chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_cancel_after_accept_and_writes_closed_unsecure_test.exe
# chttp2_socket_pair_cancel_after_invoke_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_cancel_after_invoke_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_cancel_after_invoke_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_cancel_after_invoke.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_cancel_after_invoke_unsecure_test: chttp2_socket_pair_cancel_after_invoke_unsecure_test.exe
# 	echo Running chttp2_socket_pair_cancel_after_invoke_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_cancel_after_invoke_unsecure_test.exe
# chttp2_socket_pair_cancel_before_invoke_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_cancel_before_invoke_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_cancel_before_invoke_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_cancel_before_invoke.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_cancel_before_invoke_unsecure_test: chttp2_socket_pair_cancel_before_invoke_unsecure_test.exe
# 	echo Running chttp2_socket_pair_cancel_before_invoke_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_cancel_before_invoke_unsecure_test.exe
# chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test: chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test.exe
# 	echo Running chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_cancel_in_a_vacuum_unsecure_test.exe
# chttp2_socket_pair_census_simple_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_census_simple_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_census_simple_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_census_simple_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_census_simple_request_unsecure_test: chttp2_socket_pair_census_simple_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_census_simple_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_census_simple_request_unsecure_test.exe
# chttp2_socket_pair_disappearing_server_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_disappearing_server_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_disappearing_server_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_disappearing_server.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_disappearing_server_unsecure_test: chttp2_socket_pair_disappearing_server_unsecure_test.exe
# 	echo Running chttp2_socket_pair_disappearing_server_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_disappearing_server_unsecure_test.exe
# chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test: chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe
# 	echo Running chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe
# chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test: chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test.exe
# 	echo Running chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_early_server_shutdown_finishes_tags_unsecure_test.exe
# chttp2_socket_pair_empty_batch_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_empty_batch_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_empty_batch_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_empty_batch.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_empty_batch_unsecure_test: chttp2_socket_pair_empty_batch_unsecure_test.exe
# 	echo Running chttp2_socket_pair_empty_batch_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_empty_batch_unsecure_test.exe
# chttp2_socket_pair_graceful_server_shutdown_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_graceful_server_shutdown_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_graceful_server_shutdown_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_graceful_server_shutdown_unsecure_test: chttp2_socket_pair_graceful_server_shutdown_unsecure_test.exe
# 	echo Running chttp2_socket_pair_graceful_server_shutdown_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_graceful_server_shutdown_unsecure_test.exe
# chttp2_socket_pair_invoke_large_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_invoke_large_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_invoke_large_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_invoke_large_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_invoke_large_request_unsecure_test: chttp2_socket_pair_invoke_large_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_invoke_large_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_invoke_large_request_unsecure_test.exe
# chttp2_socket_pair_max_concurrent_streams_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_max_concurrent_streams_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_max_concurrent_streams_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_max_concurrent_streams.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_max_concurrent_streams_unsecure_test: chttp2_socket_pair_max_concurrent_streams_unsecure_test.exe
# 	echo Running chttp2_socket_pair_max_concurrent_streams_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_max_concurrent_streams_unsecure_test.exe
# chttp2_socket_pair_max_message_length_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_max_message_length_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_max_message_length_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_max_message_length.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_max_message_length_unsecure_test: chttp2_socket_pair_max_message_length_unsecure_test.exe
# 	echo Running chttp2_socket_pair_max_message_length_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_max_message_length_unsecure_test.exe
# chttp2_socket_pair_no_op_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_no_op_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_no_op_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_no_op.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_no_op_unsecure_test: chttp2_socket_pair_no_op_unsecure_test.exe
# 	echo Running chttp2_socket_pair_no_op_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_no_op_unsecure_test.exe
# chttp2_socket_pair_ping_pong_streaming_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_ping_pong_streaming_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_ping_pong_streaming_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_ping_pong_streaming.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_ping_pong_streaming_unsecure_test: chttp2_socket_pair_ping_pong_streaming_unsecure_test.exe
# 	echo Running chttp2_socket_pair_ping_pong_streaming_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_ping_pong_streaming_unsecure_test.exe
# chttp2_socket_pair_registered_call_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_registered_call_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_registered_call_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_registered_call.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_registered_call_unsecure_test: chttp2_socket_pair_registered_call_unsecure_test.exe
# 	echo Running chttp2_socket_pair_registered_call_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_registered_call_unsecure_test.exe
# chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test: chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_response_with_binary_metadata_and_payload_unsecure_test.exe
# chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test: chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_response_with_metadata_and_payload_unsecure_test.exe
# chttp2_socket_pair_request_response_with_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_response_with_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_response_with_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_response_with_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_response_with_payload_unsecure_test: chttp2_socket_pair_request_response_with_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_request_response_with_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_response_with_payload_unsecure_test.exe
# chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test: chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_response_with_trailing_metadata_and_payload_unsecure_test.exe
# chttp2_socket_pair_request_with_compressed_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_with_compressed_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_with_compressed_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_with_compressed_payload_unsecure_test: chttp2_socket_pair_request_with_compressed_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_request_with_compressed_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_with_compressed_payload_unsecure_test.exe
# chttp2_socket_pair_request_with_flags_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_with_flags_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_with_flags_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_with_flags.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_with_flags_unsecure_test: chttp2_socket_pair_request_with_flags_unsecure_test.exe
# 	echo Running chttp2_socket_pair_request_with_flags_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_with_flags_unsecure_test.exe
# chttp2_socket_pair_request_with_large_metadata_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_with_large_metadata_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_with_large_metadata_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_with_large_metadata.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_with_large_metadata_unsecure_test: chttp2_socket_pair_request_with_large_metadata_unsecure_test.exe
# 	echo Running chttp2_socket_pair_request_with_large_metadata_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_with_large_metadata_unsecure_test.exe
# chttp2_socket_pair_request_with_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_request_with_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_request_with_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_request_with_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_request_with_payload_unsecure_test: chttp2_socket_pair_request_with_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_request_with_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_request_with_payload_unsecure_test.exe
# chttp2_socket_pair_server_finishes_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_server_finishes_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_server_finishes_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_server_finishes_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_server_finishes_request_unsecure_test: chttp2_socket_pair_server_finishes_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_server_finishes_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_server_finishes_request_unsecure_test.exe
# chttp2_socket_pair_simple_delayed_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_simple_delayed_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_simple_delayed_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_simple_delayed_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_simple_delayed_request_unsecure_test: chttp2_socket_pair_simple_delayed_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_simple_delayed_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_simple_delayed_request_unsecure_test.exe
# chttp2_socket_pair_simple_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_simple_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_simple_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_simple_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_simple_request_unsecure_test: chttp2_socket_pair_simple_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_simple_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_simple_request_unsecure_test.exe
# chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test: chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test.exe
# 	echo Running chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_simple_request_with_high_initial_sequence_number_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_bad_hostname.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_bad_hostname_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_cancel_after_accept.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_accept_and_writes_closed_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_cancel_after_invoke.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_after_invoke_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_cancel_before_invoke.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_before_invoke_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_cancel_in_a_vacuum_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_census_simple_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_census_simple_request_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_disappearing_server.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_disappearing_server_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_early_server_shutdown_finishes_tags_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_empty_batch.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_empty_batch_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_graceful_server_shutdown_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_invoke_large_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_invoke_large_request_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_max_concurrent_streams.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_max_concurrent_streams_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_max_message_length.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_max_message_length_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_no_op.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_no_op_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_ping_pong_streaming.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_ping_pong_streaming_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_registered_call.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_registered_call_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_binary_metadata_and_payload_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_metadata_and_payload_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_response_with_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_payload_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_response_with_trailing_metadata_and_payload_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_compressed_payload_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_with_flags_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_with_flags_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_flags_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_with_flags.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_with_flags_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_request_with_flags_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_with_flags_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_flags_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_with_large_metadata.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_large_metadata_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_request_with_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_request_with_payload_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_server_finishes_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_server_finishes_request_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_simple_delayed_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_simple_delayed_request_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_simple_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_simple_request_unsecure_test.exe
# chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_one_byte_at_a_time.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test: chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test.exe
# 	echo Running chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_one_byte_at_a_time_simple_request_with_high_initial_sequence_number_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_bad_hostname.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test: chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_bad_hostname_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_cancel_after_accept.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test: chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_cancel_after_accept_and_writes_closed.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test: chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_after_accept_and_writes_closed_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_cancel_after_invoke.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test: chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_after_invoke_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_cancel_before_invoke.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test: chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_before_invoke_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_cancel_in_a_vacuum.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test: chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_cancel_in_a_vacuum_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_census_simple_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test: chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_census_simple_request_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_disappearing_server.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test: chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_disappearing_server_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_early_server_shutdown_finishes_inflight_calls.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test: chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_inflight_calls_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_early_server_shutdown_finishes_tags.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test: chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_early_server_shutdown_finishes_tags_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_empty_batch.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test: chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_empty_batch_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_graceful_server_shutdown.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test: chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_graceful_server_shutdown_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_invoke_large_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test: chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_invoke_large_request_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_max_concurrent_streams.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test: chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_max_concurrent_streams_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_max_message_length.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test: chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_max_message_length_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_no_op.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test: chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_no_op_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_ping_pong_streaming.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test: chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_ping_pong_streaming_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_registered_call.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test: chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_registered_call_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_response_with_binary_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test: chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_binary_metadata_and_payload_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_response_with_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test: chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_metadata_and_payload_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_response_with_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test: chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_payload_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_response_with_trailing_metadata_and_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test: chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_response_with_trailing_metadata_and_payload_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_with_compressed_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_unsecure_test: chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_compressed_payload_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_request_with_flags_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_with_flags_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_flags_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_with_flags.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_with_flags_unsecure_test: chttp2_socket_pair_with_grpc_trace_request_with_flags_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_with_flags_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_flags_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_with_large_metadata.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test: chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_large_metadata_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_request_with_payload.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test: chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_request_with_payload_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_server_finishes_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test: chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_server_finishes_request_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_simple_delayed_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test: chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_simple_delayed_request_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_simple_request.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test: chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_simple_request_unsecure_test.exe
# chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test.exe: build_libs $(OUT_DIR)
# 	echo Building chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/vsprojects/dummy.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test.exe" Debug/end2end_fixture_chttp2_socket_pair_with_grpc_trace.lib Debug/end2end_test_simple_request_with_high_initial_sequence_number.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/dummy.obj
# chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test: chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test.exe
# 	echo Running chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test
# 	$(OUT_DIR)/chttp2_socket_pair_with_grpc_trace_simple_request_with_high_initial_sequence_number_unsecure_test.exe
# connection_prefix_bad_client_test.exe: build_libs $(OUT_DIR)
# 	echo Building connection_prefix_bad_client_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/test/core/bad_client/tests/connection_prefix.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/connection_prefix_bad_client_test.exe" Debug/bad_client_test.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/connection_prefix.obj
# connection_prefix_bad_client_test: connection_prefix_bad_client_test.exe
# 	echo Running connection_prefix_bad_client_test
# 	$(OUT_DIR)/connection_prefix_bad_client_test.exe
# initial_settings_frame_bad_client_test.exe: build_libs $(OUT_DIR)
# 	echo Building initial_settings_frame_bad_client_test
# 	$(CC) $(CFLAGS) /Fo:$(OUT_DIR)/ $(REPO_ROOT)/test/core/bad_client/tests/initial_settings_frame.c
# 	$(LINK) $(LFLAGS) /OUT:"$(OUT_DIR)/initial_settings_frame_bad_client_test.exe" Debug/bad_client_test.lib Debug/grpc_test_util_unsecure.lib Debug/grpc_unsecure.lib Debug/gpr_test_util.lib Debug/gpr.lib $(LIBS) $(OUT_DIR)/initial_settings_frame.obj
# initial_settings_frame_bad_client_test: initial_settings_frame_bad_client_test.exe
# 	echo Running initial_settings_frame_bad_client_test
# 	$(OUT_DIR)/initial_settings_frame_bad_client_test.exe
