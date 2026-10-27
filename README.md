# Website Maintenance Guide

This repository contains Anbai Jiang's academic website, built with the Academic Pages Jekyll template and deployed through GitHub Pages.

## Editing Homepage Sections

The homepage content is stored in [`_pages/about.md`](_pages/about.md). Its sections currently appear in this order:

1. Profile
2. Education
3. Selected Publications
4. Challenges
5. Services
6. Internships
7. Awards

To reorder the homepage, move an entire block from its opening `<section ...>` tag through its matching `</section>` tag.

### Adding an Education or Internship Entry

Copy and edit this structure inside the appropriate section:

```html
<div class="research-entry">
  <div class="research-entry__heading">
    <strong>Institution or Company</strong>
    <span>Start–End</span>
  </div>
  <p>Degree, position, research topic, or location</p>
</div>
```

### Adding a Challenge, Service, or Award

Add another list item inside the corresponding `<ul>` element:

```html
<li><strong>Name:</strong> Short description.</li>
```

## Editing Publications

Each publication has its own Markdown file under [`_publications/`](_publications). The current selected publications are:

- [`2026-05-01-fisher.md`](_publications/2026-05-01-fisher.md)
- [`2025-10-01-adaptive-prototype-learning.md`](_publications/2025-10-01-adaptive-prototype-learning.md)
- [`2024-05-01-coopasd.md`](_publications/2024-05-01-coopasd.md)
- [`2024-03-01-anopatch.md`](_publications/2024-03-01-anopatch.md)
- [`2023-10-01-aegan-ad.md`](_publications/2023-10-01-aegan-ad.md)

The website has two publication views:

