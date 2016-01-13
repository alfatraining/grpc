
list(APPEND census_public_headers
	"${CMAKE_SOURCE_DIR}/include/grpc/census.h"
	)

list(APPEND census_headers
	"${CMAKE_SOURCE_DIR}/src/core/census/aggregation.h"
	"${CMAKE_SOURCE_DIR}/src/core/census/context.h"
	"${CMAKE_SOURCE_DIR}/src/core/census/rpc_metric_id.h"
	)

list(APPEND census_srcs
	"${CMAKE_SOURCE_DIR}/src/core/census/context.c"
	"${CMAKE_SOURCE_DIR}/src/core/census/initialize.c"
	"${CMAKE_SOURCE_DIR}/src/core/census/operation.c"
	"${CMAKE_SOURCE_DIR}/src/core/census/tracing.c"
	)

list(APPEND filegroup_census
	${census_public_headers}
	${census_headers}
	${census_srcs})

# ========================================================

list(APPEND grpcpp_base_public_headers
	"${CMAKE_SOURCE_DIR}/include/grpc++/channel.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/client_context.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/completion_queue.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/create_channel.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/generic/async_generic_service.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/generic/generic_stub.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/grpc++.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/call.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/client_unary_call.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/grpc_library.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/proto_utils.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/rpc_method.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/rpc_service_method.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/serialization_traits.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/server_builder_option.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/service_type.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/sync.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/sync_cxx11.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/sync_no_cxx11.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/thd.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/thd_cxx11.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/impl/thd_no_cxx11.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/security/auth_context.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/security/auth_metadata_processor.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/security/credentials.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/security/server_credentials.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/server.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/server_builder.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/server_context.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/async_stream.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/async_unary_call.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/byte_buffer.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/channel_arguments.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/config.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/config_protobuf.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/slice.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/status.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/status_code_enum.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/string_ref.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/stub_options.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/sync_stream.h"
	"${CMAKE_SOURCE_DIR}/include/grpc++/support/time.h"
	)

list(APPEND grpcpp_base_headers
	"${CMAKE_SOURCE_DIR}/src/cpp/client/create_channel_internal.h"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/create_auth_context.h"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/dynamic_thread_pool.h"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/fixed_size_thread_pool.h"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/thread_pool_interface.h"
	)

list(APPEND grpcpp_base_srcs
	"${CMAKE_SOURCE_DIR}/src/cpp/client/channel.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/client/client_context.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/client/create_channel.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/client/create_channel_internal.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/client/credentials.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/client/generic_stub.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/client/insecure_credentials.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/call.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/channel_arguments.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/completion_queue.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/rpc_method.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/proto/proto_utils.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/async_generic_service.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/create_default_thread_pool.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/dynamic_thread_pool.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/fixed_size_thread_pool.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/insecure_server_credentials.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/server.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/server_builder.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/server_context.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/server_credentials.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/util/byte_buffer.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/util/slice.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/util/status.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/util/string_ref.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/util/time.cc"
	)

list(APPEND filegroup_grpcpp_base
	${grpcpp_base_public_headers}
	${grpcpp_base_headers}
	${grpcpp_base_srcs}
	)

# ========================================================

list(APPEND grpcpp_headers
	"${CMAKE_SOURCE_DIR}/src/cpp/client/secure_credentials.h"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/secure_auth_context.h"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/secure_server_credentials.h"
	)

list(APPEND grpcpp_srcs
	"${CMAKE_SOURCE_DIR}/src/cpp/client/secure_credentials.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/auth_property_iterator.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/secure_auth_context.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/secure_channel_arguments.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/common/secure_create_auth_context.cc"
	"${CMAKE_SOURCE_DIR}/src/cpp/server/secure_server_credentials.cc"
	)

list(APPEND filegroup_grpcpp
	${grpcpp_headers}
	${grpcpp_srcs}
	${filegroup_grpcpp_base}
	)

# ========================================================

list(APPEND grpc_base_public_headers
	"${CMAKE_SOURCE_DIR}/include/grpc/byte_buffer.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/byte_buffer_reader.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/compression.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/grpc.h"
	"${CMAKE_SOURCE_DIR}/include/grpc/status.h"
	)

