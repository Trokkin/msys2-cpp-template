# General compile and link options
set(COMPILE_OPTS -O3 -Wall -Wextra -pedantic -Wno-c++11-extensions)
set(LINK_OPTS "")

function(setup_warnings TARGET)
    # Configure clang-tidy
    if (${USE_CLANG_TIDY})
        set_target_properties(${TARGET} PROPERTIES CXX_CLANG_TIDY clang-tidy)
    endif()
    # Warnings
    target_compile_options(${TARGET} PRIVATE -Wno-error-unknown-warning-option) # just in case if some warnings are unavialable
    # target_compile_options(${TARGET} PRIVATE -Wold-style-cast)
    target_compile_options(${TARGET} PRIVATE -Wnull-dereference)

    if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
        target_compile_options(${TARGET} PRIVATE -Wduplicated-branches)
        target_compile_options(${TARGET} PRIVATE -Wduplicated-cond)
        target_compile_options(${TARGET} PRIVATE -Wsuggest-override)
        target_compile_options(${TARGET} PRIVATE -Wuseless-cast)
        target_compile_options(${TARGET} PRIVATE -Wreturn-local-addr)
    elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
        target_compile_options(${TARGET} PRIVATE -Wreturn-stack-address)
        target_compile_options(${TARGET} PRIVATE -Wloop-analysis)
    elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
        target_compile_options(${TARGET} PRIVATE -Wreturn-stack-address)
        target_compile_options(${TARGET} PRIVATE -Wloop-analysis)
    endif()

    # ICA
    if (EXISTS ${PATH_TO_ICA})
        message(STATUS "path to ICA: ${PATH_TO_ICA}")
        target_compile_options(${TARGET} PRIVATE "SHELL:-Xclang -load")
        target_compile_options(${TARGET} PRIVATE "SHELL:-Xclang ${PATH_TO_ICA}")
        target_compile_options(${TARGET} PRIVATE "SHELL:-Xclang -add-plugin")
        target_compile_options(${TARGET} PRIVATE "SHELL:-Xclang ica-plugin")
        target_compile_options(${TARGET} PRIVATE "SHELL:-Xclang -plugin-arg-ica-plugin")
        target_compile_options(${TARGET} PRIVATE "SHELL:-Xclang checks=all=err")
    endif()
endfunction(setup_warnings)
