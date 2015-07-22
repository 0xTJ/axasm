	ORG 0
top:
	LDIQ starter
	MOV FIMMV,F(FPC,FPC_WRET)
	LDIQ 0x00C00207
	MOV FIMMV,F(FPC,FPC_WDATA)
	LDIQ writetag
	MOV FIMMV,F(FPC,FPC_WADD)
	MOV F(FPC,FPC_WRITE),F(FPC,FPC_VALUE)
starter:		
	ZERO I
writetag:		
	MOV F(FCON,FCON_80),F(FLOOP,FLOOP_IEND)
	LDIQ tloop
	MOV FIMMV,F(FLOOP,FLOOP_IADD)
tloop:	
	MOV I,F(FIO,FIO_DISP)
	MOV F(FIO,FIO_SW),FACC
	LDIQ 0x14
	MOV FIMMV,F(FACC,FACC_SHL)
	MOV FACC,F(FIO,FIO_DELAY)
	MOV F(FIO,FIO_DELAY),FZERO
	MOV F(FLOOP,FLOOP_IADD),FPC
	MOV FZERO,FPC   	;  goto 0 (restart)
	END