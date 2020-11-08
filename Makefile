# Definitions

CXX=clang++
CXXFLAGS=-std=c++14 -Ofast -mpopcnt -fomit-frame-pointer -march=native -Wall -pedantic -Wextra -DNDEBUG -DUSE_SSE41 -msse4.1 -DUSE_SSSE3 -mssse3 -DUSE_SSE2 -msse2 -DUSE_SSE -msse
FILES=*.cpp
EXE=mayhem

# Targets

all:
	$(CXX) $(CXXFLAGS) $(FILES) -o $(EXE)

release: clean
	x86_64-w64-mingw32-g++ $(CXXFLAGS) -static -DWINDOWS $(FILES) -o mayhem-0.50-x86-windows-modern-64bit.exe
	$(CXX) $(CXXFLAGS) -static $(FILES) -o mayhem-0.50-x86-unix-modern-64bit

strip:
	strip ./$(EXE)

clean:
	rm -f $(EXE) $(EXE)-*

test: all
	cutechess-cli -variant fischerandom -engine cmd=./$(EXE) dir=. proto=uci -engine cmd=sapeli dir=. proto=uci -each tc=10 -rounds 100

xboard: all
	xboard -fUCI -fcp ./$(EXE)

.PHONY: all release strip clean test xboard
