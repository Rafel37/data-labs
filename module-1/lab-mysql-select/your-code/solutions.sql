-- CHALLENGE 1
-- Who Have Published What At Where?
SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    titles.title AS TITLE,
    publishers.pub_name AS PUBLISHER
FROM
    authors
        INNER JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        INNER JOIN
    titles ON titles.title_id = titleauthor.title_id
        INNER JOIN
    publishers ON publishers.pub_id = titles.pub_id
ORDER BY authors.au_id;
    
-- CHALLENGE 2 
-- Who Have Published How Many At Where?
SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    publishers.pub_name AS PUBLISHER,
    COUNT(titles.pub_id) AS TITLE_COUNT
FROM
    authors
        INNER JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        INNER JOIN
    titles ON titles.title_id = titleauthor.title_id
        INNER JOIN
    publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id;
    
-- CHALLENGE 3 
-- Best Selling Authors 3
SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    SUM(DISTINCT titles.pub_id) AS TOTAL
FROM
    authors
        INNER JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        INNER JOIN
    titles ON titles.title_id = titleauthor.title_id
        INNER JOIN
    publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3
;
-- CHALLENGE 4 
-- Best Selling Authors Ranking 23
SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    SUM(COALESCE(titles.pub_id, 0)) AS TOTAL
FROM
    authors
        INNER JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        INNER JOIN
    titles ON titles.title_id = titleauthor.title_id
        INNER JOIN
    publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 23
;
-- BONUS
-- Most Profiting Authors
SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    titles.advance + roysched.royalty AS PROFIT
FROM
    authors
        INNER JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        INNER JOIN
    titles ON titles.title_id = titleauthor.title_id
        INNER JOIN
    publishers ON publishers.pub_id = titles.pub_id
        INNER JOIN
    roysched ON roysched.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY PROFIT DESC
LIMIT 3
;