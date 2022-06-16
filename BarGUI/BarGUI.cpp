#include <QApplication>
#include "mainwindow.h"

int main(int argc, char* argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QApplication app(argc, argv);
	MainWindow BarGUI;
	BarGUI.show();

	return app.exec();
}
