# Week 3 homework
## Students
1. Lê Duy Anh - 22127012
2. Huỳnh Cao Tuấn Kiệt - 22127219
3. Lý Đình Minh Mẫn - 22127255
4. Võ Nguyễn Phương Quỳnh - 22127360
## Source code
[Google Drive](https://drive.google.com/drive/u/1/folders/1zUfQ6ZWV9YHO6IBz8d2t8i1BCLlS4Tj3)

---
# Exercise 1

Requirement: input two integers a, b. Determine wether a > b, a < b or a = b

## Main idea

Pseudo code:

```
a, b <- input from keyboard
if a > b:
    print "a > b"
else if a < b:
    print "a < b"
else:
    print "a = b"
```

## Testing and screenshots

![Alt text](image.png)
![Alt text](image-1.png)
![Alt text](image-2.png)

---
# Exercise 2

Requirement: input a character and check whether it is uppercase or lowercase.

## Main idea

Pseudo code:

```
1. Read a character from the user
2. If the character's ASCII code is less than 65 (less than 'A'):
    -> Output "Invalid character" to the console and go to step 8
3. Else if the character's ASCII code is greater than 90 ('Z'):
    -> Go to step 5
4. Output "Result: uppercase" to the console and go to step 8
5. If the character's ASCII code is less than 97 ('a'):
    -> Output "Invalid character" to the console and go to step 8
6. Else if character's ASCII code is greater than 122 ('z'):
    -> Output "Invalid character" to the console and go to step 8
7. Output "Result: lowercase" to the console and go to step 8
8. Exit the program
```

## Testing and screenshots

![Alt text](screenshot-lowercase.png)
![Alt text](screenshot-uppercase.png)

---
# Exercise 3

Requirement: input an array and output it

## Main idea

Pseudo code of the LOOP:

```
initialize i = 0, array_ptr = first address of the array
Loop:
+ Display message

+ Do our task (input, store the value in the address, load the value, output the value, ...)

Increment 'i' by 1
Move 'array_ptr' to the next address of the array

If 'i' is equal to 'n', end the loop
Otherwise, jump to Loop
```

## Testing and screenshots

![Alt text](ex_3_screenshot.png)

---
# Exercise 4

Requirement: input a string and print the length of it, using an assembly program

## Main idea

Pseudo code:

```
str <- "", length <- 0
let user input str

ptr <- address of first element of str
while value at ptr not \0 or \n:
    length <- length + 1
    ptr <- ptr + 1

print length
```

## Testing and screenshots

![Alt text](image.png)
![Alt text](image-1.png)
