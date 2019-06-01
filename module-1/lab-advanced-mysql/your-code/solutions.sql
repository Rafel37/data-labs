-- CHALLENGE 1
-- Most Profiting Authors
SELECT 
    authors.au_id AS AUTHOR_ID,
    authors.au_lname AS LAST_NAME,
    authors.au_fname AS FIRST_NAME,
    (titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) + titles.advance AS SALES_ROYALTY
FROM
    authors
        INNER JOIN
    titleauthor ON titleauthor.au_id = authors.au_id
        INNER JOIN
    titles ON titles.title_id = titleauthor.title_id
        INNER JOIN
    sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY SALES_ROYALTY DESC
LIMIT 3
;	

-- CHALLENGE 2
-- Alternative Solution
CREATE TEMPORARY TABLE;







