$footerScss = Get-Content -LiteralPath (Join-Path $PSScriptRoot '..\_sass\layout\_footer.scss') -Raw

if ($footerScss -match '(?s)\.page__footer\s*\{.*?position:\s*fixed;') {
  throw 'The page footer must remain in normal document flow.'
}

if ($footerScss -notmatch 'margin-top:\s*0\.5em;' -or $footerScss -notmatch 'padding:\s*0 1em 0\.5em;') {
  throw 'The footer wrapper must use compact vertical spacing.'
}

if ($footerScss -notmatch 'padding-top:\s*2px;' -or $footerScss -notmatch 'padding-bottom:\s*2px;') {
  throw 'Footer links must use compact vertical padding.'
}
if ($footerScss -notmatch '(?s)\.page__footer\s*\{.*?margin-top:\s*1\.5em;') {
  throw 'The footer must leave only compact separation from page content.'
}