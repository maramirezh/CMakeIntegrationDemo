# VS 2022 targeting windows fails to build the whole project: ninja : error : failed recompaction: Permission denied
# bug? https://gitlab.kitware.com/cmake/cmake/-/issues/21916

# not building target in default build by skipping ALL keyword...
# you must build target manually.

#add_custom_target(graphviz ALL VERBATIM
add_custom_target(graphviz VERBATIM
	COMMAND ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/graph
	COMMAND "${CMAKE_COMMAND}" "--graphviz=graph/FullDemo.dot" .
	COMMAND dot -Tpng graph/FullDemo.dot -o graph/FullDemo.png
	WORKING_DIRECTORY "${CMAKE_BINARY_DIR}"
)
