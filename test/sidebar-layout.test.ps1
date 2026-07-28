$sidebarScss = Get-Content -LiteralPath (Join-Path $PSScriptRoot '..\_sass\layout\_sidebar.scss') -Raw

if ($sidebarScss -notmatch '@include breakpoint\(\$x-large\)\s*\{\s*height: 100vh;') {
  throw 'The sidebar must become fixed only at the wide-desktop breakpoint.'
}
if ($sidebarScss -notmatch '@include breakpoint\(\$large\)\s*\{\s*@include span\(3 of 12\);') {
  throw 'The intermediate desktop sidebar must reserve three grid columns.'
}

if ($sidebarScss -notmatch '@include breakpoint\(\$x-large\)\s*\{\s*@include span\(2 of 12\);') {
  throw 'The wide desktop sidebar must return to two grid columns.'
}
$pageScss = Get-Content -LiteralPath (Join-Path $PSScriptRoot '..\_sass\layout\_page.scss') -Raw

if ($pageScss -notmatch '@include breakpoint\(\$large\)\s*\{\s*@include span\(9 of 12 last\);') {
  throw 'The intermediate desktop article must use the nine-column complement.'
}

if ($pageScss -notmatch '@include breakpoint\(\$x-large\)\s*\{\s*@include span\(10 of 12 last\);') {
  throw 'The wide desktop article must return to ten columns.'
}