option(gRPC_DISABLE_OPENSSL_INIT "Disable openssl SSL_library_init" OFF)

if(gRPC_DISABLE_OPENSSL_INIT)
  add_definitions("-DgRPC_DISABLE_OPENSSL_INIT")
endif()
