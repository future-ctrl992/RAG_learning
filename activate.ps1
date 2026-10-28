# 激活本项目的 all-in-rag conda 环境（环境建在项目内的 .conda\envs\all-in-rag）
# 用法：在 PowerShell 中执行  . .\activate.ps1   （注意前面有 "点 + 空格"）
# 若提示"无法加载文件，因为在此系统上禁止运行脚本"，先执行：
#   Set-ExecutionPolicy -Scope CurrentUser RemoteSigned

$CondaRoot = 'E:\miniconda3'
$EnvPrefix = Join-Path $PSScriptRoot '.conda\envs\all-in-rag'

if (-not (Test-Path (Join-Path $EnvPrefix 'python.exe'))) {
    Write-Host "找不到环境：$EnvPrefix" -ForegroundColor Red
    Write-Host "请先按文档创建环境。" -ForegroundColor Yellow
    return
}

$Hook = Join-Path $CondaRoot 'shell\condabin\conda-hook.ps1'
if (Test-Path $Hook) {
    . $Hook
    conda activate $EnvPrefix
} else {
    # 没有 conda 的 PowerShell 钩子时，直接拼 PATH 兜底
    $env:CONDA_PREFIX = $EnvPrefix
    $env:PATH = "$EnvPrefix;$EnvPrefix\Library\mingw-w64\bin;$EnvPrefix\Library\usr\bin;$EnvPrefix\Library\bin;$EnvPrefix\Scripts;$env:PATH"
}

Write-Host "已激活：$env:CONDA_PREFIX" -ForegroundColor Green
python --version
