#include <ruby.h>
#include <stdio.h>

VALUE defacto_class(VALUE self) {
  return CLASS_OF(self);
}

VALUE defacto_super(VALUE self) {
  return RCLASS(self)->super;
}

VALUE defacto_Module;
void Init_defacto() {
  defacto_Module = rb_define_module("DeFacto");
  rb_define_method(defacto_Module, "defacto_class", defacto_class, 0);
  rb_define_method(defacto_Module, "defacto_super", defacto_super, 0);
  rb_include_module(rb_cObject, defacto_Module);
}