# This file is automatically generated from cmake.toml - DO NOT EDIT
# See https://github.com/build-cpp/cmkr for more information

cmake_minimum_required(VERSION 3.15)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
	message(FATAL_ERROR "In-tree builds are not supported. Run CMake from a separate directory: cmake -B build")
endif()

# Regenerate CMakeLists.txt automatically in the root project
set(CMKR_ROOT_PROJECT OFF)
if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
	set(CMKR_ROOT_PROJECT ON)

	# Bootstrap cmkr
	include(cmkr.cmake OPTIONAL RESULT_VARIABLE CMKR_INCLUDE_RESULT)
	if(CMKR_INCLUDE_RESULT)
		cmkr()
	endif()

	# Enable folder support
	set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endif()

# Create a configure-time dependency on cmake.toml to improve IDE support
if(CMKR_ROOT_PROJECT)
	configure_file(cmake.toml cmake.toml COPYONLY)
endif()

 
set(CMAKE_POLICY_VERSION_MINIMUM 3.5)
add_compile_options($<$<CXX_COMPILER_ID:MSVC>:/MP>)

# Enable PDB generation in release mode, but without the extra crap that RelWithDebInfo adds
add_compile_options("$<$<CONFIG:Release>:/Zi>")
add_link_options("$<$<CONFIG:Release>:/DEBUG>")
add_link_options("$<$<CONFIG:Release>:/OPT:REF>")
add_link_options("$<$<CONFIG:Release>:/OPT:ICF>")

project(uevr-proj)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /MP")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP")

set(ASMJIT_STATIC ON CACHE BOOL "" FORCE)

