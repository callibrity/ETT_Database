SELECT timezone('America/New_York','2019-12-31 00:00'::TIMESTAMPTZ);

CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

ALTER TABLE ett_employee_metrics ADD COLUMN updated_at TIMESTAMPTZ DEFAULT NOW();

CREATE TRIGGER set_timestamp
BEFORE UPDATE ON public.ett_employee_metrics
FOR EACH ROW
EXECUTE FUNCTION trigger_set_timestamp();
