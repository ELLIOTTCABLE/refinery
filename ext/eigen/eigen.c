#include <ruby.h>
#include <stdio.h>

VALUE jm_Module;
VALUE eigen_predicate(VALUE self) {
  if(FL_TEST(self, FL_SINGLETON)) return Qtrue;
  else return Qfalse;
}

void Init_eigen() {
  jm_Module = rb_define_module("Eigen");
  rb_define_method(jm_Module,"eigen?",eigen_predicate,0);
}
