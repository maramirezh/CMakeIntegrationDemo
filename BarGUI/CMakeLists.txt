cmake_minimum_required (VERSION 3.16)

find_package(Qt5 COMPONENTS Core Gui Widgets REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

if(WIN32)
	set(BarGUI_RESICON "${CMAKE_SOURCE_DIR}/res/winresource.rc")
endif()

add_executable(BarGUI
	BarGUI.cpp
	mainwindow.cpp
	mainwindow.h
	mainwindow.ui
	${BarGUI_RESICON}
)

if(WIN32)
	set_target_properties(BarGUI PROPERTIES WIN32_EXECUTABLE TRUE)
endif()

target_link_libraries(BarGUI PRIVATE
	Qt5::Core
	Qt5::Gui
	Qt5::Widgets
)

# -------
# Install
# -------

install(
	TARGETS BarGUI
	COMPONENT FULLDEMOGUI
)

# package Qt5 dlls with windows application
if(WIN32)
	install(FILES
	$<TARGET_FILE:Qt5::Widgets>
	$<TARGET_FILE:Qt5::Core>
	$<TARGET_FILE:Qt5::Gui>
	COMPONENT FULLDEMOGUI
	DESTINATION bin
	)
	install(FILES
		$<TARGET_FILE:Qt5::QWindowsIntegrationPlugin>
		COMPONENT FULLDEMOGUI
		DESTINATION bin/platforms
	)
endif()
