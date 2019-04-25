int main() {
  int w1 = 3573751839; //  NOP
  __asm__ __volatile__ (
    "adr x0, b\n\t"
    "str w1, [x0]\n\t"
    "dc cvau, x0\n\t"
    "dsb sy\n\t"
    "ic ivau, x0\n\t"
    "dsb sy\n\t"
    "isb\n\t"
    "b: b fail_b\n\t"
    "mov x2, #2\n\t"
    "b end\n\t"
    "fail_b: mov x2, #1\n\t"
    "end: NOP\n"
  : : [w1] "r" (w1) : "memory", "x0", "x2");
  return 1;
}