if ("${CMAKE_BUILD_TYPE}" MATCHES "Release")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /MT")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MT")

    # Statically compile runtime
    string(REGEX REPLACE "/MD" "/MT" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
    string(REGEX REPLACE "/MD" "/MT" CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
    string(REGEX REPLACE "/MD" "/MT" CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")
    string(REGEX REPLACE "/MD" "/MT" CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}")

    message(NOTICE "Building in Release mode")
endif()

set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

add_subdirectory(dependencies/submodules/UESDK)

include(FetchContent)

message(STATUS "Fetching bddisasm (70db095765ab2066dd88dfb7bbcc42259ed167c5)...")
FetchContent_Declare(bddisasm
	GIT_REPOSITORY
		"https://github.com/bitdefender/bddisasm"
	GIT_TAG
		70db095765ab2066dd88dfb7bbcc42259ed167c5
)
FetchContent_MakeAvailable(bddisasm)

message(STATUS "Fetching kananlib (37219bc628c852a1acd65af82fc15faf0ded1e61)...")
FetchContent_Declare(kananlib
	GIT_REPOSITORY
		"https://github.com/cursey/kananlib"
	GIT_TAG
		37219bc628c852a1acd65af82fc15faf0ded1e61
)
FetchContent_MakeAvailable(kananlib)

set(SAFETYHOOK_FETCH_ZYDIS ON)

message(STATUS "Fetching safetyhook (b62c7356f3e364209a2ae14489550156d7b58b8b)...")
FetchContent_Declare(safetyhook
	GIT_REPOSITORY
		"https://github.com/praydog/safetyhook"
	GIT_TAG
		b62c7356f3e364209a2ae14489550156d7b58b8b
)
FetchContent_MakeAvailable(safetyhook)

message(STATUS "Fetching sdkgenny (f58077f8da8a271490c17558e93b75843b3afd19)...")
FetchContent_Declare(sdkgenny
	GIT_REPOSITORY
		"https://github.com/cursey/sdkgenny"
	GIT_TAG
		f58077f8da8a271490c17558e93b75843b3afd19
)
FetchContent_MakeAvailable(sdkgenny)

message(STATUS "Fetching openxr (458984d7f59d1ae6dc1b597d94b02e4f7132eaba)...")
FetchContent_Declare(openxr
	GIT_REPOSITORY
		"https://github.com/KhronosGroup/OpenXR-SDK"
	GIT_TAG
		458984d7f59d1ae6dc1b597d94b02e4f7132eaba
)
FetchContent_MakeAvailable(openxr)

message(STATUS "Fetching json (bc889afb4c5bf1c0d8ee29ef35eaaf4c8bef8a5d)...")
FetchContent_Declare(json
	GIT_REPOSITORY
		"https://github.com/nlohmann/json"
	GIT_TAG
		bc889afb4c5bf1c0d8ee29ef35eaaf4c8bef8a5d
)
FetchContent_MakeAvailable(json)

message(STATUS "Fetching asmjit (2a706fd2ba355808cada31ac1eed8ce28caa6b37)...")
FetchContent_Declare(asmjit
	GIT_REPOSITORY
		"https://github.com/asmjit/asmjit.git"
	GIT_TAG
		2a706fd2ba355808cada31ac1eed8ce28caa6b37
)
FetchContent_MakeAvailable(asmjit)

set(TRACY_STATIC ON CACHE BOOL "" FORCE)
set(TRACY_ENABLE OFF CACHE BOOL "" FORCE)

message(STATUS "Fetching tracy (897aec5b062664d2485f4f9a213715d2e527e0ca)...")
FetchContent_Declare(tracy
	GIT_REPOSITORY
		"https://github.com/wolfpld/tracy"
	GIT_TAG
		897aec5b062664d2485f4f9a213715d2e527e0ca
)
FetchContent_MakeAvailable(tracy)

set(BUILD_TOOLS OFF CACHE BOOL "" FORCE)

message(STATUS "Fetching directxtk (f5026eb34e7053b1aff325d38db107703f394974)...")
FetchContent_Declare(directxtk
	GIT_REPOSITORY
		"https://github.com/microsoft/DirectXTK"
	GIT_TAG
		f5026eb34e7053b1aff325d38db107703f394974
)
FetchContent_MakeAvailable(directxtk)

if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 19.35)
    target_compile_options(DirectXTK PRIVATE /Zc:templateScope-)
endif()

set(BUILD_TOOLS OFF CACHE BOOL "" FORCE)

message(STATUS "Fetching directxtk12 (528801aa6dd8d628c2f756c41a76d300f47de478)...")
FetchContent_Declare(directxtk12
	GIT_REPOSITORY
		"https://github.com/microsoft/DirectXTK12"
	GIT_TAG
		528801aa6dd8d628c2f756c41a76d300f47de478
)
FetchContent_MakeAvailable(directxtk12)

if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 19.35)
    target_compile_options(DirectXTK12 PRIVATE /Zc:templateScope-)
endif()

# Target spdlog
set(CMKR_TARGET spdlog)
set(spdlog_SOURCES "")

list(APPEND spdlog_SOURCES
	"dependencies/submodules/spdlog/src/async.cpp"
	"dependencies/submodules/spdlog/src/cfg.cpp"
	"dependencies/submodules/spdlog/src/color_sinks.cpp"
	"dependencies/submodules/spdlog/src/file_sinks.cpp"
	"dependencies/submodules/spdlog/src/fmt.cpp"
	"dependencies/submodules/spdlog/src/spdlog.cpp"
	"dependencies/submodules/spdlog/src/stdout_sinks.cpp"
)

list(APPEND spdlog_SOURCES
	cmake.toml
)

set(CMKR_SOURCES ${spdlog_SOURCES})
add_library(spdlog STATIC)

if(spdlog_SOURCES)
	target_sources(spdlog PRIVATE ${spdlog_SOURCES})
endif()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${spdlog_SOURCES})

add_library(spdlog::spdlog ALIAS spdlog)
target_compile_definitions(spdlog PUBLIC
	SPDLOG_COMPILED_LIB
)

target_include_directories(spdlog PUBLIC
	"dependencies/submodules/spdlog/include"
)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

