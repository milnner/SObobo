; usa o endereço da string carregado em si

print_string:
  pusha
  mov ah, 0x0e  
  .loop:
  lodsb
  test al,al
  jz .end,
  int 0x10
  jmp .loop
  .end:
  popa
  ret