@echo off
python "%~dp0sw\test\check.py" %*
exit /b %ERRORLEVEL%