list(APPEND grpc_base_headers
	"${CMAKE_SOURCE_DIR}/src/core/census/grpc_filter.h"
	"${CMAKE_SOURCE_DIR}/src/core/channel/channel_args.h"
	"${CMAKE_SOURCE_DIR}/src/core/channel/channel_stack.h"
	"${CMAKE_SOURCE_DIR}/src/core/channel/client_channel.h"
	"${CMAKE_SOURCE_DIR}/src/core/channel/client_uchannel.h"
	"${CMAKE_SOURCE_DIR}/src/core/channel/compress_filter.h"
	"${CMAKE_SOURCE_DIR}/src/core/channel/connected_channel.h"
	"${CMAKE_SOURCE_DIR}/src/core/channel/context.h"
	"${CMAKE_SOURCE_DIR}/src/core/channel/http_client_filter.h"
	"${CMAKE_SOURCE_DIR}/src/core/channel/http_server_filter.h"
	"${CMAKE_SOURCE_DIR}/src/core/channel/subchannel_call_holder.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/client_config.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/connector.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/initial_connect_string.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/lb_policies/pick_first.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/lb_policies/round_robin.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/lb_policy.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/lb_policy_factory.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/lb_policy_registry.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/resolver.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/resolver_factory.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/resolver_registry.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/resolvers/dns_resolver.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/resolvers/sockaddr_resolver.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/subchannel.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/subchannel_factory.h"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/uri_parser.h"
	"${CMAKE_SOURCE_DIR}/src/core/compression/algorithm_metadata.h"
	"${CMAKE_SOURCE_DIR}/src/core/compression/message_compress.h"
	"${CMAKE_SOURCE_DIR}/src/core/debug/trace.h"
	"${CMAKE_SOURCE_DIR}/src/core/httpcli/format_request.h"
	"${CMAKE_SOURCE_DIR}/src/core/httpcli/httpcli.h"
	"${CMAKE_SOURCE_DIR}/src/core/httpcli/parser.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/closure.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/endpoint.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/endpoint_pair.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/exec_ctx.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/executor.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/fd_posix.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/iocp_windows.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/iomgr.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/iomgr_internal.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/iomgr_posix.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/pollset.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/pollset_posix.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/pollset_set.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/pollset_set_posix.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/pollset_set_windows.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/pollset_windows.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/resolve_address.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/sockaddr.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/sockaddr_posix.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/sockaddr_utils.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/sockaddr_win32.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/socket_utils_posix.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/socket_windows.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/tcp_client.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/tcp_posix.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/tcp_server.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/tcp_windows.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/time_averaged_stats.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/timer.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/timer_heap.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/timer_internal.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/udp_server.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/wakeup_fd_pipe.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/wakeup_fd_posix.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/workqueue.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/workqueue_posix.h"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/workqueue_windows.h"
	"${CMAKE_SOURCE_DIR}/src/core/json/json.h"
	"${CMAKE_SOURCE_DIR}/src/core/json/json_common.h"
	"${CMAKE_SOURCE_DIR}/src/core/json/json_reader.h"
	"${CMAKE_SOURCE_DIR}/src/core/json/json_writer.h"
	"${CMAKE_SOURCE_DIR}/src/core/statistics/census_interface.h"
	"${CMAKE_SOURCE_DIR}/src/core/statistics/census_rpc_stats.h"
	"${CMAKE_SOURCE_DIR}/src/core/surface/api_trace.h"
	"${CMAKE_SOURCE_DIR}/src/core/surface/call.h"
	"${CMAKE_SOURCE_DIR}/src/core/surface/call_test_only.h"
	"${CMAKE_SOURCE_DIR}/src/core/surface/channel.h"
	"${CMAKE_SOURCE_DIR}/src/core/surface/completion_queue.h"
	"${CMAKE_SOURCE_DIR}/src/core/surface/event_string.h"
	"${CMAKE_SOURCE_DIR}/src/core/surface/init.h"
	"${CMAKE_SOURCE_DIR}/src/core/surface/server.h"
	"${CMAKE_SOURCE_DIR}/src/core/surface/surface_trace.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/byte_stream.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/alpn.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/bin_encoder.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame_data.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame_goaway.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame_ping.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame_rst_stream.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame_settings.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame_window_update.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/hpack_encoder.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/hpack_parser.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/hpack_table.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/http2_errors.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/huffsyms.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/incoming_metadata.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/internal.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/status_conversion.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/stream_map.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/timeout_encoding.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/varint.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2_transport.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/connectivity_state.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/metadata.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/metadata_batch.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/static_metadata.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/transport.h"
	"${CMAKE_SOURCE_DIR}/src/core/transport/transport_impl.h"
	)

