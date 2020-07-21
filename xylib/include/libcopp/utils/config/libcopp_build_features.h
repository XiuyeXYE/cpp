#ifndef COPP_UTILS_CONFIG_BUILD_FEATURES_H
#define COPP_UTILS_CONFIG_BUILD_FEATURES_H

# pragma once

// This file is  generated by cmake, please don't edit it

#include "compile_optimize.h"
#include "compiler_features.h"

#define LIBCOPP_VERSION_MAJOR 1
#ifndef LIBCOPP_VERSION_MAJOR
#define LIBCOPP_VERSION_MAJOR 0
#endif
#define LIBCOPP_VERSION_MINOR 3
#ifndef LIBCOPP_VERSION_MINOR
#define LIBCOPP_VERSION_MINOR 0
#endif
#define LIBCOPP_VERSION_PATCH 1
#ifndef LIBCOPP_VERSION_PATCH
#define LIBCOPP_VERSION_PATCH 0
#endif
#define LIBCOPP_VERSION "1.3.1"

#if defined(LIBCOPP_API_COPP_NATIVE) && LIBCOPP_API_COPP_NATIVE
    #if defined(LIBCOPP_API_DLL) && LIBCOPP_API_DLL
        #define LIBCOPP_COPP_API UTIL_SYMBOL_EXPORT
    #else
        #define LIBCOPP_COPP_API
    #endif
#else
    #if defined(LIBCOPP_API_DLL) && LIBCOPP_API_DLL
        #define LIBCOPP_COPP_API UTIL_SYMBOL_IMPORT
    #else
        #define LIBCOPP_COPP_API
    #endif
#endif
#define LIBCOPP_COPP_API_HEAD_ONLY UTIL_SYMBOL_VISIBLE
#define LIBCOPP_COPP_API_C(R) extern "C" LIBCOPP_COPP_API R __cdecl

#if defined(LIBCOPP_API_COTASK_NATIVE) && LIBCOPP_API_COTASK_NATIVE
    #if defined(LIBCOPP_API_DLL) && LIBCOPP_API_DLL
        #define LIBCOPP_COTASK_API UTIL_SYMBOL_EXPORT
    #else
        #define LIBCOPP_COTASK_API
    #endif
#else
    #if defined(LIBCOPP_API_DLL) && LIBCOPP_API_DLL
        #define LIBCOPP_COTASK_API UTIL_SYMBOL_IMPORT
    #else
        #define LIBCOPP_COTASK_API
    #endif
#endif
#define LIBCOPP_COTASK_API_HEAD_ONLY UTIL_SYMBOL_VISIBLE
#define LIBCOPP_COTASK_API_C(R) extern "C" LIBCOPP_COTASK_API R __cdecl

/* #undef LIBCOPP_MACRO_USE_SEGMENTED_STACKS */
#define LIBCOPP_MACRO_SYS_POSIX 1
/* #undef LIBCOPP_MACRO_SYS_WIN */
/* #undef LIBCOPP_MACRO_USE_VALGRIND */

#define LIBCOPP_DISABLE_ATOMIC_LOCK 0
#define LOCK_DISABLE_MT 0
#define LIBCOPP_DISABLE_THIS_MT 0

#ifndef LIBCOPP_FCONTEXT_USE_TSX
#define LIBCOPP_FCONTEXT_USE_TSX 1
#endif

#define LIBCOTASK_MACRO_ENABLED 1
#define LIBCOTASK_MACRO_AUTO_CLEANUP_MANAGER 1

#ifndef THREAD_TLS_USE_PTHREAD
#define THREAD_TLS_USE_PTHREAD 1
#endif



#define LIBCOPP_MACRO_ENABLE_STD_COROUTINE 0
#define LIBCOPP_MACRO_USE_STD_EXPERIMENTAL_COROUTINE 0
#define LIBCOPP_MACRO_ENABLE_EXCEPTION 1
#define LIBCOPP_MACRO_ENABLE_STD_EXCEPTION_PTR 1
#define LIBCOPP_MACRO_ENABLE_RTTI 1

#if (defined(UTIL_CONFIG_COMPILER_CXX_NOEXCEPT) && UTIL_CONFIG_COMPILER_CXX_NOEXCEPT) && (defined(LIBCOPP_MACRO_ENABLE_EXCEPTION) && LIBCOPP_MACRO_ENABLE_EXCEPTION)
#define LIBCOPP_MACRO_NOEXCEPT UTIL_CONFIG_NOEXCEPT
#define LIBCOPP_MACRO_ENABLE_NOEXCEPT 1
#else 
#define LIBCOPP_MACRO_NOEXCEPT
#endif

#define LIBCOPP_MACRO_ENABLE_WIN_FIBER 0

#endif