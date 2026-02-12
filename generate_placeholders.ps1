Add-Type -AssemblyName System.Drawing

function Create-PlaceholderImage {
    param (
        [string]$text,
        [string]$outputPath,
        [string]$bgColorName
    )

    $width = 800
    $height = 600
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

Create-PlaceholderImage -text "Sigiriya Rock" -outputPath "assets/sigiriya.jpg" -bgColorName "DarkOrange"
Create-PlaceholderImage -text "Ella Nine Arch" -outputPath "assets/ella.jpg" -bgColorName "ForestGreen"
Create-PlaceholderImage -text "Elephants" -outputPath "assets/elephants.jpg" -bgColorName "DimGray"
Create-PlaceholderImage -text "Tea Plantation" -outputPath "assets/tea-plantation.jpg" -bgColorName "SeaGreen"
