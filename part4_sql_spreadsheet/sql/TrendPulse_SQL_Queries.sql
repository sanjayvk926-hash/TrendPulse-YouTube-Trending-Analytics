CREATE DATABASE trendpulse_db;

USE trendpulse_db;
SHOW DATABASES;

SELECT DATABASE();
USE trendpulse_db;

CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE videos (
    video_id VARCHAR(50) NOT NULL,
    country_id INT NOT NULL,
    category_id INT NOT NULL,
    title TEXT,
    channel_title VARCHAR(255),
    views BIGINT,
    likes BIGINT,
    dislikes BIGINT,
    comment_count BIGINT,
    trending_date DATE,
    engagement_rate DECIMAL(12,4),

    PRIMARY KEY (video_id, country_id, trending_date),

    FOREIGN KEY (country_id)
        REFERENCES countries(country_id),

    FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);
SHOW TABLES;

DESCRIBE countries;
DESCRIBE categories;
DESCRIBE videos;
USE trendpulse_db;

SELECT COUNT(*) FROM videos_staging;

SELECT * FROM videos_staging LIMIT 5;
USE trendpulse_db;

DROP TABLE videos_staging;
INSERT INTO countries (country_name)
SELECT DISTINCT country
FROM videos_staging
WHERE country IS NOT NULL;
SELECT * FROM countries;
DESCRIBE videos_staging;
INSERT INTO categories (category_id, category_name)
SELECT DISTINCT category_id, category_title
FROM videos_staging
WHERE category_id IS NOT NULL
  AND category_title IS NOT NULL;
DESCRIBE videos_staging;

SELECT * FROM videos_staging LIMIT 3;
USE trendpulse_db;

SELECT COUNT(*) AS total_records
FROM videos_staging;
USE trendpulse_db;

INSERT IGNORE INTO countries (country_name)
SELECT DISTINCT country
FROM videos_staging
WHERE country IS NOT NULL;
SELECT * FROM categories_staging LIMIT 10;
INSERT IGNORE INTO categories (category_id, category_name)
SELECT category_id, category_name
FROM categories_staging;
SELECT * FROM categories;

SELECT COUNT(*) AS total_categories
FROM categories;
DESCRIBE videos_staging;
SELECT COUNT(*) AS total_categories
FROM categories;
SELECT * FROM countries;
SELECT COUNT(*) AS unmatched_countries
FROM videos_staging s
LEFT JOIN countries c
ON s.country = c.country_name
WHERE c.country_id IS NULL;
SELECT COUNT(*) AS unmatched_categories
FROM videos_staging s
LEFT JOIN categories c
ON s.category_id = c.category_id
WHERE c.category_id IS NULL;
SELECT COUNT(*) AS duplicate_groups
FROM (
    SELECT video_id, country, trending_date
    FROM videos_staging
    GROUP BY video_id, country, trending_date
    HAVING COUNT(*) > 1
) AS duplicates;
INSERT INTO videos (
    video_id,
    country_id,
    category_id,
    title,
    channel_title,
    views,
    likes,
    dislikes,
    comment_count,
    trending_date,
    engagement_rate
)
SELECT
    s.video_id,
    c.country_id,
    s.category_id,
    s.title,
    s.channel_title,
    s.views,
    s.likes,
    s.dislikes,
    s.comment_count,
    STR_TO_DATE(s.trending_date, '%Y-%m-%d'),
    CASE
        WHEN s.views > 0
        THEN ((s.likes + s.comment_count) / s.views) * 100
        ELSE NULL
    END
FROM videos_staging s
JOIN countries c
    ON s.country = c.country_name
JOIN categories cat
    ON s.category_id = cat.category_id;
SELECT COUNT(*) AS total_videos FROM videos;
SELECT COUNT(*) AS total_videos
FROM videos;
SELECT
    c.country_name,
    COUNT(*) AS total_videos
FROM videos v
JOIN countries c
    ON v.country_id = c.country_id
GROUP BY c.country_name;
SELECT
    v.video_id,
    v.title,
    c.country_name,
    cat.category_name,
    v.views,
    v.likes,
    v.engagement_rate
FROM videos v
JOIN countries c
    ON v.country_id = c.country_id
JOIN categories cat
    ON v.category_id = cat.category_id
LIMIT 10;
SELECT title, views
FROM videos
WHERE views > 1000000;
SELECT title, views
FROM videos
ORDER BY views DESC
LIMIT 10;
SELECT DISTINCT country_name
FROM countries;
SELECT
    c.country_name AS country,
    ROUND(AVG(v.views), 2) AS average_views
FROM videos v
JOIN countries c
    ON v.country_id = c.country_id
GROUP BY c.country_name;
SELECT
    cat.category_name,
    ROUND(AVG(v.views), 2) AS average_views
FROM videos v
JOIN categories cat
    ON v.category_id = cat.category_id
GROUP BY cat.category_name
HAVING AVG(v.views) > 500000;
SELECT
    cat.category_name,
    ROUND(AVG(v.views), 2) AS average_views
FROM videos v
JOIN categories cat
    ON v.category_id = cat.category_id
GROUP BY cat.category_name
HAVING AVG(v.views) > 500000;
SELECT
    v.title,
    c.country_name,
    cat.category_name,
    v.views
FROM videos v
INNER JOIN countries c
    ON v.country_id = c.country_id
INNER JOIN categories cat
    ON v.category_id = cat.category_id
LIMIT 20;
SELECT
    c.country_name,
    COUNT(v.video_id) AS total_videos
FROM countries c
LEFT JOIN videos v
    ON c.country_id = v.country_id
GROUP BY c.country_name;
SELECT
    c.country_name,
    SUM(v.views) AS total_views
FROM videos v
JOIN countries c
    ON v.country_id = c.country_id
GROUP BY c.country_name
ORDER BY total_views DESC
LIMIT 1;


