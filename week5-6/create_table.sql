CREATE DATABASE internettv;
USE internettv;

CREATE TABLE channels (
  channel_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE programs (
  program_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE genres (
  genre_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(32) NOT NULL
);

CREATE TABLE program_genres (
  program_id INT,
  genre_id INT,
  PRIMARY KEY (program_id, genre_id),
  FOREIGN KEY (program_id) REFERENCES programs(program_id),
  FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE seasons (
  season_id INT AUTO_INCREMENT PRIMARY KEY,
  season_number INT NOT NULL,
  program_id INT,
  FOREIGN KEY (program_id) REFERENCES programs(program_id)
);

CREATE TABLE episodes (
  episode_id INT AUTO_INCREMENT PRIMARY KEY,
  episode_number INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  view_count INT DEFAULT 0,
  season_id INT,
  FOREIGN KEY (season_id) REFERENCES seasons(season_id)
);

CREATE TABLE schedules (
  schedule_id INT AUTO_INCREMENT PRIMARY KEY,
  start_time DATETIME NOT NULL,
  end_time DATETIME NOT NULL,
  channel_id INT NOT NULL,
  program_id INT NOT NULL,
  episode_id INT NOT NULL,
  FOREIGN KEY (channel_id) REFERENCES channels(channel_id),
  FOREIGN KEY (program_id) REFERENCES programs(program_id),
  FOREIGN KEY (episode_id) REFERENCES episodes(episode_id)
);
