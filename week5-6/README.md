# インターネットTV

## テーブル設計一覧

テーブル設計は以下の通りです。<br><br>

テーブル：channels

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|channel_id|INT||PRIMARY||YES|
|name|varchar(255)|||||

テーブル：programs

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|program_id|INT||PRIMARY||YES|
|title|varchar(255)|||||
|description|text|||||

テーブル：genres

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|genre_id|INT||PRIMARY||YES|
|name|varchar(32)|||||

テーブル：program_genres

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|program_id|INT||PRIMARY|||
|genre_id|INT|||||

テーブル：seasons

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|season_id|INT||PRIMARY||YES|
|season_number|INT|||||
|program_id|INT|||||

テーブル：episodes

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|episode_id|INT||PRIMARY||YES|
|episode_number|INT|||||
|title|varchar(255)|||||
|description|TEXT|||||
|view_count|INT|||0||
|season_id|INT|||||

テーブル：schedules

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|schedule_id|INT||PRIMARY||YES|
|start_time|DATETIME|||||
|end_time|DATETIME|||||
|channel_id|INT|||||
|program_id|INT|||||
|episode_id|INT|||||


## テーブルの作成とダミーデータの登録

テーブルの作成とダミーデータ登録は、下記の通り行ってください。<br>
※「create_table.sql」と「insert.sql」は当該レポジトリよりgit clone で取得する等してください。

① 自身のPCでMysqlにログインする<br>
② create_table.sql を実行してテーブルを作成する<br>
例えば、Documents下のsqlディレクトリにcreate_table.sqlを格納している場合は、
```
source /Users/ユーザー名/Documents/sql/create_table.sql;
```
のように実行する<br>
③ insert.sql を実行してダミーデータを登録する<br>
上の②と同様、
```
source /Users/ユーザー名/Documents/sql/insert_table.sql;
```
のように実行する<br>
※ご自身でダミーデータを登録していただいても構いません。

## クエリの実行

下記の通り、下記の課題を実現するためクエリを記載します。<br>
なお、こちらは当該レポジトリにあるselect.sqlの中身そのままです。<br>
そのため、git clone してお手元のPCで実行していただいても問題ありません。<br>

1.よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
```
SELECT title, view_count
FROM episodes
ORDER BY view_count DESC
LIMIT 3;
```
2.よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。<br>
  エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
```
SELECT pr.title, se.season_number, ep.episode_number, ep.title, ep.description, ep.view_count
FROM episodes AS ep INNER JOIN seasons AS se
ON  ep.season_id = se.season_id
INNER JOIN programs AS pr
ON se.program_id = pr.program_id
ORDER BY ep.view_count DESC
LIMIT 3;
```

3.本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。<br>
  本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。<br>
  なお、番組の開始時刻が本日のものを本日放送される番組とみなすものとします。
```
SELECT ch.name, sc.start_time, sc.end_time, se.season_number, ep.episode_number, ep.title, ep.description
FROM schedules AS sc INNER JOIN channels AS ch
ON sc.channel_id = ch.channel_id
INNER JOIN episodes AS ep
ON sc.episode_id = ep.episode_id
INNER JOIN seasons AS se
ON ep.season_id = se.season_id
WHERE DATE(sc.start_time) = CURDATE()
ORDER BY sc.start_time;
```

4.Channel 5というチャンネルがあったとして、Channel 5のチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。<br>
  Channel 5のチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください
```
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
```
