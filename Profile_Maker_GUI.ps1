Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$currentVersion = "1.1"
$versionUrl = "https://raw.githubusercontent.com/MAB-Tech-Pro/Profile-Maker/main/version.json"
$scriptUrl = "https://raw.githubusercontent.com/MAB-Tech-Pro/Profile-Maker/main/Profile_Maker_GUI.ps1"

try {
    $response = Invoke-RestMethod -Uri $versionUrl -TimeoutSec 3
    if ($response.version -ne $currentVersion) {
        [System.Windows.Forms.MessageBox]::Show("Naya update agaya hai! Software abhi update ho raha hai. Please wait...", "Auto Update", 0, [System.Windows.Forms.MessageBoxIcon]::Information)
        
        Invoke-WebRequest -Uri $scriptUrl -OutFile $PSCommandPath
        
        [System.Windows.Forms.MessageBox]::Show("Update mukammal ho gaya! Tool dobara start ho raha hai.", "Success", 0, [System.Windows.Forms.MessageBoxIcon]::Information)
        
        Start-Process "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -WindowStyle Hidden -File `"$PSCommandPath`""
        exit
    }
} catch {
}
$currentDir = $PSScriptRoot
if (-not $currentDir) { $currentDir = (Get-Location).Path } 

$exePath = Join-Path $currentDir "cent.exe"
$chromePath = Join-Path $currentDir "chrome.exe"
$baseDir = Join-Path $currentDir "Profiles"

$shortcutsDir = Join-Path $currentDir "Profile Shortcuts"
$form = New-Object System.Windows.Forms.Form
$form.Text = "Cent Browser - Profile Generator"
$form.ClientSize = New-Object System.Drawing.Size(420, 385)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::White

$defaultFont = New-Object System.Drawing.Font("Segoe UI", 9.5)
$form.Font = $defaultFont

$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Size = New-Object System.Drawing.Size(420, 75)
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(41, 128, 185) # Professional Blue
$headerPanel.Dock = [System.Windows.Forms.DockStyle]::Top
$form.Controls.Add($headerPanel)

$headerTitle = New-Object System.Windows.Forms.Label
$headerTitle.Text = "PROFILE GENERATOR"
$headerTitle.Font = New-Object System.Drawing.Font("Segoe UI", 16, [System.Drawing.FontStyle]::Bold)
$headerTitle.ForeColor = [System.Drawing.Color]::White
$headerTitle.AutoSize = $true
$headerTitle.Location = New-Object System.Drawing.Point(20, 12)
$headerPanel.Controls.Add($headerTitle)

$headerSub = New-Object System.Windows.Forms.Label
$headerSub.Text = "Automated Isolated Environments"
$headerSub.Font = New-Object System.Drawing.Font("Segoe UI", 9.5, [System.Drawing.FontStyle]::Regular)
$headerSub.ForeColor = [System.Drawing.Color]::LightGray
$headerSub.AutoSize = $true
$headerSub.Location = New-Object System.Drawing.Point(23, 42)
$headerPanel.Controls.Add($headerSub)

$groupBox = New-Object System.Windows.Forms.GroupBox
$groupBox.Text = "Configuration Options"
$groupBox.Font = New-Object System.Drawing.Font("Segoe UI", 9.5, [System.Drawing.FontStyle]::Bold)
$groupBox.Size = New-Object System.Drawing.Size(380, 145)
$groupBox.Location = New-Object System.Drawing.Point(20, 90)
$form.Controls.Add($groupBox)

$label1 = New-Object System.Windows.Forms.Label
$label1.Location = New-Object System.Drawing.Point(15, 30)
$label1.Size = New-Object System.Drawing.Size(340, 20)
$label1.Text = "Number of profiles to generate (e.g., 10):"
$label1.Font = $defaultFont
$groupBox.Controls.Add($label1)

$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox1.Location = New-Object System.Drawing.Point(15, 52)
$textBox1.Size = New-Object System.Drawing.Size(345, 25)
$textBox1.Font = $defaultFont
$groupBox.Controls.Add($textBox1)

$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(15, 85)
$label2.Size = New-Object System.Drawing.Size(340, 20)
$label2.Text = "Starting profile number (e.g., 51):"
$label2.Font = $defaultFont
$groupBox.Controls.Add($label2)

$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox2.Location = New-Object System.Drawing.Point(15, 107)
$textBox2.Size = New-Object System.Drawing.Size(345, 25)
$textBox2.Font = $defaultFont
$groupBox.Controls.Add($textBox2)

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(20, 250)
$button.Size = New-Object System.Drawing.Size(380, 45)
$button.Text = "GENERATE PROFILES"
$button.Font = New-Object System.Drawing.Font("Segoe UI", 10.5, [System.Drawing.FontStyle]::Bold)
$button.BackColor = [System.Drawing.Color]::FromArgb(220, 224, 228)
$button.ForeColor = [System.Drawing.Color]::FromArgb(40, 40, 40)
$button.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$button.FlatAppearance.BorderColor = [System.Drawing.Color]::DarkGray
$button.FlatAppearance.BorderSize = 1
$button.Cursor = [System.Windows.Forms.Cursors]::Hand
$form.Controls.Add($button)

$footerPanel = New-Object System.Windows.Forms.Panel
$footerPanel.Size = New-Object System.Drawing.Size(420, 70)
$footerPanel.BackColor = [System.Drawing.Color]::FromArgb(236, 240, 241)
$footerPanel.Dock = [System.Windows.Forms.DockStyle]::Bottom
$form.Controls.Add($footerPanel)

$devLabel = New-Object System.Windows.Forms.Label
$devLabel.Text = "Developed by: MAB TECH | WhatsApp: +92 310 6055007"
$devLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$devLabel.ForeColor = [System.Drawing.Color]::DarkSlateGray
$devLabel.AutoSize = $false
$devLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$devLabel.Size = New-Object System.Drawing.Size(420, 20)
$devLabel.Location = New-Object System.Drawing.Point(0, 12)
$footerPanel.Controls.Add($devLabel)

$webLink = New-Object System.Windows.Forms.LinkLabel
$webLink.Text = "www.themabtech.com"
$webLink.Font = New-Object System.Drawing.Font("Segoe UI", 9.5, [System.Drawing.FontStyle]::Regular)
$webLink.AutoSize = $false
$webLink.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$webLink.Size = New-Object System.Drawing.Size(420, 20)
$webLink.Location = New-Object System.Drawing.Point(0, 35)
$webLink.LinkColor = [System.Drawing.Color]::FromArgb(41, 128, 185)
$footerPanel.Controls.Add($webLink)

$webLink.Add_LinkClicked({
    [System.Diagnostics.Process]::Start("https://themabtech.com")
})

$button.Add_Click({
    
    if (!(Test-Path $exePath)) {
        if (Test-Path $chromePath) {
            try {
                Rename-Item -Path $chromePath -NewName "cent.exe"
            } catch {
                [System.Windows.Forms.MessageBox]::Show("The script attempted to rename 'chrome.exe' to 'cent.exe', but Windows blocked it. Please rename the browser executable manually.", "Permission Denied", 0, [System.Windows.Forms.MessageBoxIcon]::Warning)
                return
            }
        } else {
            [System.Windows.Forms.MessageBox]::Show("Browser executable not found! Please place this tool in the same directory as your Cent Browser (cent.exe).", "Location Error", 0, [System.Windows.Forms.MessageBoxIcon]::Error)
            return
        }
    }

    $count = 0
    $startNum = 0
    
    if ([int]::TryParse($textBox1.Text, [ref]$count) -and [int]::TryParse($textBox2.Text, [ref]$startNum)) {
        if ($count -gt 0 -and $startNum -gt 0) {
            
            if (!(Test-Path $shortcutsDir)) { 
                New-Item -ItemType Directory -Path $shortcutsDir | Out-Null 
            }

            $wshShell = New-Object -ComObject WScript.Shell

            for ($i = 0; $i -lt $count; $i++) {
                $currentNum = $startNum + $i
                $profileName = "Profile$currentNum"
                $profileDir = Join-Path $baseDir $profileName
                
                if (!(Test-Path $profileDir)) { 
                    New-Item -ItemType Directory -Path $profileDir | Out-Null 
                }

                $shortcutPath = Join-Path $shortcutsDir "$profileName.lnk"
                $shortcut = $wshShell.CreateShortcut($shortcutPath)
                $shortcut.TargetPath = $exePath
                $shortcut.Arguments = "--user-data-dir=`"$profileDir`""
                $shortcut.IconLocation = "$exePath,0"
                $shortcut.Save()
            }
            
            [System.Windows.Forms.MessageBox]::Show("Successfully generated $count isolated profiles and shortcuts inside the 'Profile Shortcuts' folder.", "Operation Complete", 0, [System.Windows.Forms.MessageBoxIcon]::Information)
            $form.Close()
        } else {
            [System.Windows.Forms.MessageBox]::Show("Numbers must be greater than zero.", "Invalid Input", 0, [System.Windows.Forms.MessageBoxIcon]::Warning)
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Please enter valid numeric values in both fields.", "Input Error", 0, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

$form.ShowDialog()