list(APPEND grpc_base_srcs
	"${CMAKE_SOURCE_DIR}/src/core/census/grpc_context.c"
	"${CMAKE_SOURCE_DIR}/src/core/census/grpc_filter.c"
	"${CMAKE_SOURCE_DIR}/src/core/channel/channel_args.c"
	"${CMAKE_SOURCE_DIR}/src/core/channel/channel_stack.c"
	"${CMAKE_SOURCE_DIR}/src/core/channel/client_channel.c"
	"${CMAKE_SOURCE_DIR}/src/core/channel/client_uchannel.c"
	"${CMAKE_SOURCE_DIR}/src/core/channel/compress_filter.c"
	"${CMAKE_SOURCE_DIR}/src/core/channel/connected_channel.c"
	"${CMAKE_SOURCE_DIR}/src/core/channel/http_client_filter.c"
	"${CMAKE_SOURCE_DIR}/src/core/channel/http_server_filter.c"
	"${CMAKE_SOURCE_DIR}/src/core/channel/subchannel_call_holder.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/client_config.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/connector.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/default_initial_connect_string.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/initial_connect_string.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/lb_policies/pick_first.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/lb_policies/round_robin.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/lb_policy.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/lb_policy_factory.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/lb_policy_registry.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/resolver.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/resolver_factory.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/resolver_registry.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/resolvers/dns_resolver.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/resolvers/sockaddr_resolver.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/subchannel.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/subchannel_factory.c"
	"${CMAKE_SOURCE_DIR}/src/core/client_config/uri_parser.c"
	"${CMAKE_SOURCE_DIR}/src/core/compression/algorithm.c"
	"${CMAKE_SOURCE_DIR}/src/core/compression/message_compress.c"
	"${CMAKE_SOURCE_DIR}/src/core/debug/trace.c"
	"${CMAKE_SOURCE_DIR}/src/core/httpcli/format_request.c"
	"${CMAKE_SOURCE_DIR}/src/core/httpcli/httpcli.c"
	"${CMAKE_SOURCE_DIR}/src/core/httpcli/parser.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/closure.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/endpoint.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/endpoint_pair_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/endpoint_pair_windows.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/exec_ctx.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/executor.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/fd_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/iocp_windows.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/iomgr.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/iomgr_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/iomgr_windows.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/pollset_multipoller_with_epoll.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/pollset_multipoller_with_poll_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/pollset_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/pollset_set_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/pollset_set_windows.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/pollset_windows.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/resolve_address_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/resolve_address_windows.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/sockaddr_utils.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/socket_utils_common_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/socket_utils_linux.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/socket_utils_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/socket_windows.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/tcp_client_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/tcp_client_windows.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/tcp_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/tcp_server_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/tcp_server_windows.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/tcp_windows.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/time_averaged_stats.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/timer.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/timer_heap.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/udp_server.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/wakeup_fd_eventfd.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/wakeup_fd_nospecial.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/wakeup_fd_pipe.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/wakeup_fd_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/workqueue_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/iomgr/workqueue_windows.c"
	"${CMAKE_SOURCE_DIR}/src/core/json/json.c"
	"${CMAKE_SOURCE_DIR}/src/core/json/json_reader.c"
	"${CMAKE_SOURCE_DIR}/src/core/json/json_string.c"
	"${CMAKE_SOURCE_DIR}/src/core/json/json_writer.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/api_trace.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/byte_buffer.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/byte_buffer_reader.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/call.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/call_details.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/call_log_batch.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/channel.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/channel_connectivity.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/channel_create.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/channel_ping.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/completion_queue.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/event_string.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/init.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/lame_client.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/metadata_array.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/server.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/server_chttp2.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/server_create.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/validate_metadata.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/version.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/byte_stream.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/alpn.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/bin_encoder.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame_data.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame_goaway.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame_ping.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame_rst_stream.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame_settings.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/frame_window_update.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/hpack_encoder.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/hpack_parser.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/hpack_table.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/huffsyms.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/incoming_metadata.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/parsing.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/status_conversion.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/stream_lists.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/stream_map.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/timeout_encoding.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/varint.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2/writing.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/chttp2_transport.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/connectivity_state.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/metadata.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/metadata_batch.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/static_metadata.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/transport.c"
	"${CMAKE_SOURCE_DIR}/src/core/transport/transport_op_string.c"
	)

list(APPEND filegroup_grpc_base
	${grpc_base_public_headers}
	${grpc_base_headers}
	${grpc_base_srcs}
	)

# ========================================================

list(APPEND grpc_test_util_base_headers
	"${CMAKE_SOURCE_DIR}/test/core/end2end/cq_verifier.h"
	"${CMAKE_SOURCE_DIR}/test/core/end2end/fixtures/proxy.h"
	"${CMAKE_SOURCE_DIR}/test/core/iomgr/endpoint_tests.h"
	"${CMAKE_SOURCE_DIR}/test/core/util/grpc_profiler.h"
	"${CMAKE_SOURCE_DIR}/test/core/util/parse_hexstring.h"
	"${CMAKE_SOURCE_DIR}/test/core/util/port.h"
	"${CMAKE_SOURCE_DIR}/test/core/util/slice_splitter.h"
	)