# Target glm
set(CMKR_TARGET glm)
set(glm_SOURCES "")

list(APPEND glm_SOURCES
	"dependencies/submodules/glm/glm/detail/glm.cpp"
)

list(APPEND glm_SOURCES
	cmake.toml
)

set(CMKR_SOURCES ${glm_SOURCES})
add_library(glm STATIC)

if(glm_SOURCES)
	target_sources(glm PRIVATE ${glm_SOURCES})
endif()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${glm_SOURCES})

target_include_directories(glm PUBLIC
	"dependencies/submodules/glm"
)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

# Target openvr
set(CMKR_TARGET openvr)
set(openvr_SOURCES "")

list(APPEND openvr_SOURCES
	"dependencies/openvr/src/jsoncpp.cpp"
	"dependencies/openvr/src/openvr_api_public.cpp"
	"dependencies/openvr/src/vrcommon/dirtools_public.cpp"
	"dependencies/openvr/src/vrcommon/envvartools_public.cpp"
	"dependencies/openvr/src/vrcommon/hmderrors_public.cpp"
	"dependencies/openvr/src/vrcommon/pathtools_public.cpp"
	"dependencies/openvr/src/vrcommon/sharedlibtools_public.cpp"
	"dependencies/openvr/src/vrcommon/strtools_public.cpp"
	"dependencies/openvr/src/vrcommon/vrpathregistry_public.cpp"
	"dependencies/openvr/src/vrcommon/dirtools_public.cpp"
	"dependencies/openvr/src/vrcommon/envvartools_public.cpp"
	"dependencies/openvr/src/vrcommon/hmderrors_public.cpp"
	"dependencies/openvr/src/vrcommon/pathtools_public.cpp"
	"dependencies/openvr/src/vrcommon/sharedlibtools_public.cpp"
	"dependencies/openvr/src/vrcommon/strtools_public.cpp"
	"dependencies/openvr/src/vrcommon/vrpathregistry_public.cpp"
)

list(APPEND openvr_SOURCES
	cmake.toml
)

set(CMKR_SOURCES ${openvr_SOURCES})
add_library(openvr SHARED)

if(openvr_SOURCES)
	target_sources(openvr PRIVATE ${openvr_SOURCES})
endif()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${openvr_SOURCES})

add_library(openvr_api ALIAS openvr)
target_compile_definitions(openvr PUBLIC
	VR_API_PUBLIC
	WIN64
)

target_include_directories(openvr PUBLIC
	"dependencies/openvr/headers"
)

set_target_properties(openvr PROPERTIES
	OUTPUT_NAME
		openvr_api
)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

# Target imgui
set(CMKR_TARGET imgui)
set(imgui_SOURCES "")

list(APPEND imgui_SOURCES
	"dependencies/submodules/imgui/imgui.cpp"
	"dependencies/submodules/imgui/imgui_demo.cpp"
	"dependencies/submodules/imgui/imgui_draw.cpp"
	"dependencies/submodules/imgui/imgui_tables.cpp"
	"dependencies/submodules/imgui/imgui_widgets.cpp"
)

list(APPEND imgui_SOURCES
	cmake.toml
)

set(CMKR_SOURCES ${imgui_SOURCES})
add_library(imgui STATIC)

if(imgui_SOURCES)
	target_sources(imgui PRIVATE ${imgui_SOURCES})
endif()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${imgui_SOURCES})

target_compile_definitions(imgui PUBLIC
	"IMGUI_USER_CONFIG=\"${CMAKE_CURRENT_SOURCE_DIR}/src/uevr-imgui/uevr_imconfig.hpp\""
)

target_include_directories(imgui PUBLIC
	"dependencies/submodules/imgui"
	"src/uevr-imgui"
)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

# Target plugin_renderlib
set(CMKR_TARGET plugin_renderlib)
set(plugin_renderlib_SOURCES "")

