---
permalink: /
title: ""
author_profile: true
redirect_from:
  - /about/
  - /about.html
---

<section class="research-intro" aria-labelledby="introduction-heading">
  <h1 id="introduction-heading">Research Scientist in Audio and Multimodal Learning</h1>

  I am a Ph.D. student in Electronic Engineering at Tsinghua University, supervised by Prof. Pingyi Fan. My research focuses on universal representation learning for audio, vibration, and multimodal industrial signals, with particular interests in foundation models and anomaly detection.

  <p class="research-opportunity">I expect to graduate in 2027 and am seeking full-time Research Scientist opportunities, particularly in speech and audio foundation models.</p>
</section>

<section id="research-interests" class="research-interests" aria-labelledby="research-interests-heading">
  <h2 id="research-interests-heading">Research Interests</h2>

  - Speech and audio foundation models
  - Universal representation learning
  - Multimodal industrial signals
  - Anomalous sound detection
</section>

<section id="publications" aria-labelledby="publications-heading">
  <h2 id="publications-heading">Selected Publications</h2>

  {% assign selected_publications = site.publications | where: "selected", true | sort: "date" | reverse %}
  {% for publication in selected_publications %}
    {% include publication-card.html publication=publication %}
  {% endfor %}
</section>

<section id="highlights" class="research-highlights" aria-labelledby="highlights-heading">
  <h2 id="highlights-heading">Highlights</h2>

  - **Education:** Ph.D. student in Electronic Engineering, Tsinghua University, 2022–present; expected graduation in 2027.
  - **Education:** B.S. in Electronic Engineering, Tsinghua University, 2018–2022.
  - **Award:** IIEP Research Scholarship, 2026.
  - **Award:** DCASE 2024 Challenge Judges' Award.
  - **Challenge:** DCASE 2024 Task 2 — first- and second-place systems.
  - **Challenge:** ICME 2024 ASC Grand Challenge — second- and third-place systems.
  - **Challenge:** DCASE 2023 Task 2 — second- and third-place systems.
</section>
