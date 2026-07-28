---
permalink: /publications/
title: ""
author_profile: true
---

{% assign lead_publications = site.publications | where: "publication_group", "lead" | sort: "date" | reverse %}
{% assign other_publications = site.publications | where: "publication_group", "other" | sort: "date" | reverse %}
{% assign technical_reports = site.publications | where: "publication_group", "technical_report" | sort: "date" | reverse %}

<section class="publication-index" aria-labelledby="lead-publications-heading">
  <h1 class="publication-index__title">Publications</h1>
  <h2 id="lead-publications-heading">First Author / Supervisor-as-the-First-Author Publications</h2>
  {% for publication in lead_publications %}
    {% include publication-list-item.html publication=publication %}
  {% else %}
    <p>No publications in this group yet.</p>
  {% endfor %}
</section>

<section class="publication-index" aria-labelledby="other-publications-heading">
  <h2 id="other-publications-heading">Other Publications</h2>
  {% for publication in other_publications %}
    {% include publication-list-item.html publication=publication %}
  {% else %}
    <p>No publications in this group yet.</p>
  {% endfor %}
</section>
<section class="publication-index" aria-labelledby="technical-reports-heading">
  <h2 id="technical-reports-heading">Technical Reports</h2>
  <p class="publication-index__note">DCASE technical reports; not peer-reviewed.</p>
  {% for publication in technical_reports %}
    {% include publication-list-item.html publication=publication %}
  {% else %}
    <p>No technical reports in this group yet.</p>
  {% endfor %}
</section>