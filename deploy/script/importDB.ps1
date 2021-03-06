#текущий путь
$currentPath = Split-Path -Path $myInvocation.MyCommand.Path -Parent
#путь до сайта
$pathSite = "c:\OSPanel\domains\zoo.loc"
$pathSql = $pathSite + "\deploy\sql"
$mysql = "c:\OSPanel\modules\database\MySQL-5.6\bin\mysql.exe "
$7z = "d:\Util\Total7zip\7z.exe"
$cmd = "c:\Windows\System32\cmd.exe"
$user = "root"
$databasename = "zoo"

#Очищаем экран и устанавливаем цвета
function ClearUI{
	$bckgrnd = "DarkBlue"
	$Host.UI.RawUI.BackgroundColor = $bckgrnd
	$Host.UI.RawUI.ForegroundColor = 'White'
	$Host.PrivateData.ErrorForegroundColor = 'Red'
	$Host.PrivateData.ErrorBackgroundColor = $bckgrnd
	$Host.PrivateData.WarningForegroundColor = 'Magenta'
	$Host.PrivateData.WarningBackgroundColor = $bckgrnd
	$Host.PrivateData.DebugForegroundColor = 'Yellow'
	$Host.PrivateData.DebugBackgroundColor = $bckgrnd
	$Host.PrivateData.VerboseForegroundColor = 'Green'
	$Host.PrivateData.VerboseBackgroundColor = $bckgrnd
	Clear-Host
}

function isCheck{	
	if (!(Test-Path $pathSql)){
		Write-Host -ForeGroundColor Red "Каталог $pathSql не найден!"
		return $false
	}
	
	if (!(Test-Path $mysql)){
		Write-Host -ForeGroundColor Red "Файл $mysql не найден!"
		return $false
	}
	
	
	if (!(Test-Path $7z)){
		Write-Host -ForeGroundColor Red "Файл $7z не найден!"
		return $false
	}
	return $true	
}

ClearUI
if (!(isCheck)){
	exit
}
Set-Location $pathSql

$files = Get-ChildItem "$pathSql\*.sql"
if (($files|Measure-Object).count -gt 0){
	Remove-Item "*.sql" -Force
	Write-Host -ForegroundColor Cyan "Файлы *.sql успешно удалены!"
}

$files = Get-ChildItem "$pathSql\*.zip"
if (($files|Measure-Object).count -eq 0){
	Write-Host -ForegroundColor Cyan "Файл архива *.zip не найден!"
    exit
}

[string]$fullName = $files[0].FullName
$argList = "e $fullName"
$7zProc = Start-Process -FilePath $7z -ArgumentList $argList -Wait -Passthru 	
if ($7zProc.ExitCode -eq 0) {  
	Write-Host -ForeGroundColor Cyan "Успешная разархивация!"
} else {
	Write-Host -ForeGroundColor Red "Ошибка разархивации БД!"
	exit
}

$argList = "/c $mysql -u $user $databasename < $pathSql\dump.sql"
$mysqlProc = Start-Process -FilePath $cmd -ArgumentList $argList -Wait -Passthru
if ($mysqlProc.ExitCode -eq 0) {
	Write-Host -ForeGroundColor Cyan "Успешный импорт БД!"
} else {
	Write-Host -ForeGroundColor Red "Ошибка импорта БД!"
	exit
}

$files = Get-ChildItem "$pathSql\*.zip"
if (($files|Measure-Object).count -gt 0){
	Remove-Item "$pathSql\*.zip" -Force
}