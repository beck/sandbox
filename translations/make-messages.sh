#!/bin/bash
set -eu
cd "$(dirname "$0")"

pot='messages.pot'
touch $pot

function mygettext {
    # wrapper to add options and ensure headers are correct

    # holy hell gettext headers are dumb.  If the first file it scans does not
    # have a non-ascii character, it will set charset=CHARSET
    # try it:
    #    echo 'gettext("a");' | xgettext --from-code=utf-8 --language=C --output=- -
    #    echo 'gettext("′");' | xgettext --from-code=utf-8 --language=C --output=- -
    # Hoping to use --omit-header, it then chokes on utf-8
    #    echo 'gettext("′");' | xgettext --from-code=utf-8 --language=C --output=- --omit-header -

    xgettext \
        --from-code=UTF-8 \
        --add-comments \
        --width 80 \
        --no-wrap \
        --no-location \
        --sort-output \
        --language=php \
        --join-existing \
        --output=$pot \
        "$1"
    sed -i .bak 's/charset=CHARSET/charset=UTF-8/g' $pot
    rm $pot.bak
}

# update po template
echo "Updating template."
for fname in $(find . -name '*.html' -or -name '*.php')
do
    mygettext "$fname"
done

# msgmerge & msgfmt pot > po
echo -n "Updating messages .."
options="--sort-output --no-location --width=80"
po='app/locale/es/LC_MESSAGES/messages.po'
touch "$po"
msgmerge $po $pot $options -o $po.tmp
mv $po.tmp $po
mo=${po%.*}.mo
touch $mo
msgfmt --use-fuzzy --verbose $po -o $mo
