# 1 "sm.c"
# 1 "/auto/homes/bs630/workspace/rems/litmus-tests-armv8a-system/elf-tests/ifetch//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sm.c"
int main() {
  int w1 = 3573751839;
  __asm__ __volatile__ (
    "adr x0, b\n\t"
    "str w1, [x0]\n\t"
    "dc cvau, x0\n\t"
    "ic ivau, x0\n\t"
    "isb\n\t"
    "b: b fail_b\n\t"
    "mov x2, #2\n\t"
    "b end\n\t"
    "fail_b: mov x2, #1\n\t"
    "end: NOP\n"
  : : [w1] "r" (w1) : "memory", "x0", "x2");
  return 1;
}
