create keyspace if not exists foodie WITH replication = {'class': 'SimpleStrategy', 'replication_factor' : 1};

use foodie;

CREATE TABLE if not exists weight_readings (
		sensor_id uuid,
		weight double,
		reading_time timestamp,
		barcode text,
		PRIMARY KEY (sensor_id, reading_time)
) WITH compaction = {'class': 'DateTieredCompactionStrategy', 'base_time_seconds':'3600', 'max_sstable_age_days':'365'};

CREATE TABLE if not exists sensors (
		sensor_id uuid,
		sensor_name text,
		barcode text,
		product_name text,
		PRIMARY KEY (sensor_id)
);
