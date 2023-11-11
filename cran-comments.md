## Test environments
* local macOS install, R 4.3.1
* win-builder (devel)

## R CMD check results
There were no ERRORs or WARNINGs. 

There was 1 NOTE (only on macOS):

* checking HTML version of manual ... NOTE
Found the following HTML validation problems:
PGDnpmr.html:4:1 (PGDnpmr.Rd:4): Warning: <link> inserting "type" attribute
PGDnpmr.html:12:1 (PGDnpmr.Rd:4): Warning: <script> proprietary attribute "onload"
PGDnpmr.html:12:1 (PGDnpmr.Rd:4): Warning: <script> inserting "type" attribute
...
prox.html:38:1 (prox.Rd:16): Warning: <table> lacks "summary" attribute

(with many more that I've not included)

I'm confused about why I'm seeing this note and how I could fix it. I found this email thread from May of last year: https://stat.ethz.ch/pipermail/r-sig-mac/2022-May/014443.html which makes me think it may not be my fault.