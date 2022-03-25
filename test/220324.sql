SELECT table_name
        , constraint_name
        , constraint_type
        , status
FROM user_constraints
WHERE table_name IN ('STUDENT', 'PROFESSOR', 'DEPARTMENT');

SELECT table_name
        , column_name
        , constraint_name
FROM user_cons_columns
WHERE table_name IN ('STUDENT', 'PROFESSOR', 'DEPARTMENT');