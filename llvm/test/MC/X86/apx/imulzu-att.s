# RUN: llvm-mc -triple x86_64 -show-encoding %s | FileCheck %s
# RUN: not llvm-mc -triple i386 -show-encoding %s 2>&1 | FileCheck %s --check-prefix=ERROR

# ERROR-COUNT-12: error:
# ERROR-NOT: error:
# CHECK: imulzuw	$123, %dx, %dx
# CHECK: encoding: [0x62,0xf4,0x7d,0x18,0x6b,0xd2,0x7b]
         imulzuw	$123, %dx, %dx
# CHECK: imulzul	$123, %ecx, %ecx
# CHECK: encoding: [0x62,0xf4,0x7c,0x18,0x6b,0xc9,0x7b]
         imulzul	$123, %ecx, %ecx
# CHECK: imulzuq	$123, %r9, %r9
# CHECK: encoding: [0x62,0x54,0xfc,0x18,0x6b,0xc9,0x7b]
         imulzuq	$123, %r9, %r9
# CHECK: imulzuw	$123, 291(%r8,%rax,4), %dx
# CHECK: encoding: [0x62,0xd4,0x7d,0x18,0x6b,0x94,0x80,0x23,0x01,0x00,0x00,0x7b]
         imulzuw	$123, 291(%r8,%rax,4), %dx
# CHECK: imulzul	$123, 291(%r8,%rax,4), %ecx
# CHECK: encoding: [0x62,0xd4,0x7c,0x18,0x6b,0x8c,0x80,0x23,0x01,0x00,0x00,0x7b]
         imulzul	$123, 291(%r8,%rax,4), %ecx
# CHECK: imulzuq	$123, 291(%r8,%rax,4), %r9
# CHECK: encoding: [0x62,0x54,0xfc,0x18,0x6b,0x8c,0x80,0x23,0x01,0x00,0x00,0x7b]
         imulzuq	$123, 291(%r8,%rax,4), %r9
# CHECK: imulzuw	$1234, %dx, %dx
# CHECK: encoding: [0x62,0xf4,0x7d,0x18,0x69,0xd2,0xd2,0x04]
         imulzuw	$1234, %dx, %dx
# CHECK: imulzuw	$1234, 291(%r8,%rax,4), %dx
# CHECK: encoding: [0x62,0xd4,0x7d,0x18,0x69,0x94,0x80,0x23,0x01,0x00,0x00,0xd2,0x04]
         imulzuw	$1234, 291(%r8,%rax,4), %dx
# CHECK: imulzul	$123456, %ecx, %ecx
# CHECK: encoding: [0x62,0xf4,0x7c,0x18,0x69,0xc9,0x40,0xe2,0x01,0x00]
         imulzul	$123456, %ecx, %ecx
# CHECK: imulzuq	$123456, %r9, %r9
# CHECK: encoding: [0x62,0x54,0xfc,0x18,0x69,0xc9,0x40,0xe2,0x01,0x00]
         imulzuq	$123456, %r9, %r9
# CHECK: imulzul	$123456, 291(%r8,%rax,4), %ecx
# CHECK: encoding: [0x62,0xd4,0x7c,0x18,0x69,0x8c,0x80,0x23,0x01,0x00,0x00,0x40,0xe2,0x01,0x00]
         imulzul	$123456, 291(%r8,%rax,4), %ecx
# CHECK: imulzuq	$123456, 291(%r8,%rax,4), %r9
# CHECK: encoding: [0x62,0x54,0xfc,0x18,0x69,0x8c,0x80,0x23,0x01,0x00,0x00,0x40,0xe2,0x01,0x00]
         imulzuq	$123456, 291(%r8,%rax,4), %r9
