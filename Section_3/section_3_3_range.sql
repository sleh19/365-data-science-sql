CREATE TABLE job_board (
  id SERIAL PRIMARY KEY,
  job TEXT,
  salary NUMERIC,
  salary_range numrange
);
/*
Key Differences

Feature	|| int4range	||numrange
Data Type ||	Integer (int4)	|| Numeric (numeric)
Precision	|| Whole numbers only	|| Decimal and fractional values allowed
Use Case	|| Discrete ranges	|| Continuous ranges
Storage Efficiency	|| More efficient for integer ranges	|| May use more storage due to precision

*/
INSERT INTO job_board (job, salary, salary_range)
VALUES
  ('Engineer I', 120000, NUMRANGE(95000, 130000)),
  ('Engineer II', 150000, NUMRANGE(135000, 170000)),
  ('Engineer III', 210000, NUMRANGE(185000, 250000));

SELECT * FROM job_board;
