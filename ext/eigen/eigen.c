#include <ruby.h>
#include <stdio.h>

VALUE eigen_Module;
VALUE primary_ancestor_Module;
VALUE eigen_predicate(VALUE self) {
  if(FL_TEST(self, FL_SINGLETON)) return Qtrue;
  else return Qfalse;
}

VALUE primary_ancestor(VALUE self) {
  return CLASS_OF(self);
}

void Init_eigen() {
  eigen_Module = rb_define_module("Eigen");
  rb_define_method(eigen_Module, "eigen?", eigen_predicate, 0);
  rb_include_module(rb_cClass, eigen_Module);
  
  primary_ancestor_Module = rb_define_module("PrimaryAncestor");
  rb_define_method(primary_ancestor_Module, "primary_ancestor", primary_ancestor, 0);
  rb_include_module(rb_cObject, primary_ancestor_Module);
}