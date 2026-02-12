Add-Type -AssemblyName System.Drawing

function Create-PlaceholderImage {
    param (
        [string]$text,
        [string]$outputPath,
        [string]$bgColorName
    )

    $width = 800
    $height = 600
    if ($outputPath -match "hero") {
        $width = 1920
        $height = 1080
    }

    $bmp = New-Object System.Drawing.Bitmap $width, $height
    $graphics = [System.Drawing.Graphics]::FromImage($bmp)
    
    $color = [System.Drawing.Color]::FromName($bgColorName)
    $brush = New-Object System.Drawing.SolidBrush $color
    $graphics.FillRectangle($brush, 0, 0, $width, $height)
    
    $font = New-Object System.Drawing.Font "Arial", 40
    $textBrush = [System.Drawing.Brushes]::White
    $format = New-Object System.Drawing.StringFormat
    $format.Alignment = [System.Drawing.StringAlignment]::Center
    $format.LineAlignment = [System.Drawing.StringAlignment]::Center
    
    $graphics.DrawString($text, $font, $textBrush, (New-Object System.Drawing.RectangleF 0, 0, $width, $height), $format)
    
    $bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Jpeg)
    
    $graphics.Dispose()
    $bmp.Dispose()
}

if (-not (Test-Path "assets/hero-srilanka.jpg")) {
    Create-PlaceholderImage -text "Beautiful Sri Lanka Beach" -outputPath "assets/hero-srilanka.jpg" -bgColorName "Coral"
}
if (-not (Test-Path "assets/kandy.jpg")) {
    Create-PlaceholderImage -text "Temple of the Tooth" -outputPath "assets/kandy.jpg" -bgColorName "Goldenrod"
}
if (-not (Test-Path "assets/galle.jpg")) {
    Create-PlaceholderImage -text "Galle Fort" -outputPath "assets/galle.jpg" -bgColorName "Sienna"
}
if (-not (Test-Path "assets/nuwaraeliya.jpg")) {
    Create-PlaceholderImage -text "Sample Nuwara Eliya" -outputPath "assets/nuwaraeliya.jpg" -bgColorName "ForestGreen"
}
