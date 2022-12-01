CREATE TABLE education.Student(
                                  student_id serial not null primary key,
                                  last_name varchar(20) not null,
                                  first_name varchar(20) not null,
                                  patronimic varchar(20),
                                  passport_series char(4) not null,
                                  passport_number char(6) not null,
                                  CONSTRAINT series_constr CHECK(passport_series ~ '^\d{4}$'),
                                  CONSTRAINT number_constr CHECK(passport_number ~ '^\d{6}$'),
                                  CONSTRAINT passport_constr UNIQUE(passport_series, passport_number)
);
CREATE TABLE education.Subject(
                                  subject_id serial not null primary key,
                                  name text not null
);
CREATE TABLE education.Performance(
                                      student_id int not null,
                                      subject_id int not null,
                                      mark smallint not null,
                                      CONSTRAINT performance_pk PRIMARY KEY (student_id, subject_id),
                                      CONSTRAINT student_fk FOREIGN KEY (student_id)
                                          REFERENCES education.Student(student_id) ON DELETE CASCADE ON UPDATE CASCADE,
                                      CONSTRAINT subject_fk FOREIGN KEY (subject_id)
                                          REFERENCES education.Subject(subject_id) ON DELETE CASCADE ON UPDATE CASCADE,
                                      CONSTRAINT mark_constr CHECK (mark >= 2 and mark <= 5)
);
INSERT INTO education.Student VALUES
                                  (default, 'Иванов', 'Сергей', 'Миронович', '3320', '447721'),
                                  (default, 'Ковязина', 'Зинаида', 'Иванова', '3318', '638782'),
                                  (default, 'Дербеняев', 'Денис', 'Давидович', '3320', '306260'),
                                  (default, 'Каратаева', 'Ева', 'Адамовна', '3317', '694201'),
                                  (default, 'Гребенько', 'Искандер', 'Богданович', '3315', '868389'),
                                  (default, 'Хамелеонов', 'Георгий', 'Владимирович', '3315', '565058'),
                                  (default, 'Бирюков', 'Сергей', 'Павлович', '3320', '922614'),
                                  (default, 'Пешеходная', 'Алла', 'Борисовна', '3321', '855744'),
                                  (default, 'Барсов', 'Марк', 'Яковлевич', '3319', '838991'),
                                  (default, 'Исаков', 'Денис', 'Миронович', '3316', '578530')
;
INSERT INTO education.Subject VALUES
                                  (default, 'Математика'),
                                  (default, 'Физика'),
                                  (default, 'Английский язык'),
                                  (default, 'История'),
                                  (default, 'Информатика')
;
INSERT INTO education.Performance VALUES
                                      (1,1,3),
                                      (2,1,3),
                                      (3,1,3),
                                      (4,1,5),
                                      (5,1,2),
                                      (6,1,5),
                                      (7,1,4),
                                      (8,1,5),
                                      (9,1,4),
                                      (10,1,3),
                                      (1,2,5),
                                      (2,2,4),
                                      (3,2,5),
                                      (4,2,2),
                                      (5,2,5),
                                      (6,2,4),
                                      (7,2,2),
                                      (8,2,3),
                                      (9,2,2),
                                      (10,2,4),
                                      (1,3,3),
                                      (2,3,3),
                                      (3,3,4),
                                      (4,3,5),
                                      (5,3,5),
                                      (6,3,2),
                                      (7,3,4),
                                      (8,3,3),
                                      (9,3,2),
                                      (10,3,3),
                                      (1,4,5),
                                      (2,4,2),
                                      (3,4,2),
                                      (4,4,3),
                                      (5,4,2),
                                      (6,4,3),
                                      (7,4,4),
                                      (8,4,5),
                                      (9,4,3),
                                      (10,4,5),
                                      (1,5,3),
                                      (2,5,4),
                                      (3,5,3),
                                      (4,5,2),
                                      (5,5,3),
                                      (6,5,4),
                                      (7,5,3),
                                      (8,5,4),
                                      (9,5,2),
                                      (10,5,3)
;