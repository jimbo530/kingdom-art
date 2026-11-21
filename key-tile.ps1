# key-tile.ps1 <input.jpg> <output.png> [tolerance=900] — keys the corner color to transparent
param([string]$in,[string]$out,[int]$tol=900)
Add-Type -AssemblyName System.Drawing
$img=[System.Drawing.Image]::FromFile($in)
$bmp=New-Object System.Drawing.Bitmap($img.Width,$img.Height,[System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$g=[System.Drawing.Graphics]::FromImage($bmp); $g.DrawImage($img,0,0,$img.Width,$img.Height); $g.Dispose(); $img.Dispose()
$key=$bmp.GetPixel(5,5)
$rect=New-Object System.Drawing.Rectangle(0,0,$bmp.Width,$bmp.Height)
$data=$bmp.LockBits($rect,[System.Drawing.Imaging.ImageLockMode]::ReadWrite,[System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$len=$data.Stride*$bmp.Height; $bytes=New-Object byte[] $len
[System.Runtime.InteropServices.Marshal]::Copy($data.Scan0,$bytes,0,$len)
$kr=[int]$key.R;$kg=[int]$key.G;$kb=[int]$key.B
for($i=0;$i -lt $len;$i+=4){ $b=$bytes[$i];$gg=$bytes[$i+1];$r=$bytes[$i+2]; $dr=$r-$kr;$dg=$gg-$kg;$db=$b-$kb; if(($dr*$dr+$dg*$dg+$db*$db) -lt $tol){$bytes[$i+3]=0} }
[System.Runtime.InteropServices.Marshal]::Copy($bytes,0,$data.Scan0,$len)
$bmp.UnlockBits($data)
$bmp.Save($out,[System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Host "installed $(Split-Path $out -Leaf)"