list(APPEND plugin_renderlib_SOURCES
	"examples/renderlib/imgui/imgui_impl_dx11.cpp"
	"examples/renderlib/imgui/imgui_impl_dx12.cpp"
	"examples/renderlib/imgui/imgui_impl_win32.cpp"
	"examples/renderlib/rendering/d3d11.cpp"
	"examples/renderlib/rendering/d3d12.cpp"
	"examples/renderlib/imgui/font_robotomedium.hpp"
	"examples/renderlib/imgui/re2_imconfig.hpp"
	"examples/renderlib/rendering/d3d11.hpp"
	"examples/renderlib/rendering/d3d12.hpp"
	"examples/renderlib/rendering/shared.hpp"
	"examples/renderlib/imgui/imgui_impl_dx11.h"
	"examples/renderlib/imgui/imgui_impl_dx12.h"
	"examples/renderlib/imgui/imgui_impl_win32.h"
)

list(APPEND plugin_renderlib_SOURCES
	cmake.toml
)

set(CMKR_SOURCES ${plugin_renderlib_SOURCES})
add_library(plugin_renderlib STATIC)

if(plugin_renderlib_SOURCES)
	target_sources(plugin_renderlib PRIVATE ${plugin_renderlib_SOURCES})
endif()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${plugin_renderlib_SOURCES})

target_compile_features(plugin_renderlib PUBLIC
	cxx_std_23
)

target_compile_options(plugin_renderlib PUBLIC
	"/EHa"
	"/MP"
)

target_include_directories(plugin_renderlib PUBLIC
	"examples/renderlib"
	"include/"
)

target_link_libraries(plugin_renderlib PUBLIC
	imgui
)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

# Target example_plugin
set(CMKR_TARGET example_plugin)
set(example_plugin_SOURCES "")

list(APPEND example_plugin_SOURCES
	"examples/example_plugin/Plugin.cpp"
)

list(APPEND example_plugin_SOURCES
	cmake.toml
)

set(CMKR_SOURCES ${example_plugin_SOURCES})
add_library(example_plugin SHARED)

if(example_plugin_SOURCES)
	target_sources(example_plugin PRIVATE ${example_plugin_SOURCES})
endif()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${example_plugin_SOURCES})

target_compile_features(example_plugin PUBLIC
	cxx_std_23
)

target_include_directories(example_plugin PUBLIC
	"include/"
	"examples/renderlib"
)

target_link_libraries(example_plugin PUBLIC
	plugin_renderlib
)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

# Target sdk-test
set(CMKR_TARGET sdk-test)
set(sdk-test_SOURCES "")

list(APPEND sdk-test_SOURCES
	"side-projects/sdk-test/Main.cpp"
)

list(APPEND sdk-test_SOURCES
	cmake.toml
)

set(CMKR_SOURCES ${sdk-test_SOURCES})
add_library(sdk-test SHARED)

if(sdk-test_SOURCES)
	target_sources(sdk-test PRIVATE ${sdk-test_SOURCES})
endif()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${sdk-test_SOURCES})

target_compile_features(sdk-test PUBLIC
	cxx_std_23
)

target_include_directories(sdk-test PUBLIC
	"shared/"
	"include/"
)

target_link_libraries(sdk-test PUBLIC
	kananlib
	uesdk
)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

# Target vr-plugin-nullifier
set(CMKR_TARGET vr-plugin-nullifier)
set(vr-plugin-nullifier_SOURCES "")

list(APPEND vr-plugin-nullifier_SOURCES
	"vr-plugin-nullifier/Main.cpp"
)

list(APPEND vr-plugin-nullifier_SOURCES
	cmake.toml
)

set(CMKR_SOURCES ${vr-plugin-nullifier_SOURCES})
add_library(vr-plugin-nullifier SHARED)

if(vr-plugin-nullifier_SOURCES)
	target_sources(vr-plugin-nullifier PRIVATE ${vr-plugin-nullifier_SOURCES})
endif()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${vr-plugin-nullifier_SOURCES})

