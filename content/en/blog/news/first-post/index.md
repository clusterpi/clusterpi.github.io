---
date: 2018-10-06
title: "Sample Post"
linkTitle: "Sample Post"
description: "An example post"
author: Gregor von Laszewski ([@laszewsk](https://laszewski.github.io))
resources:
- src: "**.{png,jpg}"
  title: "PI"
  params:
    byline: "Photo: pixabay / CC-BY-CA"
---

**This is a typical blog post that includes images.**

The front matter specifies the date of the blog post, its title, a short description that will be displayed on the blog landing page, and its author.

## Including images

Here's an image (`featured.jpg`) that includes a byline and a caption.

{{< imgproc pi Fill "600x300" >}}
Fetch and scale an image in the upcoming Hugo 0.43.
{{< /imgproc >}}

The front matter of this post specifies properties to be assigned to all image resources:

```
resources:
- src: "**.{png,jpg}"
  title: "Image #:counter"
  params:
    byline: "Photo: pixabay / CC-BY-CA"
```

To include the image in a page, specify its details like this:

```
{{< imgproc pi Fill "600x300" >}}
Fetch and scale an image in the upcoming Hugo 0.43.
{{< /imgproc >}}
```

The image will be rendered at the size and byline specified in the front matter.


