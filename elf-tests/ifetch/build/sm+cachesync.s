	.arch armv8-a
	.file	"sm+cachesync.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.file 1 "sm+cachesync.c"
	.loc 1 1 0
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	.loc 1 2 0
	mov	w0, 8223
	movk	w0, 0xd503, lsl 16
	str	w0, [sp, 12]
	.loc 1 3 0
	ldr	w1, [sp, 12]
#APP
// 3 "sm+cachesync.c" 1
	adr x0, b
	str w1, [x0]
	dc cvau, x0
	dsb sy
	ic ivau, x0
	dsb sy
	b: b fail_b
	mov x2, #2
	b end
	fail_b: mov x2, #1
	end: NOP

// 0 "" 2
	.loc 1 16 0
#NO_APP
	mov	w0, 1
	.loc 1 17 0
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x60
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF0
	.byte	0xc
	.4byte	.LASF1
	.4byte	.LASF2
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x1
	.4byte	0x5c
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5c
	.uleb128 0x3
	.string	"w1"
	.byte	0x1
	.byte	0x2
	.4byte	0x5c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF1:
	.string	"sm+cachesync.c"
.LASF0:
	.string	"GNU C11 7.3.0 -mlittle-endian -mabi=lp64 -g -O0 -std=c11 -ffreestanding"
.LASF2:
	.string	"/auto/homes/bs630/workspace/rems/litmus-tests-armv8a-system/elf-tests/ifetch"
.LASF3:
	.string	"main"
	.ident	"GCC: (Ubuntu/Linaro 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
