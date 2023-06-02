@echo off
chcp 65001

echo Эта программа меняет дату и время создания файлов в заданной директории.
echo Введите путь к директории:
set /p dir_path=

echo Подтвердите изменение даты и времени файлов в директории "%dir_path%" (Y/N):
set /p confirm=
if /i "%confirm%"=="Y" (
echo Изменение даты и времени файлов...
echo 01-12-2000 00:00:00 > "%dir_path%\dummy.txt"
for /r "%dir_path%" %%f in (*) do (
copy /b "%dir_path%\dummy.txt" +,,
echo Файл %%~nxf
)
del "%dir_path%\dummy.txt"
echo Дата и время файлов в директории "%dir_path%" изменены успешно.
) else (
echo Отмена изменения даты и времени файлов в директории "%dir_path%".
)

pause