SELECT title, view_count
FROM episodes
ORDER BY view_count DESC
LIMIT 3;

SELECT pr.title, se.season_number, ep.episode_number, ep.title, ep.description, ep.view_count
FROM episodes AS ep INNER JOIN seasons AS se
ON  ep.season_id = se.season_id
INNER JOIN programs AS pr
ON se.program_id = pr.program_id
ORDER BY ep.view_count DESC
LIMIT 3;

SELECT ch.name, sc.start_time, sc.end_time, se.season_number, ep.episode_number, ep.title, ep.description
FROM schedules AS sc INNER JOIN channels AS ch
ON sc.channel_id = ch.channel_id
INNER JOIN episodes AS ep
ON sc.episode_id = ep.episode_id
INNER JOIN seasons AS se
ON ep.season_id = se.season_id
WHERE DATE(sc.start_time) = CURDATE()
ORDER BY sc.start_time;

SELECT ch.name, sc.start_time, sc.end_time, se.season_number, ep.episode_number, ep.title, ep.description
FROM schedules AS sc
INNER JOIN channels AS ch
ON sc.channel_id = ch.channel_id
INNER JOIN episodes AS ep
ON sc.episode_id = ep.episode_id
INNER JOIN seasons AS se
ON ep.season_id = se.season_id
WHERE sc.start_time BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 WEEK) AND ch.name = 'Channel 5'
ORDER BY sc.start_time;
