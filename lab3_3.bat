@echo off
chcp 1251
setlocal enabledelayedexpansion

if "%~1"=="/help" (
    echo ϳ������
    echo ������ �� ������������ �������:
    echo ������ �������� ����� ���������� � ��������� �������.
    echo ����������� ������� ������� ���������, �������� ���� �� ���.
    echo �������: "C:\Users\Admin\����������"
    exit /b 0
)

if "%~1"=="" (
    echo ������� ������� �������� �� ��������� ������.
    exit /b 1
)

:process_next_directory
if "%~1"=="" goto end_processing

set "directory=%~1"

if not exist "%directory%" (
    echo ������� "%directory%" �� ����.
    exit /b 1
) else (
    set "total_size=0"
    for /r "%directory%" %%i in (*) do (
        if not "%%~fi"=="%directory%" (
            set /a "total_size+=%%~zi"
        )
    )
    echo ��������� ����� ���������� � ������� %directory%: !total_size! ����
)

shift
goto process_next_directory

:end_processing
pause
endlocal