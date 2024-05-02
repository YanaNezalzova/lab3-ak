@echo off
chcp 65001
cd "C:\Users\Admin\Лабораторні\ПЗ-23-3\Незальзова Яна Володимирівна/Batch"
mkdir "Не прихована папка" "Прихована папка"
attrib +h +s +r "Прихована папка"
xcopy /?
cd "Не прихована папка"
xcopy /? > copyhelp.txt
cd ..
xcopy "Не прихована папка\copyhelp.txt" "Прихована папка\copied_copyhelp.txt" /H