SELECT timezone('America/New_York','2019-12-31 00:00'::TIMESTAMPTZ);

CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- public.employees definition

-- Drop table

-- DROP TABLE public.employees;

CREATE TABLE public.employees (
	name varchar NULL,
	"role" varchar NULL,
	office varchar NULL,
	email varchar NULL,
	skills varchar NULL,
	interests varchar NULL,
	bio varchar NULL,
	photo varchar NULL,
	callibrity_email varchar NOT NULL,
	CONSTRAINT employees_pk PRIMARY KEY (callibrity_email)
);


-- public.ett_employee definition

-- Drop table

-- DROP TABLE public.ett_employee;

CREATE TABLE public.ett_employee (
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	employee_number varchar NOT NULL,
	employee_email varchar NOT NULL,
	CONSTRAINT ett_employee_pk PRIMARY KEY (employee_number)
);


-- public.ett_employee_metrics definition

-- public.ett_employee_metrics definition

-- Drop table

-- DROP TABLE public.ett_employee_metrics;

CREATE TABLE public.ett_employee_metrics (
	employee_number_fk varchar NOT NULL,
	yearly_billable_target_hours float8 NULL,
	current_billable_hours float8 NULL,
	target_training_hours float8 NULL,
	current_training_hours float8 NULL,
	total_yearly_pto float8 NULL,
	overflow_pto float8 NULL,
	used_pto float8 NULL,
	the_year int4 NOT NULL,
	billable_target_to_date float8 NULL,
	updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
	CONSTRAINT ett_employee_metrics_pk PRIMARY KEY (employee_number_fk, the_year)
);

CREATE TRIGGER set_timestamp
BEFORE UPDATE ON public.ett_employee_metrics
FOR EACH ROW
EXECUTE FUNCTION trigger_set_timestamp();


-- public.ett_hours_source definition

-- Drop table

-- DROP TABLE public.ett_hours_source;

CREATE TABLE public.ett_hours_source (
	employee_number_fk varchar NOT NULL,
	hours float8 NOT NULL,
	code varchar NOT NULL,
	the_date date NOT NULL,
	CONSTRAINT ett_hours_source_fk FOREIGN KEY (employee_number_fk) REFERENCES ett_employee(employee_number)
);
