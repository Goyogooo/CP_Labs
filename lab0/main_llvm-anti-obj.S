
main_llvm.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 10          	sub    $0x10,%rsp
   8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
   f:	48 bf 00 00 00 00 00 	movabs $0x0,%rdi
  16:	00 00 00 
  19:	48 8d 75 f4          	lea    -0xc(%rbp),%rsi
  1d:	b0 00                	mov    $0x0,%al
  1f:	e8 00 00 00 00       	call   24 <main+0x24>
  24:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%rbp)
  2b:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%rbp)
  32:	8b 45 fc             	mov    -0x4(%rbp),%eax
  35:	3b 45 f4             	cmp    -0xc(%rbp),%eax
  38:	7f 15                	jg     4f <main+0x4f>
  3a:	8b 45 f8             	mov    -0x8(%rbp),%eax
  3d:	0f af 45 fc          	imul   -0x4(%rbp),%eax
  41:	89 45 f8             	mov    %eax,-0x8(%rbp)
  44:	8b 45 fc             	mov    -0x4(%rbp),%eax
  47:	83 c0 01             	add    $0x1,%eax
  4a:	89 45 fc             	mov    %eax,-0x4(%rbp)
  4d:	eb e3                	jmp    32 <main+0x32>
  4f:	8b 75 f8             	mov    -0x8(%rbp),%esi
  52:	48 bf 00 00 00 00 00 	movabs $0x0,%rdi
  59:	00 00 00 
  5c:	b0 00                	mov    $0x0,%al
  5e:	e8 00 00 00 00       	call   63 <main+0x63>
  63:	31 c0                	xor    %eax,%eax
  65:	48 83 c4 10          	add    $0x10,%rsp
  69:	5d                   	pop    %rbp
  6a:	c3                   	ret    
