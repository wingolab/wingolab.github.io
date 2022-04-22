---
layout: page
title: Projects
permalink: /Projects/
---
Our lab focuses on understanding the genetic basis of neurodegenerative
disease (i.e., Alzheimer Disease) and psychological traits (i.e., psychological
well-being or resilience). Our work has been featured in the
    <a href="http://www.huffingtonpost.com/entry/593de662e4b0b65670e56be6">
      Huffington Post</a>, the
    <a href="http://emoryhealthmagazine.emory.edu/issues/2016/winter/features/blessing-from-a-curse/index.html">
      Emory Health Magazine</a>, and
    <a href="https://www.cnn.com/2019/02/06/health/education-dementia-study/index.html">CNN
    </a>.

{% for current in site.lab_projects %}

### {{current.title}}

{% for desc in current.title %}

{% for sub in current.sub_header %}

{% if sub.indent %}

- **{{sub.indent}}** - {{sub.indent_desc}}

{% endif %}
{% endfor %}

{{current.description}}

<div markdown="1" class="col-md">


</div>

{% endfor %}
{% endfor %}

