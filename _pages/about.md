---
permalink: /
title: ""
author_profile: true
redirect_from:
  - /about/
  - /about.html
---

<section class="research-intro" aria-labelledby="introduction-heading">
  <h1 id="introduction-heading">Background</h1>

  <p class="research-summary">I am currently a Ph.D. student at the Department of Electronic Engineering of Tsinghua University, supervised by Prof. Pingyi Fan (WISTLAB) and co-advised by Prof. Jia Liu and Prof. Wei-Qiang Zhang (SATLAB). Prior to that, I received my Bachelor's degree in Electronic Engineering from Tsinghua University in 2022.</p>
  
  <p class="research-summary">My research focuses on universal representation of multimodal industrial signals (mostly audio and vibration), and downstream anomaly detection. We want to perceive the world through hearing. Our goal is not just publications, but more importantly, to see technology truly put into practice and to contribute to a better world.</p>

  <p class="research-opportunity">I expect to graduate in June, 2027. I am seeking full-time job in industries, particularly in speech and audio foundation models. Feel free to reach out to me for small talks if you are interested.</p>
</section>

<section id="education" class="research-section" aria-labelledby="education-heading">
  <h2 id="education-heading">Education</h2>

  <div class="research-entry">
    <div class="research-entry__heading"><strong>Tsinghua University</strong><span>2022–Present</span></div>
    <p>Ph.D. student in Electronic Engineering. Expected to graduate in June, 2027.<br>Supervisor: Prof. Pingyi Fan. Co-advised by Prof. Jia Liu and Prof. Wei-Qiang Zhang</p>
  </div>

  <div class="research-entry">
    <div class="research-entry__heading"><strong>Tsinghua University</strong><span>2018–2022</span></div>
    <p>B.S. in Electronic Engineering</p>
  </div>
</section>

<section id="challenges" class="research-section" aria-labelledby="challenges-heading">
  <h2 id="challenges-heading">Challenges</h2>
  <ul>
    <li><strong>DCASE 2024 Task 2:</strong> machine anomalous sound detection — first- and second-place systems.</li>
    <li><strong>ICME 2024 ASC Grand Challenge:</strong> acoustic scene classification in urban cities — second- and third-place systems.</li>
    <li><strong>DCASE 2023 Task 2:</strong> machine anomalous sound detection — second- and third-place systems.</li>
  </ul>
</section>

<section id="publications" aria-labelledby="publications-heading">
  <h2 id="publications-heading">Selected Publications</h2>

  {% assign selected_publications = site.publications | where: "selected", true | sort: "date" | reverse %}
  {% for publication in selected_publications %}
    {% include publication-card.html publication=publication %}
  {% endfor %}
</section>

<section id="internships" class="research-section" aria-labelledby="internships-heading">
  <h2 id="internships-heading">Internships</h2>

  <div class="research-entry">
    <div class="research-entry__heading"><strong>Huakong AI Plus</strong><span>Nov. 2023–Present</span></div>
    <p>Signal processing for real-world machines · Beijing, China</p>
  </div>

  <div class="research-entry">
    <div class="research-entry__heading"><strong>Tencent CDG</strong><span>Jul.–Aug. 2024</span></div>
    <p>Large language models for recommendation · Shenzhen, China</p>
  </div>

  <div class="research-entry">
    <div class="research-entry__heading"><strong>Tencent CSIG</strong><span>Jun.–Nov. 2023</span></div>
    <p>Target-speaker automatic speech recognition · Beijing, China</p>
  </div>

  <div class="research-entry">
    <div class="research-entry__heading"><strong>Baidu Paddle</strong><span>Jun.–Oct. 2021</span></div>
    <p>Model survey and tutorials for PaddleHub · Beijing, China</p>
  </div>
</section>

<section id="awards" class="research-section research-awards" aria-labelledby="awards-heading">
  <h2 id="awards-heading">Awards</h2>
  <ul>
    <li><strong>IIEP Research Scholarship</strong>, IIEP, March 2026.</li>
    <li><strong>DCASE 2024 Challenge Judges' Award</strong>, October 2024.</li>
  </ul>
</section>
