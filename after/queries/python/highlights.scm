( class_definition
    name: (identifier) @class_name
)
( class_definition
    superclasses: (argument_list
        (identifier) @class_child_ref
    )
)

( class_definition
    name: (identifier)
    body: (block
        (function_definition
            name: (identifier) @magic_method
            (#lua-match? @magic_method "(__)")
        )
    )
)

( typed_parameter
    type: (type
        (identifier) @type_hinting
    )
)
( expression_statement 
  ( assignment
    type: (type
        (identifier) @type_hinting
        )
    )
)
( expression_statement 
  (assignment
    left: (attribute
      object: (identifier) @self_attribute
    )
  )
)

( decorated_definition
    (decorator) @decorator
  )
