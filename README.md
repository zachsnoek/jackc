# jackc

## Description
jackc is a compiler for the Jack programming language described in "The Elements of Computing Systems" by Nisan and Schocken. I wrote this as a final project in a programming languages course; since it was written rather quickly, it does not include any type checking or other error checking.

The compiler design is based off of the calc compiler from Kent D. Lee's "Programming Languages: An Active Learning Approach."

## Usage
```bash
$ ./jackc <file.jack>
$ ./jackc <directory of .jack files>
```

## Testing

### Compiler Tests
The tests provided in Nisan and Schocken chapter 11 reside in `tests`. The directory `tests/cmp` contain copies of each of the test directories, but have been compiled with the authors' compiler.

To compare the compiled VM code produced with my compiler with the authors' compiler's VM code, run the provided `jackt` script, and inspect the output and `tests.out` file. If all goes well, the outfile should show "SUCCESS" for all of the comparisons and the output should show that all of the tests passed.

#### Usage
```bash
$ ./jackt
```

### OS Tests
I have already compiled the directories in `os`; each OS class' Jack file found in these directories is my implementation. To test, load a class' test directory into the VMEmulator, load the test script found in the directory, and compare the given `.cmp` file and the `.out` file produced by the test.

## Notes
* I used a different implementation of the binary search algorithm for `Math.sqrt`. The implementation I used cannot handle large numbers, like one of the provided test cases.
* I had to modify to the book's test case for `String.jack` in its `Main.jack` file to reinitialize `i` after its first call to `String.setInt` (`os/StringTest/Main.jack` line 33). This is because my algorithm for `String.setInt` relies on `String.appendChar`.
* I used the wasteful memory algorithm given in figure 12.6a to implement `Memory.jack`, but did try to (maybe successfully) implement `FreeList`; see my implementation in `os/FreeList`.