@echo off
REM 激活本项目的 all-in-rag 环境（环境在项目内的 .conda\envs\all-in-rag）
REM 用法：双击或在此目录的 cmd 窗口执行  activate.bat
call "E:\miniconda3\condabin\conda.bat" activate "%~dp0.conda\envs\all-in-rag"
echo.
echo 已激活：%CONDA_PREFIX%
python --version
cmd /k
