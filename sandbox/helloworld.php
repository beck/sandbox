<?php

#putenv("LANG=es.utf8");
bindtextdomain('messages', dirname(__FILE__).'/locale');

echo _("Hello World");
echo "\n";

echo _("   Frosty the ☃, is a fairytale, they say.   ");
echo "\n";

# test other function
echo gettext("Hello World");
echo "\n";
