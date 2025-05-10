---
title:  "Test Slides"
author: "[`jessekelighine.com`](https://jessekelighine.com)"
date: "2025-05-10"
---

# Slide 1 

- How does this work?

$$
\int_0^1 x^2 \, dx = \frac{1}{3} 
$$

------------------------------------------------------------------ 

# Slide 2

Here is some demo code

```r
data |>
  dplyr::group_by(unit) |>
  dplyr::mutate(treatment_time = suppressWarnings(min(year[as.logical(D)]))) |>
  dplyr::ungroup() |>
  dplyr::mutate(test = first.treat == treatment_time) |>
  dplyr::pull(test) |>
  all()
```
