INSERT INTO public.employees
("name", "role", office, email, skills, interests, bio, photo, callibrity_email)
VALUES('TestName', 'Testing','Cincinnati','test@test.com', 'Programming, Testing', 'Test Stuff', 'Grew up testing', '', 'test@callibrity.com');

INSERT INTO public.ett_employee
(first_name, last_name, employee_number, employee_email)
VALUES('TestName', 'TestLastName', '0123', 'test@callibrity.com');

INSERT INTO public.ett_employee_metrics
(employee_number_fk, yearly_billable_target_hours, current_billable_hours, target_training_hours, current_training_hours, total_yearly_pto, overflow_pto, used_pto, the_year, billable_target_to_date)
VALUES('0123', 1000, 500, 80, 20, 100, 50, 200, 2020, 100);

INSERT INTO public.ett_hours_source
(employee_number_fk, hours, code, the_date)
VALUES('0123', 0, 'WORK', '2020-12-31');
