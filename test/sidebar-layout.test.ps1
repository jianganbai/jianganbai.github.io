$sidebarScss = Get-Content -LiteralPath (Join-Path $PSScriptRoot '..\_sass\layout\_sidebar.scss') -Raw

if ($sidebarScss -notmatch '@include breakpoint\(\$x-large\)\s*\{\s*height: 100vh;') {
  throw 'The sidebar must become fixed only at the wide-desktop breakpoint.'
}
