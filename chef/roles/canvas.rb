name "canvas-role"
description "This role specifies all recipes necessary to run Canvas LMS"

run_list(
    "recipe[git]",
    "recipe[python]",
    "recipe[ruby]",
    "recipe[nodejs]",
    "recipe[canvas]"
  )