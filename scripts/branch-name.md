Some folks:

```
mkbranch ()
{
    git checkout -b $(mkname)
}
```


Others:
```
function random-word {
    gshuf -n1 ~/eff_short_wordlist_1.txt | awk '{print $2}'
}

function random-branch {
    echo $(random-word)-$(random-word)
}
```
