#############################################################################
# Makefile for building: BevFacey_iOS.app/Contents/MacOS/BevFacey_iOS
# Generated by qmake (3.1) (Qt 5.8.0)
# Project:  ../BevFacey_iOS/BevFacey_iOS.pro
# Template: app
# Command: /Volumes/Macintosh_2/Qt/5.8/ios/bin/qmake -o BevFacey_iOS.xcodeproj/project.pbxproj ../BevFacey_iOS/BevFacey_iOS.pro -spec macx-xcode CONFIG+=release CONFIG+=iphoneos CONFIG+=device
#############################################################################

MAKEFILE      = project.pbxproj

MOC       = /Volumes/Macintosh_2/Qt/5.8/ios/bin/moc
UIC       = 
LEX       = flex
LEXFLAGS  = 
YACC      = yacc
YACCFLAGS = -d
DEFINES       = -DDARWIN_NO_CARBON -DQT_COMPILER_SUPPORTS_SSE2 -DQT_DEPRECATED_WARNINGS -DQT_NO_DEBUG -DQT_QUICK_LIB -DQT_GUI_LIB -DQT_QML_LIB -DQT_NETWORK_LIB -DQT_CORE_LIB
INCPATH       = -I../BevFacey_iOS -I. -I../../../Qt/5.8/ios/mkspecs/common/uikit -I../../../Qt/5.8/ios/include -I../../../Qt/5.8/ios/include/QtQuick -I../../../Qt/5.8/ios/include/QtGui -I../../../Qt/5.8/ios/include/QtQml -I../../../Qt/5.8/ios/include/QtNetwork -I../../../Qt/5.8/ios/include/QtCore -I. -I../../../Qt/5.8/ios/mkspecs/macx-ios-clang
DEL_FILE  = rm -f
MOVE      = mv -f

preprocess: compilers
clean preprocess_clean: compiler_clean

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

check: first

benchmark: first

compilers: qrc_qml.cpp
compiler_rcc_make_all: qrc_qml.cpp
compiler_rcc_clean:
	-$(DEL_FILE) qrc_qml.cpp
qrc_qml.cpp: ../BevFacey_iOS/qml.qrc \
		../../../Qt/5.8/ios/bin/rcc \
		../BevFacey_iOS/Page1Form.ui.qml \
		../BevFacey_iOS/Page1.qml \
		../BevFacey_iOS/qtquickcontrols2.conf \
		../BevFacey_iOS/main.qml
	/Volumes/Macintosh_2/Qt/5.8/ios/bin/rcc -name qml ../BevFacey_iOS/qml.qrc -o qrc_qml.cpp

compiler_moc_header_make_all:
compiler_moc_header_clean:
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_rez_source_make_all:
compiler_rez_source_clean:
compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_rcc_clean 
