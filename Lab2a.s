/* DO NOT MODIFY THIS --------------------------------------------*/
.text

.global AssemblyProgram

AssemblyProgram:
lea      -40(%a7),%a7 /*Backing up data and address registers */
movem.l %d2-%d7/%a2-%a5,(%a7)
/*----------------------------------------------------------------*/

/******************************************************************/
/* General Information ********************************************/
/* File Name: Lab2a.s *********************************************/
/* Names of Students: _________________ and ____________________ **/
/* Date: _________________                                       **/
/* General Description:                                          **/
/*                                                               **/
/******************************************************************/

/*Write your program here******************************************/

/*Part A **********************************************************/
move.l 0x2300004, %a2
move.l 0x2300008, %a3
move.l 0x230000C, %a4
move.l (%a2), %d3
add.l (%a3), %d3
move.l %d3, (%a4)
move.l 4(%a2), %d3
add.l 4(%a3), %d3
move.l %d3, 4(%a4)
move.l 8(%a2), %d3
add.l 8(%a3), %d3
move.l %d3, 8(%a4)
/*Part B **********************************************************/
clr.l %d2
move.l 0x2300004, %a2
move.l 0x2300008, %a3
move.l 0x2300010, %a4
loopB:move.l (%a2,%d2*4), %d3
add.l (%a3,%d2*4), %d3
move.l %d3, (%a4, %d2*4)
add.l #1, %d2
cmp.l 0x2300000, %d2
blt loopB
/*Part C **********************************************************/
clr.l %d2
move.l 0x2300004, %a2
move.l 0x2300008, %a3
move.l 0x2300014, %a4
loopC:move.l (%a2)+, %d3
add.l (%a3)+, %d3
move.l %d3, (%a4)+
add.l #1, %d2
cmp.l 0x2300000, %d2
blt loopC

/*End of program **************************************************/

/* DO NOT MODIFY THIS --------------------------------------------*/
movem.l (%a7),%d2-%d7/%a2-%a5 /*Restore data and address registers */
lea      40(%a7),%a7 
rts
/*----------------------------------------------------------------*/
