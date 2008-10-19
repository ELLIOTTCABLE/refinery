#include <ruby.h>
#include <st.h>
#include <stdio.h>

VALUE eigen_predicate(VALUE self) {
  if(FL_TEST(self, FL_SINGLETON)) return Qtrue;
  else return Qfalse;
}

VALUE instance(VALUE self) {
  st_data_t value;
  if(FL_TEST(self, FL_SINGLETON)) value = rb_iv_get(self, "__attached__");
  else rb_raise(rb_eRuntimeError, "this is not a singleton, call #instances instead");
  return value;
}

VALUE eigen_Module;
VALUE singleton_instance_Module;
void Init_eigen() {
  eigen_Module = rb_define_module("Eigen");
  rb_define_method(eigen_Module, "eigen?", eigen_predicate, 0);
  rb_include_module(rb_cClass, eigen_Module);
  
  singleton_instance_Module = rb_define_module("SingletonInstance");
  rb_define_method(singleton_instance_Module, "instance", instance, 0);
  rb_include_module(rb_cClass, singleton_instance_Module);
}