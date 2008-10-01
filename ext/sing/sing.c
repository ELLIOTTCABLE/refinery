#include <ruby.h>
#include <stdio.h>

VALUE jm_Module;
VALUE singleton(VALUE self) {
  if(FL_TEST(self, FL_SINGLETON)) return Qtrue;
  else return Qfalse;
}

void Init_sing() {
  jm_Module = rb_define_module("Sing");
  rb_define_method(jm_Module,"singleton?",singleton,0);
}