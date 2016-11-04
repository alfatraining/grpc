option(gRPC_DISABLE_ALPN "Disable ALPN support" OFF)

if(gRPC_DISABLE_ALPN)
    add_definitions(-DTSI_OPENSSL_ALPN_SUPPORT=0)
endif()
