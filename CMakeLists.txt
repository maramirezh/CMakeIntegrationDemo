cmake_minimum_required (VERSION 3.16)

project ("FullDemo" VERSION 1.0.0)

option(FullDemo_BUILD_DOCS "Build docs for FullDemo project" ON)
option(FullDemo_BUILD_TESTS "Enable unit testing for FullDemo project" ON)
option(FullDemo_BUILD_GRAPH "Generate dependency graph for FullDemo project" ON)
option(FullDemo_BUILD_PKG "Generate packages for FullDemo project" ON)

# Include sub-projects.
add_subdirectory ("BarCLI")

add_subdirectory("BarGUI")

include(FetchContent)

include(cmake/ftxui_fetchcontent.cmake)
include(cmake/additional_install_files.cmake)

if(FullDemo_BUILD_DOCS)
	include(cmake/doxygen_docs.cmake)
endif()

if(FullDemo_BUILD_TESTS)
	include(cmake/googletest_tests.cmake)
	include(GoogleTest)
endif()

if(FullDemo_BUILD_GRAPH)
	include(cmake/graphviz_graph.cmake)
endif()

if(FullDemo_BUILD_PKG)
	include(cmake/cpack_package.cmake)
	# CPack included after all variables are set, and all calls to install() are done
	include(CPack)
	# cpack_add_component() is provided by CPack, so they must go after its inclusion
	# https://gitlab.kitware.com/cmake/cmake/-/issues/19858
	cpack_add_component(FULLDEMOCORE
		DISPLAY_NAME FullDemoCore
		REQUIRED
	)
	cpack_add_component(FULLDEMOGUI
		DISPLAY_NAME FullDemoGUI
		DEPENDS FULLDEMOCORE
	)
endif()