target_compile_features(vr-plugin-nullifier PUBLIC
	cxx_std_23
)

target_compile_options(vr-plugin-nullifier PUBLIC
	"/GS-"
	"/EHa"
	"/MP"
)

target_link_libraries(vr-plugin-nullifier PUBLIC
	kananlib
)

set_target_properties(vr-plugin-nullifier PROPERTIES
	OUTPUT_NAME
		UEVRPluginNullifier
	RUNTIME_OUTPUT_DIRECTORY_RELEASE
		"${CMAKE_BINARY_DIR}/bin/${CMKR_TARGET}"
	RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO
		"${CMAKE_BINARY_DIR}/bin/${CMKR_TARGET}"
	LIBRARY_OUTPUT_DIRECTORY_RELEASE
		"${CMAKE_BINARY_DIR}/lib/${CMKR_TARGET}"
	LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO
		"${CMAKE_BINARY_DIR}/lib/${CMKR_TARGET}"
	ARCHIVE_OUTPUT_DIRECTORY_RELEASE
		"${CMAKE_BINARY_DIR}/lib/${CMKR_TARGET}"
	ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO
		"${CMAKE_BINARY_DIR}/lib/${CMKR_TARGET}"
)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

# Target lua
set(CMKR_TARGET lua)
set(lua_SOURCES "")

list(APPEND lua_SOURCES
	"dependencies/lua/src/lapi.c"
	"dependencies/lua/src/lauxlib.c"
	"dependencies/lua/src/lbaselib.c"
	"dependencies/lua/src/lcode.c"
	"dependencies/lua/src/lcorolib.c"
	"dependencies/lua/src/lctype.c"
	"dependencies/lua/src/ldblib.c"
	"dependencies/lua/src/ldebug.c"
	"dependencies/lua/src/ldo.c"
	"dependencies/lua/src/ldump.c"
	"dependencies/lua/src/lfunc.c"
	"dependencies/lua/src/lgc.c"
	"dependencies/lua/src/linit.c"
	"dependencies/lua/src/liolib.c"
	"dependencies/lua/src/llex.c"
	"dependencies/lua/src/lmathlib.c"
	"dependencies/lua/src/lmem.c"
	"dependencies/lua/src/loadlib.c"
	"dependencies/lua/src/lobject.c"
	"dependencies/lua/src/lopcodes.c"
	"dependencies/lua/src/loslib.c"
	"dependencies/lua/src/lparser.c"
	"dependencies/lua/src/lstate.c"
	"dependencies/lua/src/lstring.c"
	"dependencies/lua/src/lstrlib.c"
	"dependencies/lua/src/ltable.c"
	"dependencies/lua/src/ltablib.c"
	"dependencies/lua/src/ltests.c"
	"dependencies/lua/src/ltm.c"
	"dependencies/lua/src/lua.c"
	"dependencies/lua/src/lundump.c"
	"dependencies/lua/src/lutf8lib.c"
	"dependencies/lua/src/lvm.c"
	"dependencies/lua/src/lzio.c"
)

list(APPEND lua_SOURCES
	cmake.toml
)

set(CMKR_SOURCES ${lua_SOURCES})
add_library(lua STATIC)

if(lua_SOURCES)
	target_sources(lua PRIVATE ${lua_SOURCES})
endif()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${lua_SOURCES})

target_include_directories(lua PUBLIC
	"dependencies/lua/src"
)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

# Target sol2
set(CMKR_TARGET sol2)
set(sol2_SOURCES "")

set(CMKR_SOURCES ${sol2_SOURCES})
add_library(sol2 INTERFACE)

if(sol2_SOURCES)
	target_sources(sol2 INTERFACE ${sol2_SOURCES})
endif()

target_include_directories(sol2 INTERFACE
	"dependencies/sol2/single/single/include"
)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

# Target luavrlib
set(CMKR_TARGET luavrlib)
set(luavrlib_SOURCES "")

