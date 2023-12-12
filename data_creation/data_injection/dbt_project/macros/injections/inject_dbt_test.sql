{% macro inject_dbt_test(test_id, test_name, test_column_name, test_params, description) %}
    {% set relation = elementary.get_elementary_relation('dbt_tests') %}
    {% set test_data = {
        'unique_id': test_id,
        'database_name': target.database,
        'schema_name': target.schema.replace("_elementary", ""),
        'name': test_name,
        'short_name': test_name,
        'alias': test_name,
        'test_column_name': test_column_name,
        'severity': 'warn',
        'warn_if': '',
        'error_if': '',
        'test_params': test_params | tojson,
        'test_namespace': 'elementary',
        'tags': '[]',
        'model_tags': '[]',
        'model_owners': '[]',
        'meta': tojson({"description": description, "generated_result": true}),
        'depends_on_macros': '[]',
        'depends_on_nodes': '[]'
    } %}
    {% do elementary.insert_rows(relation, [test_data], true) %}
{% endmacro %}