- The Home page shows records with `selected: true` as image-rich selected-publication cards.
- [`/publications/`](https://jianganbai.github.io/publications/) shows records in three groups using `publication_group`, with reverse-chronological ordering within each group.

Important fields in each file:

```yaml
title: "Paper title"
date: 2026-01-01
venue: "IEEE TII"
authors: "First Author, <strong>Anbai Jiang</strong>, Other Author"
summary: "Two or three sentences describing the paper"
image: "publications/fisher.png"
image_alt: "Description of the figure"
image_width: "34%"
```

- `date` in the front matter controls reverse-chronological ordering; the filename does not determine the displayed year or ordering.
- `venue` is displayed before the title on Home, such as `[IEEE TII] Paper Title`. The full Publications page displays the venue and year in a separate metadata column.
- `authors` supports inline HTML. Use `<strong>Anbai Jiang</strong>` to preserve the site's author highlighting.
- `summary` controls the description beside the figure on Home.
- `image` is relative to the [`images/`](images) directory.
- `image_width` controls the figure column. For example, use `"28%"` for more text space or `"40%"` for a larger figure.
- If `image` is omitted, the website displays a labeled placeholder instead of a broken image.
- `selected: true` adds the record to the Selected Publications preview on Home. Use `selected: false` (or omit it) for a record that should appear only on the full Publications page.
- `publication_group: lead` places a record under **First Author / Supervisor-as-the-First-Author Publications**. Use `publication_group: other` for **Other Publications**, or `publication_group: technical_report` for **Technical Reports**. Technical Reports are reserved for DCASE reports and are not peer-reviewed. Every publication record must use one of these three values.

Publication links on the Home-page cards use this format. The compact entries on the full Publications page currently show the title, authors, venue, and year without per-paper links or images:

```yaml
links:
  - label: "Paper"
    url: "https://..."
  - label: "Code"
    url: "https://..."
```

To add a publication, copy an existing publication file, give it a unique filename and `permalink`, update its metadata, and choose its group:

```yaml
collection: publications
selected: false
publication_group: other
```

Set `selected: true` instead when the new record should also appear in the Home-page preview. The full Publications page automatically includes `lead`, `other`, and `technical_report` records; you do not need to edit the page itself.

The Home-page card structure is in [`_includes/publication-card.html`](_includes/publication-card.html). The compact entries on the full Publications page use [`_includes/publication-list-item.html`](_includes/publication-list-item.html). Edit the relevant include when changing the shared structure rather than an individual record.

## Editing the Sidebar and Contact Details

Update the `author` block in [`_config.yml`](_config.yml):

```yaml
author:
  avatar: "bio-jab.png"
  name: "Anbai Jiang（姜安柏）"
  bio: "Ph.D. student at Tsinghua University"
  location: "Beijing, China"
  employer: "Tsinghua University"
  email: "jab22@mails.tsinghua.edu.cn"
  googlescholar: "https://scholar.google.com/citations?user=w68g1qkAAAAJ&hl=en"
  github: "jianganbai"
  cv: "/files/cv.pdf"
```

Place the portrait file under [`images/`](images), then set `avatar` to its filename. Preserve YAML indentation and UTF-8 encoding when editing `_config.yml`. Restart the local Jekyll server after changing this file; configuration changes are not automatically reloaded.

## Navigation and CV

The top navigation is configured in [`_data/navigation.yml`](_data/navigation.yml).

Compile the CV as a PDF and save it exactly as:

```text
files/cv.pdf
```

The deployed download address will be:

```text
https://jianganbai.github.io/files/cv.pdf
```

The top-bar CV button links to this file. The sidebar CV link appears when the PDF exists during the Jekyll build.

The scripts under [`scripts/`](scripts) for Markdown-to-JSON CV conversion are inherited template utilities. Their expected input, `_pages/cv.md`, is not present; they are not part of the current PDF CV workflow.

## Visual Tuning

Homepage and publication-view styling is in [`_sass/layout/_research-home.scss`](_sass/layout/_research-home.scss), imported by [`assets/css/main.scss`](assets/css/main.scss). Jekyll compiles the SCSS; edit the source rather than generated files under `_site/`.

### Introduction Spacing

Adjust this variable:

```scss
$research-intro-gap: 1.25rem;
```

Increase the value for more space before the employment statement.

### Overall Site Width

The maximum site width is controlled by `$x-large` in [`_sass/_themes.scss`](_sass/_themes.scss):

```scss
$x-large: 1440px !default;
```

The main content's right gutter is controlled in [`_sass/layout/_page.scss`](_sass/layout/_page.scss):

```scss
@include suffix(0.5 of 12);
```

Increase `$x-large` for a wider site. This variable also controls the wide-desktop breakpoint, including the fixed sidebar and the change from a 3/9-column sidebar/content layout to 2/10 columns. Review [`_sass/layout/_sidebar.scss`](_sass/layout/_sidebar.scss) and `_page.scss` together when changing it. Reduce the suffix toward `0` to give the main content more horizontal space.

Check both Home and Publications at mobile, intermediate desktop, and wide-desktop widths, in light and dark themes. Confirm that the sidebar, navigation, publication figures, and footer do not overlap content.

## JavaScript Changes

Edit [`assets/js/_main.js`](assets/js/_main.js), [`assets/js/theme.js`](assets/js/theme.js), or the relevant plugin source. When JavaScript changes, install the npm dependencies and regenerate the tracked bundle:

```sh
npm install
npm run build:js
```

Commit the resulting `assets/js/main.min.js` with the source changes. Node/npm are needed for rebuilding JavaScript, not for ordinary content or SCSS edits.

## Local Preview and Build

Use Ruby 3.2, matching the existing build workflow and Docker image, with Bundler installed. From the repository root:

```sh
bundle install
bundle exec jekyll serve
```

Open `http://localhost:4000/` to preview the site. To check a production build in PowerShell:

```powershell
$env:JEKYLL_ENV = "production"
bundle exec jekyll build --strict_front_matter
```

For subsequent development previews, use a new terminal or set `$env:JEKYLL_ENV = "development"` before starting the server. The build output is written to `_site/`, which is ignored by Git.

Alternatively, with Docker and Docker Compose installed:

```sh
docker compose up --build
```

The Compose configuration serves the site on port 4000 using `_config.yml` and `_config_docker.yml`.

## Validation and Deployment

Two source-level layout checks are tracked in the repository. In PowerShell, run the relevant checks when changing the footer or sidebar/page layout:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File test/footer-layout.test.ps1
powershell -NoProfile -ExecutionPolicy Bypass -File test/sidebar-layout.test.ps1
```

The following additional checks may be present in an existing local workspace:

```powershell
python scripts\validate_personal_site.py
powershell -NoProfile -ExecutionPolicy Bypass -File test/publication-index.test.ps1
```

These two additional files are ignored by [`.gitignore`](.gitignore) and are not tracked, so a fresh clone will not contain them. They are optional local checks, not a reproducible repository-wide validation step. Some assertions hard-code publication counts, selected papers, or exact style values; review their expectations when intentionally changing that content or design. Source checks do not replace a Jekyll build and browser inspection.

The existing [Jekyll build workflow](.github/workflows/jekyll-build.yml) runs a production build after the `Cleanup bad PR` workflow completes, with a `main` branch filter. It contains no Pages deployment step and is not a general build-on-push workflow. The branch filter should be checked against the branch in use rather than assumed to cover it.

The site is hosted through GitHub Pages. Check the repository's **Settings → Pages** for the configured publishing branch/folder or Actions source before relying on a push to publish changes; those settings are not recorded in these files. After publication, inspect the deployed Home and Publications pages and confirm that navigation, images, theme switching, contact links, and the CV download work as expected.
