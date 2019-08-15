#!/bin/bash

pick1() { gshuf -n 1; }

adj=$(pick1 <<- EOF
admiring
adoring
agitated
amazing
angry
awesome
berserk
best
bubbly
big
boring
clever
cocky
cranky
desperate
determined
distracted
dreamy
drunk
ecstatic
elated
elegant
evil
fervent
focused
furious
gigantic
gloomy
goofy
grave
grumpy
happy
high
hopeful
hungry
insane
jolly
jovial
kickass
lonely
loving
mad
modest
naughty
nostalgic
pensive
prickly
reverent
romantic
sad
serene
sharp
sick
silly
sleepy
small
stoic
stupefied
suspicious
tender
thirsty
tiny
trusting
EOF
)

animal=$(pick1 <<- EOF
aardvark
albatross
alligator
alpaca
ant
anteater
antelope
ape
armadillo
donkey
baboon
badger
barracuda
bat
bear
beaver
bee
bird
bison
boar
buffalo
butterfly
camel
caribou
cassowary
cat
caterpillar
cow
chamois
cheetah
chicken
chimpanzee
chinchilla
chough
coati
cobra
cockroach
cod
cormorant
coyote
crab
crane
crocodile
crow
curlew
deer
dinosaur
dog
dolphin
donkey
dotterel
dove
dragonfly
duck
dugong
dunlin
eagle
echidna
eel
eland
elephant
elk
emu
falcon
ferret
finch
fish
flamingo
fly
fox
frog
gaur
gazelle
gerbil
panda
giraffe
gnat
gnu
goat
goldfinch
goosander
goose
gorilla
goshawk
grasshopper
grouse
guanaco
gull
hamster
hare
hawk
hedgehog
heron
herring
hippopotamus
hornet
horse
hummingbird
hyena
ibex
ibis
jackal
jaguar
jay
jellyfish
kangaroo
kinkajou
koala
kouprey
kudu
lapwing
lark
lemur
leopard
lion
llama
lobster
locust
loris
louse
lyrebird
magpie
mallard
mammoth
manatee
mandrill
mink
mole
mongoose
monkey
moose
mouse
mosquito
narwhal
newt
nightingale
octopus
okapi
opossum
ostrich
otter
owl
oyster
panther
parrot
panda
partridge
peafowl
pelican
penguin
pheasant
pig
pigeon
pony
porcupine
porpoise
quail
quelea
quetzal
rabbit
raccoon
ram
rat
raven
reindeer
rhinoceros
rook
salamander
salmon
sandpiper
sardine
seahorse
seal
shark
sheep
shrew
skunk
sloth
snail
snake
spider
squirrel
starling
swan
tapir
tarsier
termite
tiger
toad
turkey
turtle
wallaby
walrus
wasp
weasel
whale
wolf
wolverine
wombat
wren
yak
zebra
EOF
)

echo -n "${adj}-${animal}"
