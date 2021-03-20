# Mayhem

Linux UCI Chess960 engine.
Written in C++17 language.
Licensed under the GPLv3.

Mayhem uses EvalFile ( NNUE ) and BookFile ( PolyGlot ) for maximum strength.
Works well w/o them of course.

Strength in Blitz: Classical mode ( ~2500 Elo ) and NNUE mode ( ~3000 Elo ).

Simple `make` should build a good binary.
If not then remove *nnue - flags* until it does.

Default settings are the best.
If needed increase Hash / MoveOverhead in longer games.

Credits: SF ( EvalFile + PolyGlot ) and Dr. Shawul ( NNUE lib ).

Happy hacking!
