cmake_minimum_required (VERSION 3.16)

# Add source to this project's executable.
if(WIN32)
	set(BarCLI_RESICON "${CMAKE_SOURCE_DIR}/res/winresource.rc")
endif()

add_executable(BarCLI 
	BarCLI.cpp
	BarCLI.h
	${BarCLI_RESICON}
)

target_link_libraries(BarCLI PRIVATE
	ftxui::component
	ftxui::dom
	ftxui::screen
)

# -------
# Install
# -------

install(
	TARGETS BarCLI
	COMPONENT FULLDEMOCORE
)