list(APPEND luavrlib_SOURCES
	"lua-api/lib/src/ScriptContext.cpp"
	"lua-api/lib/src/ScriptState.cpp"
	"lua-api/lib/src/ScriptUtility.cpp"
	"lua-api/lib/src/datatypes/Quaternion.cpp"
	"lua-api/lib/src/datatypes/StructObject.cpp"
	"lua-api/lib/src/datatypes/Vector.cpp"
	"lua-api/lib/src/datatypes/XInput.cpp"
	"lua-api/lib/include/ScriptContext.hpp"
	"lua-api/lib/include/ScriptPrerequisites.hpp"
	"lua-api/lib/include/ScriptState.hpp"
	"lua-api/lib/include/ScriptUtility.hpp"
	"lua-api/lib/include/datatypes/FFrame.hpp"
	"lua-api/lib/include/datatypes/Quaternion.hpp"
	"lua-api/lib/include/datatypes/StructObject.hpp"
	"lua-api/lib/include/datatypes/Vector.hpp"
	"lua-api/lib/include/datatypes/XInput.hpp"
)

list(APPEND luavrlib_SOURCES
	cmake.toml
)

set(CMKR_SOURCES ${luavrlib_SOURCES})
add_library(luavrlib STATIC)

if(luavrlib_SOURCES)
	target_sources(luavrlib PRIVATE ${luavrlib_SOURCES})
endif()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${luavrlib_SOURCES})

target_compile_features(luavrlib PUBLIC
	cxx_std_23
)

target_compile_options(luavrlib PUBLIC
	"/bigobj"
	"/EHa"
	"/MP"
)

target_include_directories(luavrlib PUBLIC
	"include/"
	"lua-api/lib/include"
)

target_link_libraries(luavrlib PUBLIC
	lua
	sol2
	kananlib
	glm
	asmjit
)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

# Target LuaVR
set(CMKR_TARGET LuaVR)
set(LuaVR_SOURCES "")

list(APPEND LuaVR_SOURCES
	"lua-api/Main.cpp"
)

list(APPEND LuaVR_SOURCES
	cmake.toml
)

set(CMKR_SOURCES ${LuaVR_SOURCES})
add_library(LuaVR SHARED)

if(LuaVR_SOURCES)
	target_sources(LuaVR PRIVATE ${LuaVR_SOURCES})
endif()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${LuaVR_SOURCES})

target_compile_features(LuaVR PUBLIC
	cxx_std_23
)

target_compile_options(LuaVR PUBLIC
	"/bigobj"
	"/EHa"
	"/MP"
)

target_include_directories(LuaVR PUBLIC
	"include/"
)

target_link_libraries(LuaVR PUBLIC
	luavrlib
)

set_target_properties(LuaVR PROPERTIES
	RUNTIME_OUTPUT_DIRECTORY_RELEASE
		"${CMAKE_BINARY_DIR}/bin/${CMKR_TARGET}"
	RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO
		"${CMAKE_BINARY_DIR}/bin/${CMKR_TARGET}"
	LIBRARY_OUTPUT_DIRECTORY_RELEASE
		"${CMAKE_BINARY_DIR}/lib/${CMKR_TARGET}"
	LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO
		"${CMAKE_BINARY_DIR}/lib/${CMKR_TARGET}"
	ARCHIVE_OUTPUT_DIRECTORY_RELEASE
		"${CMAKE_BINARY_DIR}/lib/${CMKR_TARGET}"
	ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO
		"${CMAKE_BINARY_DIR}/lib/${CMKR_TARGET}"
)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

# Target uevr
set(CMKR_TARGET uevr)
set(uevr_SOURCES "")

