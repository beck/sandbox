# Sandbox

Sandbox for random stuff

Sefano can see this... right?!

## Faking a Definition list

### This is what I want

<dl>
  <dt><a href="http://en.wikipedia.org/wiki/Dinosaur">Dinosaur</a></dt>
  <dd>They first appeared during the Triassic period, 231.4 million years ago</dd>
  <dt><a href="http://en.wikipedia.org/wiki/Chair">Chair</a></dt>
  <dd>A chair is a piece of furniture with a raised surface used to sit on</dd>
</dl>

### But html in in md is gross and you have to make it all html, otherwise

<dl>
  <dt>[Dinosaur](http://en.wikipedia.org/wiki/Dinosaur)</dt>
  <dd>They first appeared during the Triassic period, 231.4 million years ago</dd>
  <dt>[Chair](http://en.wikipedia.org/wiki/Chair)</dt>
  <dd>A chair is a piece of furniture with a raised surface used to sit on</dd>
</dl>

### Faking with markdown

* _**[Trailing Whitespace][nope]**_   
  Trailing whitespace is annoying an a poor way to do newlines
* _**[No Whitespace][nope]**_
  I miss my newlines
* _**[Ending colon][nope]**_:
  No newlines :(

### Maybe just use headings

#### [Trailing Whitespace][nope]
Trailing whitespace is annoying an a poor way to do newlines

#### [No Whitespace][nope]
I miss my newlines

[nope]: #nope

## Translations

### make messages

`translations/make-messages.sh`

### view output

`LC_ALL=es php sandbox/helloworld.php`
