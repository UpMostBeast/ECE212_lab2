/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab2.s *********************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/

/*Write your program here******************************************/


clr.l %d3
move.l 0x2300000, %d4
sub.l #1, %d4
move.l 0x2300004, %a2
move.l 0x2300008, %a3
move.l 0x230000C, %a4
clr.l (%a4)

loop: move.l (%a3)+, %d3
add.l (%a3), %d3
move.l 4(%a2),%d5
sub.l (%a2)+, %d5
cmpi.l #2, %d5
blt next1
asl.l #1, %d3
next1: add.l %d3, (%a4)
sub.l #1, %d4
bne loop

move.l (%a4), %d3
asr.l #1, %d3
bcc next2
add.l #1, %d3
next2:
move.l 0x2300010, %a2
move.l %d3, (%a2)











/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/
