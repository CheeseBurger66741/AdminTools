Clear-Host

function Show-Menu {
    Write-Host "===============================" -ForegroundColor Red
    Write-Host "          Admin Menu"           -ForegroundColor Red
    Write-Host "===============================" -ForegroundColor Red
    Write-Host "1. System Information"          -ForegroundColor Red
    Write-Host "2. Network Information"         -ForegroundColor Red
    Write-Host "3. Running Services"            -ForegroundColor Red
    Write-Host "4. CPU Info"                    -ForegroundColor Red
    Write-Host "5. List Partitions"             -ForegroundColor Red
    Write-Host "0. Exit"                        -ForegroundColor Red
    Write-Host "===============================" -ForegroundColor Red
}

function Run-Choice {
    param($choice)

    switch ($choice) {

        1 {
            Write-Host "Running System Information..." -ForegroundColor Cyan
            & "..\modules\systeminfo.ps1"
        }

        2 {
            Write-Host "Running Network Information..." -ForegroundColor Cyan
            & "..\modules\network.ps1"
        }

        3 {
            Write-Host "Running Running Services..." -ForegroundColor Cyan
            & "..\modules\services.ps1"
        }

        4 {
            Write-Host "Running CPU info..." -ForegroundColor Cyan
            & "..\modules\cpuinfo.ps1"
        }

        5 {
            Write-Host "Running List Partitions..." -ForegroundColor Cyan
            & "..\modules\listPartitions.ps1"
        }

        0 {
            Write-Host "Exiting..." -ForegroundColor Yellow
            exit
        }

        default {
            Write-Host "Invalid choice, try again." -ForegroundColor Red
        }
    }
}

# --- Main Loop ---
do {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    Run-Choice $choice
    Write-Host ""
} while ($true)
