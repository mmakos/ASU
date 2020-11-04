#Michał Makoś – projekt 1 z przedmiotu ASU
##Zadanie 13 – liczebniki
###Opis
Projekt zawiera skrypt w języku PERL służący do zamiany wszystkich liczb w zapisie arabskim w
pliku tekstowym na liczebniki w mianowniku w jednym z trzech języków: polskim, angielskim
lub niemieckim. Program zamienia liczby maksymalnie 4-cyfrowe, oddzielone spację,
przecinkiem lub kropką.<br>
Więc np. z tekstu wejściowego: *„Grześ kupił 140 kilo marchwii, 1305cukierków, 20.9 kwiatów
dla mamy, 0,987 buraków oraz 56890 lizaków.”*<br>
otrzymamy dla języka polskiego następujący tekst wyjściowy: *„Grześ kupił sto czterdzieści kilo
marchwii, 1305cukierków, dwadzieścia .dziewięć kwiatów dla mamy, zero,dziewięćset
osiemdziesiąt siedem buraków oraz 56890 lizaków.”*
###Jak używać
Program należy wywołać poleceniem:
* perl numbers.pl nazwaPlikuWejściowego [język<en|pl|de>]

Program zapisze plik wyjściowy pod nazwą pliku wejściowego z przedrostkiem oznaczającym
kod wybranego języka.<br>
Czyli np. gdy chcemy zamienić liczby z pliku liczby.txt na liczby w języku niemieckim, należy
program wywołać za pomocą polecenia:
* perl numbers.pl liczby.txt de

Plik wyjściowy będzie nosił nazwę de_liczby.txt.
