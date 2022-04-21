---
layout: page
title: People
permalink: /people/
---

{% for group in site.lab_members %}

## **{{group.category}}**

{% for person in group.people %}

<div class="row bio-description">

{% if person.pic_name %}

<div class="col-md-auto">
<img class="picture" alt="{{person.pic_name}}" src="/assets/{{person.pic_name}}.jpg">
</div>

{% endif %}

<div markdown="1" class="col-md">

### {{person.title}}

{% for link in person.links %} \[[{{link.name}}]({{link.href}})\] {% endfor %}

{{person.description}}
</div>
</div>
{% endfor %}
{% endfor %}



