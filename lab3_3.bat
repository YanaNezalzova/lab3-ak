@echo off
chcp 1251
setlocal enabledelayedexpansion

if "%~1"=="/help" (
    echo Підказка
    echo Довідка по використанню скрипту:
    echo Скрипт підраховує обсяг підкаталогів у вказаному каталозі.
    echo Передавайте довільну кількість параметрів, вказуючи шлях до них.
    echo Приклад: "C:\Users\Admin\Лабораторні"
    exit /b 0
)

if "%~1"=="" (
    echo Потрібно вказати каталоги як параметри утиліти.
    exit /b 1
)

:process_next_directory
if "%~1"=="" goto end_processing

set "directory=%~1"

if not exist "%directory%" (
    echo Каталог "%directory%" не існує.
    exit /b 1
) else (
    set "total_size=0"
    for /r "%directory%" %%i in (*) do (
        if not "%%~fi"=="%directory%" (
            set /a "total_size+=%%~zi"
        )
    )
    echo Загальний обсяг підкаталогів у каталозі %directory%: !total_size! байт
)

shift
goto process_next_directory

:end_processing
pause
endlocal
