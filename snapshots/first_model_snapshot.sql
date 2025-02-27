{% snapshot first_model_snapshot %}
    {{
        config(
            target_database = 'woven-surface-450008-a3',
            target_schema = 'snapshots',
            unique_key = 'id',

            strategy = 'timestamp',
            updated_at = 'updated_at'
        )
    }}

    select * from {{ref('snapshot_file')}}

{% endsnapshot%}