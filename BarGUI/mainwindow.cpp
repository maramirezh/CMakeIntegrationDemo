#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    connect(ui->horizontalSlider, &QSlider::valueChanged, this, [&] {
        ui->label->setText(QString("value = ") + QString::number(ui->horizontalSlider->value()));
        });

    connect(ui->pushButton_2, &QPushButton::clicked, this, [&] {
        ui->horizontalSlider->setValue(ui->horizontalSlider->value() + 1);
        });

    connect(ui->pushButton, &QPushButton::clicked, this, [&] {
        ui->horizontalSlider->setValue(ui->horizontalSlider->value() - 1);
        });

    ui->horizontalSlider->setValue(50);
}

MainWindow::~MainWindow()
{
    delete ui;
}