list(APPEND grpc_test_util_base_srcs
	"${CMAKE_SOURCE_DIR}/test/core/end2end/cq_verifier.c"
	"${CMAKE_SOURCE_DIR}/test/core/end2end/fixtures/proxy.c"
	"${CMAKE_SOURCE_DIR}/test/core/iomgr/endpoint_tests.c"
	"${CMAKE_SOURCE_DIR}/test/core/util/grpc_profiler.c"
	"${CMAKE_SOURCE_DIR}/test/core/util/parse_hexstring.c"
	"${CMAKE_SOURCE_DIR}/test/core/util/port_posix.c"
	"${CMAKE_SOURCE_DIR}/test/core/util/port_windows.c"
	"${CMAKE_SOURCE_DIR}/test/core/util/slice_splitter.c"
	)

list(APPEND filegroup_grpc_test_util_base
	${grpc_test_util_base_headers}
	${grpc_test_util_base_srcs})

# ========================================================

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

list(APPEND gpr_headers
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

list(APPEND filegroup_gpr
	${gpr_public_headers}
	${gpr_headers}
	${gpr_srcs}
	)

# ========================================================

list(APPEND gpr_test_util_headers
	"${CMAKE_SOURCE_DIR}/test/core/util/test_config.h"
	)

list(APPEND gpr_test_util_srcs
	"${CMAKE_SOURCE_DIR}/test/core/util/test_config.c"
	)

list(APPEND filegroup_gpr_test_util
	${gpr_test_util_headers}
	${gpr_test_util_srcs})

# ========================================================

list(APPEND grpc_public_headers
	"${CMAKE_SOURCE_DIR}/include/grpc/grpc_security.h"
	)

list(APPEND grpc_headers
	"${CMAKE_SOURCE_DIR}/src/core/security/auth_filters.h"
	"${CMAKE_SOURCE_DIR}/src/core/security/base64.h"
	"${CMAKE_SOURCE_DIR}/src/core/security/credentials.h"
	"${CMAKE_SOURCE_DIR}/src/core/security/handshake.h"
	"${CMAKE_SOURCE_DIR}/src/core/security/json_token.h"
	"${CMAKE_SOURCE_DIR}/src/core/security/jwt_verifier.h"
	"${CMAKE_SOURCE_DIR}/src/core/security/secure_endpoint.h"
	"${CMAKE_SOURCE_DIR}/src/core/security/security_connector.h"
	"${CMAKE_SOURCE_DIR}/src/core/security/security_context.h"
	"${CMAKE_SOURCE_DIR}/src/core/tsi/fake_transport_security.h"
	"${CMAKE_SOURCE_DIR}/src/core/tsi/ssl_transport_security.h"
	"${CMAKE_SOURCE_DIR}/src/core/tsi/transport_security.h"
	"${CMAKE_SOURCE_DIR}/src/core/tsi/transport_security_interface.h"
	)

list(APPEND grpc_srcs
	"${CMAKE_SOURCE_DIR}/src/core/httpcli/httpcli_security_connector.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/base64.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/client_auth_filter.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/credentials.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/credentials_metadata.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/credentials_posix.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/credentials_win32.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/google_default_credentials.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/handshake.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/json_token.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/jwt_verifier.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/secure_endpoint.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/security_connector.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/security_context.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/server_auth_filter.c"
	"${CMAKE_SOURCE_DIR}/src/core/security/server_secure_chttp2.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/init_secure.c"
	"${CMAKE_SOURCE_DIR}/src/core/surface/secure_channel_create.c"
	"${CMAKE_SOURCE_DIR}/src/core/tsi/fake_transport_security.c"
	"${CMAKE_SOURCE_DIR}/src/core/tsi/ssl_transport_security.c"
	"${CMAKE_SOURCE_DIR}/src/core/tsi/transport_security.c"
	)

list(APPEND filegroup_grpc
	${grpc_public_headers}
	${grpc_headers}
	${grpc_srcs}
	${filegroup_grpc_base}
	${filegroup_census})

# ========================================================

list(APPEND grpc_test_util_headers
	"${CMAKE_SOURCE_DIR}/test/core/end2end/data/ssl_test_data.h"
	"${CMAKE_SOURCE_DIR}/test/core/security/oauth2_utils.h"
	)

list(APPEND grpc_test_util_srcs
	"${CMAKE_SOURCE_DIR}/test/core/end2end/data/server1_cert.c"
	"${CMAKE_SOURCE_DIR}/test/core/end2end/data/server1_key.c"
	"${CMAKE_SOURCE_DIR}/test/core/end2end/data/test_root_cert.c"
	"${CMAKE_SOURCE_DIR}/test/core/security/oauth2_utils.c"
	)

list(APPEND filegroup_grpc_test_util
	${grpc_test_util_headers}
	${grpc_test_util_srcs}
	${filegroup_grpc_test_util_base})

# ========================================================

list(APPEND grpc_unsecure_srcs
	"${CMAKE_SOURCE_DIR}/src/core/surface/init_unsecure.c")

list(APPEND filegroup_grpc_unsecure
	${grpc_unsecure_srcs}
	${filegroup_census}
	${filegroup_grpc_base})