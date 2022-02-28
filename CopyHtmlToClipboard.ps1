param (
    [string] $text,
    [string] $html
)

Add-Type -TypeDefinition (Get-Content $PSScriptRoot/ClipboardHelper.cs -Raw)
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

$data = New-Object System.Windows.Forms.DataObject
$data.SetData([System.Windows.Forms.DataFormats]::Text, $text)
if ($html) {
    $data.SetData([System.Windows.Forms.DataFormats]::Html, [ClipboardHelper]::GetHtmlDataString($html))
}
[System.Windows.Forms.Clipboard]::SetDataObject($data)
