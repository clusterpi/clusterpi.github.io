---
title: "Fortran"
linkTitle: "Fortran"
description: >
  Easy instalation and usage instructions for FORTRAN
categories:
- Programming
tags:
- FORTRAN
---


Although this section is not about parallel programming, you may find
still that many scientific programs are written in fortran. For some
smaller fortran programs it is even possible to run them on a
Raspberry pi. Naturally you will need to install a FORTRAN compiler,
which you can do with

```bash
pi$ sudo apt-get install gfortran
```

To test it out store the following program into `hello.f90`

```fortran
program hello
    print *, "Hello World!"
end program hello
```

Now you can compile it with

```bash
pi$ gfortran -o hello hello.f90
```

Execute it with

```
pi$ hello
```
