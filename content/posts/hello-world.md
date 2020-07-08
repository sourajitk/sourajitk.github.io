---
title: "Hello World!"
date: 2020-06-19T10:24:00-05:00
---

### What is Hello World?
Hello World is usually the first line of source code most programmers start with. Hello World in most languages usually consists of a couple of lines of very basic code illustrating how it works. However, another important function that it serves is to check if the program execution environment is setup properly.

Here, I'm going to show you how the code for `"Hello World"` differs between various different langauges.

### 1. Python
Python is an interpreted, high-level, general-purpose programming language created by Guido van Rossum. It's very simple and easy to learn. It's one of the most popular language amongst programmers.

```bash
print("Hello World! I am Sourajit.")           # Using the print function.
```

### 2. Java
Java is a general-purpose programming language that is class-based, object-oriented, and designed to have as few implementation dependencies as possible. Java was originally developed by Sun Microsystems, however, all Java related assests included the logo and name are under Oracle's possession. Java is also a very popular language due to it's compatibility and ability to run a wide variety of platforms.

```bash
public class Main {                                         // The main class. 
    public static void main(String[] args) {
        System.out.println("Hello World! I am Sourajit.");  // The usage of println.
    }
}
```
### 3. C++
C++ is one of the more older programming languages in the Programming World. It's an extension of the C programming language. It was created by Bjarne Stroustrup. It's also known as "C with Classes"

```bash
#include <iostream.h>

int main() {                        // Executing the main() function.
    std::cout << "Hello World! I am Sourajit.";
    return 0;
}
```
### 4. Rust
Rust is a multi-paradigm programming language focused on performance and safety, especially safe concurrency. Developed by Mozilla, Rust is syntactically similar to C++, but provides memory safety without using garbage collection. 

Interesting fact: A person who codes in Rust is called a Rustacean.

```bash
fn main() {             // The main() function.
    println!("Hello World! I am Sourajit!"); // Using the println function 
}
```

### 5. Bash
GNU Bash or simply Bash is a Unix shell and command language written by Brian Fox for the GNU Project as a free software replacement for the Bourne shell. Bash is an "sh-compatible command language" first released in 1989. It has been used widely as the default login shell for most Linux distributions and Apple's macOS Mojave and earlier versions.

```bash
#!/bin/bash
echo "Hello World! I am Sourajit!"
```
To run files coded in bash, you would need the `#!/bin/bash` at `line 0` (this special line is called the`she-bang` line) and the files need to saved with a `.sh` extension. To make the file executable, you need to `chmod +x <file name>` and then run it by typing `./<path to the file>`.
