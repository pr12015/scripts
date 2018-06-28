[ "$theme_display_date" = "no" ]; and return
set -q theme_date_format
  or set -l theme_date_format "+%c"

echo -n ' '
date $theme_date_format
