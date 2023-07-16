INSERT INTO channels (name) VALUES
('Channel 1'),
('Channel 2'),
('Channel 3'),
('Channel 4'),
('Channel 5'),
('Channel 6'),
('Channel 7'),
('Channel 8'),
('Channel 9'),
('Channel 10');

INSERT INTO programs (title, description) VALUES
('Program 1', 'Description for Program 1'),
('Program 2', 'Description for Program 2'),
('Program 3', 'Description for Program 3'),
('Program 4', 'Description for Program 4'),
('Program 5', 'Description for Program 5'),
('Program 6', 'Description for Program 6'),
('Program 7', 'Description for Program 7'),
('Program 8', 'Description for Program 8'),
('Program 9', 'Description for Program 9'),
('Program 10', 'Description for Program 10');

INSERT INTO genres (name) VALUES
('Genre 1'),
('Genre 2'),
('Genre 3'),
('Genre 4'),
('Genre 5'),
('Genre 6'),
('Genre 7');

INSERT INTO program_genres (program_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 1),
(9, 2),
(10, 3);

INSERT INTO seasons (season_number, program_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO episodes (episode_number, title, description, view_count, season_id) VALUES
(1, 'Episode 1', 'Description for Episode 1', 10, 1),
(2, 'Episode 2', 'Description for Episode 2', 21, 2),
(3, 'Episode 3', 'Description for Episode 3', 6, 3),
(4, 'Episode 4', 'Description for Episode 4', 43, 4),
(5, 'Episode 5', 'Description for Episode 5', 2, 5),
(6, 'Episode 6', 'Description for Episode 6', 3, 6),
(7, 'Episode 7', 'Description for Episode 7', 25, 7),
(8, 'Episode 8', 'Description for Episode 8', 32, 8),
(9, 'Episode 9', 'Description for Episode 9', 11, 9),
(10, 'Episode 10', 'Description for Episode 10', 18, 10);

INSERT INTO schedules (start_time, end_time, channel_id, program_id, episode_id) VALUES
('2023-05-25 08:00:00', '2023-01-01 09:00:00', 1, 1, 1),
('2023-05-26 10:00:00', '2023-01-02 11:00:00', 2, 2, 2),
('2023-05-27 12:00:00', '2023-01-03 13:00:00', 3, 3, 3),
('2023-05-25 14:00:00', '2023-01-04 15:00:00', 4, 4, 4),
('2023-05-29 16:00:00', '2023-01-05 17:00:00', 5, 5, 5),
('2023-05-30 18:00:00', '2023-01-06 19:00:00', 6, 6, 6),
('2023-05-29 20:00:00', '2023-01-07 21:00:00', 7, 7, 7),
('2023-05-28 22:00:00', '2023-01-08 23:00:00', 8, 8, 8),
('2023-05-27 09:00:00', '2023-01-09 10:00:00', 9, 9, 9),
('2023-05-25 11:00:00', '2023-01-10 12:00:00', 10, 10, 10);
