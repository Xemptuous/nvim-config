( class_definition
    name: (identifier) @class_name
)
( class_definition
    superclasses: (argument_list
        (identifier) @class_child_ref
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
