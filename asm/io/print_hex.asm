upper_print_hex16:
  pusha
  mov cx, 16
  
  .loop:
  push ax
  sub cx, 4
  sar ax, cl
  and ax, 0xf
  
  mov bx, ax
  mov al, [upperhexdigits+bx]
  
  pop ax  
  test bx, bx
  jz .loop

  add cx, 4
  test cx, cx
  jz .end


  .loop2:
  push ax
  sub cx, 4
  sar ax, cl
  and ax, 0xf
  
  mov bx, ax
  mov al, [upperhexdigits+bx]

  .print:
  mov ah, 0x0e
  int 0x10
  pop ax
  test cx,cx
  jnz .loop2
  .end:
  popa
  ret

upperhexdigits:
  db "0123456789ABCDEF"