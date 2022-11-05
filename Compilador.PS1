function Compile-File($diretorio, $saida){
    $arquivos = Get-ChildItem $diretorio -File | where-object Name -Like "*.c*" | Select-Object Name

    $names = $arquivos.Name
    $initial = ".\$diretorio\"

    foreach ($currentItemName in $names) {
        $initial+$currentItemName >> arq.txt
    }

    $end = Get-Content arq.txt

    if($end[0] -match '.'){
        if ($end -match '.cpp') {
            g++ $end -o $saida
        }
        elseif ($end -match '.c') {
            gcc $end -o $saida
        }
        # elseif ($end -match '.java'){

        # }
    }
    else{
        if ($end[0] -match 'cpp') {
            g++ $end -o $saida
        }
        elseif($end[0] -match '.c') {
            gcc $end -o $saida
        }
        # elseif($end[0] -match '.java'){

        # }
    }

    Remove-Item arq.txt
}

Compile-File prog++ teste.exe
# new-alias cf Compile-File