list(APPEND uevr_SOURCES
	"src/ExceptionHandler.cpp"
	"src/Framework.cpp"
	"src/Main.cpp"
	"src/Mod.cpp"
	"src/Mods.cpp"
	"src/WindowFilter.cpp"
	"src/hooks/D3D11Hook.cpp"
	"src/hooks/D3D12Hook.cpp"
	"src/hooks/DInputHook.cpp"
	"src/hooks/WindowsMessageHook.cpp"
	"src/hooks/XInputHook.cpp"
	"src/mods/FrameworkConfig.cpp"
	"src/mods/ImGuiThemeHelpers.cpp"
	"src/mods/LuaLoader.cpp"
	"src/mods/PluginLoader.cpp"
	"src/mods/UObjectHook.cpp"
	"src/mods/VR.cpp"
	"src/mods/bindings/FS.cpp"
	"src/mods/bindings/ImGui.cpp"
	"src/mods/bindings/Json.cpp"
	"src/mods/pluginloader/FFakeStereoRenderingFunctions.cpp"
	"src/mods/pluginloader/FRHITexture2DFunctions.cpp"
	"src/mods/pluginloader/FRenderTargetPoolHook.cpp"
	"src/mods/pluginloader/FUObjectArrayFunctions.cpp"
	"src/mods/pluginloader/UScriptStructFunctions.cpp"
	"src/mods/uobjecthook/SDKDumper.cpp"
	"src/mods/vr/Bindings.cpp"
	"src/mods/vr/CVarManager.cpp"
	"src/mods/vr/D3D11Component.cpp"
	"src/mods/vr/D3D12Component.cpp"
	"src/mods/vr/FFakeStereoRenderingHook.cpp"
	"src/mods/vr/IXRTrackingSystemHook.cpp"
	"src/mods/vr/OverlayComponent.cpp"
	"src/mods/vr/RenderTargetPoolHook.cpp"
	"src/mods/vr/d3d12/CommandContext.cpp"
	"src/mods/vr/d3d12/DirectXTK.cpp"
	"src/mods/vr/d3d12/TextureContext.cpp"
	"src/mods/vr/runtimes/OpenVR.cpp"
	"src/mods/vr/runtimes/OpenXR.cpp"
	"src/uevr-imgui/imgui_impl_dx11.cpp"
	"src/uevr-imgui/imgui_impl_dx12.cpp"
	"src/uevr-imgui/imgui_impl_win32.cpp"
	"src/utility/ImGui.cpp"
	"src/ExceptionHandler.hpp"
	"src/Framework.hpp"
	"src/LicenseStrings.hpp"
	"src/Mod.hpp"
	"src/Mods.hpp"
	"src/WindowFilter.hpp"
	"src/hooks/D3D11Hook.hpp"
	"src/hooks/D3D12Hook.hpp"
	"src/hooks/DInputHook.hpp"
	"src/hooks/WindowsMessageHook.hpp"
	"src/hooks/XInputHook.hpp"
	"src/mods/FrameworkConfig.hpp"
	"src/mods/ImGuiThemeHelpers.hpp"
	"src/mods/LuaLoader.hpp"
	"src/mods/PluginLoader.hpp"
	"src/mods/UObjectHook.hpp"
	"src/mods/VR.hpp"
	"src/mods/bindings/FS.hpp"
	"src/mods/bindings/ImGui.hpp"
	"src/mods/bindings/Json.hpp"
	"src/mods/pluginloader/FFakeStereoRenderingFunctions.hpp"
	"src/mods/pluginloader/FRHITexture2DFunctions.hpp"
	"src/mods/pluginloader/FRenderTargetPoolHook.hpp"
	"src/mods/pluginloader/FUObjectArrayFunctions.hpp"
	"src/mods/pluginloader/UScriptStructFunctions.hpp"
	"src/mods/uobjecthook/SDKDumper.hpp"
	"src/mods/vr/CVarManager.hpp"
	"src/mods/vr/D3D11Component.hpp"
	"src/mods/vr/D3D12Component.hpp"
	"src/mods/vr/FFakeStereoRenderingHook.hpp"
	"src/mods/vr/IXRTrackingSystemHook.hpp"
	"src/mods/vr/OverlayComponent.hpp"
	"src/mods/vr/RenderTargetPoolHook.hpp"
	"src/mods/vr/d3d12/ComPtr.hpp"
	"src/mods/vr/d3d12/CommandContext.hpp"
	"src/mods/vr/d3d12/DirectXTK.hpp"
	"src/mods/vr/d3d12/TextureContext.hpp"
	"src/mods/vr/runtimes/OpenVR.hpp"
	"src/mods/vr/runtimes/OpenXR.hpp"
	"src/mods/vr/runtimes/VRRuntime.hpp"
	"src/mods/vr/shaders/ps.hpp"
	"src/mods/vr/shaders/vs.hpp"
	"src/uevr-imgui/font_robotomedium.hpp"
	"src/uevr-imgui/uevr_imconfig.hpp"
	"src/utility/ImGui.hpp"
	"src/utility/Logging.hpp"
	"src/uevr-imgui/imgui_impl_dx11.h"
	"src/uevr-imgui/imgui_impl_dx12.h"
	"src/uevr-imgui/imgui_impl_win32.h"
)

