#include <ruby.h>
#include <stdio.h>

VALUE defacto_class(VALUE self) {
  return CLASS_OF(self);
}

VALUE defacto_super(VALUE self) {
  return RCLASS(self)->super;
}

// TODO: Split this into Object::DeFacto and Class::DeFacto, somehow.
VALUE object_defacto_Module;
VALUE class_defacto_Module;
void Init_defacto() {
  object_defacto_Module = rb_define_module("ObjectDeFacto");
  rb_define_method(object_defacto_Module, "defacto_class", defacto_class, 0);
  rb_include_module(rb_cObject, object_defacto_Module);
  
  class_defacto_Module = rb_define_module("ClassDeFacto");
  rb_define_method(class_defacto_Module, "defacto_super", defacto_super, 0);
  rb_include_module(rb_cClass, class_defacto_Module);
}