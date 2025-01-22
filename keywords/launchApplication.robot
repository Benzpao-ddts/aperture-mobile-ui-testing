*** Settings ***
Resource   ../resources/androidSettings.robot

*** Keywords ***
Launch Application
    Open Application        ${LOCALHOST}        platformName=${PLATFORM_NAME}        deviceName=${DEVICE_NAME}        appPackage=${APP_PACKAGE}     appActivity=${APP_ACTIVITY}