list(APPEND uevr_SOURCES
	cmake.toml
)

set(CMKR_SOURCES ${uevr_SOURCES})
add_library(uevr SHARED)

if(uevr_SOURCES)
	target_sources(uevr PRIVATE ${uevr_SOURCES})
endif()


target_compile_features(uevr PUBLIC
	cxx_std_23
)

target_compile_options(uevr PUBLIC
	"/GS-"
	"/bigobj"
	"/EHa"
	"/MP"
)

target_include_directories(uevr PUBLIC
	"shared/"
	"src/"
	"include/"
	"${OPENXR_SOURCE_DIR}/src"
)

target_link_libraries(uevr PUBLIC
	shlwapi
	d3d11
	d3d12
	safetyhook
	glm
	imgui
	openvr_api
	openxr_loader
	nlohmann_json
	Version
	TracyClient
	DirectXTK
	DirectXTK12
	sdkgenny
	asmjit
	luavrlib
)

target_link_libraries(uevr PUBLIC
	kananlib
	uesdk
)

set_target_properties(uevr PROPERTIES
	OUTPUT_NAME
		UEVRBackend
	LINK_FLAGS
		"/DELAYLOAD:openvr_api.dll"
	RUNTIME_OUTPUT_DIRECTORY_RELEASE
		"${CMAKE_BINARY_DIR}/bin/${CMKR_TARGET}"
	RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO
		"${CMAKE_BINARY_DIR}/bin/${CMKR_TARGET}"
	LIBRARY_OUTPUT_DIRECTORY_RELEASE
		"${CMAKE_BINARY_DIR}/lib/${CMKR_TARGET}"
	LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO
		"${CMAKE_BINARY_DIR}/lib/${CMKR_TARGET}"
	ARCHIVE_OUTPUT_DIRECTORY_RELEASE
		"${CMAKE_BINARY_DIR}/lib/${CMKR_TARGET}"
	ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO
		"${CMAKE_BINARY_DIR}/lib/${CMKR_TARGET}"
)

add_custom_command(
TARGET uevr PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E echo "Compiling shaders for UEVR..."
    COMMAND ${CMAKE_COMMAND} -E chdir ${CMAKE_SOURCE_DIR}/src/mods/vr/shaders ${CMAKE_SOURCE_DIR}/src/mods/vr/shaders/compile_shaders.bat
)

add_custom_command(
    TARGET uevr PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E echo "Generating commit hash..."
    COMMAND ${CMAKE_COMMAND} -E chdir ${CMAKE_SOURCE_DIR} ${CMAKE_SOURCE_DIR}/MakeCommitHash.bat
)
add_custom_command(
    TARGET uevr POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:openvr> $<TARGET_FILE_DIR:uevr>)

unset(CMKR_TARGET)
unset(CMKR_SOURCES)

