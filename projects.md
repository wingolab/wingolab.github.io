---
layout: page
title: Projects
permalink: /Projects/
---

Our lab focuses on understanding the genetic basis of brain conditions and illnesses.
Our work has been covered in the popular press by [Huffington Post][1], [Stat][4] the [Emory Health Magazine][2], [CNN][3], Medical Xpress ([here][5] and [here][6]).

{% for current in site.projects %}

### {{current.title}}

{% for desc in current.title %}

{% if current.funding %}

{{current.description}} ({{current.funding}})

{% else %}

{{current.description}}

{% endif %}

{% for sub in current.sub_projects %}

{% if sub.title %}

{% if sub.funding %}

- **{{sub.title}}** ({{sub.funding}}) - {{sub.description}}

{% else %}

- **{{sub.title}}** - {{sub.description}}

{% endif %}

{% endif %}

{% endfor %}

<div markdown="1" class="col-md">

</div>

{% endfor %}

{% endfor %}

[1]: http://www.huffingtonpost.com/entry/593de662e4b0b65670e56be6
[2]: http://emoryhealthmagazine.emory.edu/issues/2016/winter/features/blessing-from-a-curse/index.html
[3]: https://www.cnn.com/2019/02/06/health/education-dementia-study/index.html
[4]: https://www.statnews.com/2017/09/11/alzheimers-disease-gene-family/
[5]: https://medicalxpress.com/news/2022-02-depression-alzheimer-disease-genetic-roots.html
[6]: https://medicalxpress.com/news/2016-02-family-unusually-heritable-alzheimer.html
