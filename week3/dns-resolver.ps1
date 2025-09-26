param($NetworkPrefix, $DnsServer)
$base = $NetworkPrefix -replace '\d+/\d+$', ''
1..254 | ForEach-Object { 
    $result = Resolve-DnsName -DnsOnly "$base$_" -Server $DnsServer -ErrorAction Ignore
    if ($result) { "$base$_ -> $($result.NameHost)" }
}