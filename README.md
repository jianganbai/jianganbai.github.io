# Website Maintenance Guide

This repository contains Anbai Jiang's academic website, built with the Academic Pages Jekyll template and deployed through GitHub Pages.

## Editing Homepage Sections

The homepage content is stored in [`_pages/about.md`](_pages/about.md). Its sections currently appear in this order:

1. Introduction
2. Education
3. Challenges
4. Selected Publications
5. Internships
6. Awards

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

### Adding a Challenge or Award

Add another list item inside the corresponding `<ul>` element:

```html
<li><strong>Name:</strong> Short description.</li>
```

## Editing Publications

Each selected publication has its own Markdown file under [`_publications/`](_publications):

- [`2026-01-01-fisher.md`](_publications/2026-01-01-fisher.md)
- [`2025-01-01-adaptive-prototype-learning.md`](_publications/2025-01-01-adaptive-prototype-learning.md)
- [`2024-12-01-coopasd.md`](_publications/2024-12-01-coopasd.md)
- [`2024-09-01-anopatch.md`](_publications/2024-09-01-anopatch.md)
- [`2023-01-01-aegan-ad.md`](_publications/2023-01-01-aegan-ad.md)

Important fields in each file:

```yaml
title: "Paper title"
date: 2026-01-01
venue: "IEEE TII"
authors: "Author list"
summary: "Two or three sentences describing the paper"
image: "publications/fisher.png"
image_alt: "Description of the figure"
image_width: "34%"
```

- `date` controls reverse-chronological ordering.
- `venue` is displayed before the title, such as `[IEEE TII] Paper Title`.
- `summary` controls the description beside the figure.
- `image` is relative to the [`images/`](images) directory.
- `image_width` controls the figure column. For example, use `"28%"` for more text space or `"40%"` for a larger figure.
- If `image` is omitted, the website displays a labeled placeholder instead of a broken image.

Publication links use this format:

```yaml
links:
  - label: "Paper"
    url: "https://..."
  - label: "Code"
    url: "https://..."
```

To add a publication, copy an existing publication file, give it a unique filename and `permalink`, update its metadata, and retain:

```yaml
collection: publications
selected: true
```

The shared layout for all publication cards is [`_includes/publication-card.html`](_includes/publication-card.html). Edit this include only when changing every publication's structure.

## Editing the Sidebar and Contact Details

Update the `author` block in [`_config.yml`](_config.yml):

```yaml
author:
  avatar: "profile-placeholder.svg"
  name: "Anbai Jiang"
  bio: "Ph.D. student at Tsinghua University"
  location: "Beijing, China"
  employer: "Tsinghua University"
  email: "jab22@mails.tsinghua.edu.cn"
  googlescholar: "https://scholar.google.com/citations?user=w68g1qkAAAAJ&hl=en"
  github: "jianganbai"
  cv: "/files/cv.pdf"
```

Place the portrait file under [`images/`](images), then set `avatar` to its filename. Preserve YAML indentation when editing `_config.yml`.

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

## Visual Tuning

Homepage-specific styling is in [`_sass/layout/_research-home.scss`](_sass/layout/_research-home.scss).

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

Increase `$x-large` for a wider site. Reduce the suffix toward `0` to give the main content more horizontal space.

## Validation and Deployment

Before pushing changes, run the source-level checks:

```powershell
python scripts\validate_personal_site.py
```

After committing and pushing, GitHub Pages rebuilds the website. Inspect the deployed site and confirm that the layout, links, images, and CV download work as expected.
