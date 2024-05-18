// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(START)
@KBD		//Receive the input from the keyboard
D=M
@WHITE
D;JEQ		//If the input from the keyboard is 0,no key is pressed
D=-1		//If the program didn't jump, then a key was pressed and the screen needs to be painted black

(WHITE)
@R1
M=D			//R1 contains the "color" that the screen needs to be painted
@SCREEN
D=A
@R2
M=D			//R2 contains the address of the first pixel in the screen.

(FILL)
@R1			
D=M			//R1 contains the address of the pixel that needs to painted
@R2
A=M			//A <- the first pixel in the screen
M=D			//D <- the address of the pixel that needs to painted
@R2
M=M+1		//setting the address of the next pixel that will be painted.
D=M	
@KBD
D=A-D		//D = the keyboard input - the address of the pixel that will be painted

@FILL		
D;JNE		//If D is not 0, there are more pixels to paint, the program will paint the next pixel.
@START
0;JMP		//The progtam runs in a loop