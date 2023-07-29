; usa print_string.asm

diskload:
  push dx
  mov ah, 0x02
  mov al, dh
  xor cx, cx     ; Limpando o registro CX (CH + CL) para evitar problemas de leitura incorreta
  mov ch, 0x00
  mov dh, 0x00
  mov cl, 0x02

  int 0x13

  jc diskerror   ; Verificar o bit de carry para detectar erros no carregamento
  pop dx
  cmp dh, al     ; Comparar o número de setores lidos (DH) com o número solicitado (AL)
  jne diskerror  ; Se não for igual, ocorreu um erro
  ret

diskerror:
  mov si, diskerrormsg
  call print_string
  jmp $          ; Loop infinito, aguardando até que o computador seja reiniciado

diskerrormsg: db "disk read error!!!", 0
