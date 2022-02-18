param (
    [string] $text,
    [string] $html
)

Add-Type -TypeDefinition (Get-Content $PSScriptRoot/ClipboardHelper.cs -Raw)

$data = New-Object System.Windows.Forms.DataObject
$data.SetData([System.Windows.Forms.DataFormats]::Html, [ClipboardHelper]::GetHtmlDataString($html))
$data.SetData([System.Windows.Forms.DataFormats]::Text, $text)
[System.Windows.Forms.Clipboard]::SetDataObject($data)
