--emp 뀒 씠釉붿뿉 꽌 ename留  議고쉶 븯 떆 삤
SELECT
    ename
FROM
    emp;
--emp 뀒 씠釉붿뿉 꽌 job留  議고쉶 븯 떆 삤
SELECT
    ename,
    job
FROM
    emp;
--emp  뀒 씠釉   쟾泥  議고쉶
SELECT
    *
FROM
    emp;
--student  뀒 씠釉   쟾泥  議고쉶
SELECT
    *
FROM
    student;
-- 몴 쁽 떇
SELECT
    name,
    '吏 湲덉떎 뒿以 '
FROM
    student;
--而щ읆 蹂꾩묶 allias
SELECT
    name     " 씠由 ",
    grade    AS " 븰 뀈",
    birthday  깮 씪
FROM
    student;
--emp 뿉 꽌  궗 썝紐 , 吏곸뾽,  엯 궗 씪 옄瑜  議고쉶 븯 떆 삤
SELECT
    ename    " 궗 썝紐 ",
    job      AS "吏곸뾽",
    hiredate  엯 궗 씪 옄
FROM
    emp;
--DISTINCT: 以묐났 맂 媛믪쓣  젣嫄고븯怨  異쒕젰 븯湲 
--emp 뿉 꽌 吏곸뾽援곗쓣 以묐났 븯吏  留먭퀬 異쒕젰
SELECT DISTINCT
    job 吏곸뾽援 
FROM
    emp;
--emp 뿉 꽌 遺  꽌踰덊샇瑜  以묐났 뾾 씠 異쒕젰
SELECT DISTINCT
    deptno 遺  꽌踰덊샇
FROM
    emp;
-- 빀 꽦 뿰 궛 옄: 而щ읆 쓣 遺숈뿬 꽌 異쒕젰
SELECT
    name
    || ' 떂  '
    || position
    || ' 엯 땲 떎' "援먯닔蹂꾩쭅湲 "
FROM
    professor;
--smith 떂 쓽 job   clerk 엯 땲 떎
SELECT
    ename
    || ' 떂 쓽 job  '
    || job
    || ' 엯 땲 떎'
FROM
    emp;
--student 뿉 꽌  꽌吏꾩닔 떂 쓽  궎 뒗 180cm, 紐몃Т寃뚮뒗 72kg  엯 땲 떎
SELECT
    name
    || ' 떂 쓽  궎 뒗'
    || height
    || 'cm, 紐몃Т寃뚮뒗'
    || weight
    || 'kg 엯 땲 떎'
FROM
    student;
--emp 뿉 꽌  궡 吏곸뾽   salsman 씠怨   뿰遊됱  *** 엯 땲 떎
SELECT
    'emp 뿉 꽌  궡 吏곸뾽  '
    || job
    || ' 씠怨   뿰遊됱 '
    || sal
    || ' 엯 땲 떎'
FROM
    emp;
-- 젙 젹
--student 뿉 꽌  븰 깮紐   븰 뀈  깮 씪 쓣  븰 깮紐낆쓽  삤由꾩감 닚 쑝濡  議고쉶 븯 떆 삤
SELECT
     븰 깮紐 ,
    grade     븰 뀈,
    birthday  깮 씪
FROM
    student
ORDER BY
    name ASC;  --asc 뒗  깮 왂 媛  뒫
SELECT
     븰 깮紐 ,
    grade     븰 뀈,
    birthday  깮 씪
FROM
    student
ORDER BY
    name DESC;

SELECT
     븰 깮紐 ,
    grade     븰 뀈,
    birthday  깮 씪
FROM
    student
ORDER BY
    birthday;
--emp 뿉 꽌  궗 썝紐 , 吏곸뾽, 湲됱뿬瑜  湲됱뿬媛   궙    궗 엺  닚 쑝濡  議고쉶 븯 꽭 슂
SELECT
    ename  궗 썝紐 ,
    job   吏곸뾽,
    sal   湲됱뿬
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    ename  궗 썝紐 ,
    job   吏곸뾽,
    sal   湲됱뿬
FROM
    emp
ORDER BY
    3 DESC; --而щ읆踰덊샇濡쒕룄  젙 젹媛  뒫
--emp 뿉 꽌 吏곸뾽援곗쓣 以묐났 뾾 씠 異쒕젰 븯怨  吏곸뾽援곗쓽  삤由꾩감 닚 쑝濡  異쒕젰 븯 떆 삤
SELECT DISTINCT
    job
FROM
    emp
ORDER BY
    job ASC;
--emp 뿉 꽌 吏곸뾽援곗쓣 以묐났 뾾 씠 異쒕젰 븯怨  吏곸뾽援곗쓽  궡由쇱감 닚 쑝濡  異쒕젰 븯 떆 삤
SELECT DISTINCT
    job
FROM
    emp
ORDER BY
    job DESC;

-- 궛 닠 뿰 궛 옄
--emp 뿉 꽌 sal 뿉  듅蹂꾨낫 꼫 뒪 100 쓣  뜑 븯 뿬 異쒕젰 븯 떆 삤
SELECT
    ename      궗 썝紐 ,
    sal       湲곕낯湲 ,
    sal + 100  듅蹂꾨낫 꼫 뒪
FROM
    emp;
--where 젅 : 議곌굔
--emp 뿉 꽌 10踰덈  꽌 뿉 洹쇰Т 븯 뒗  궗 엺 쓽  궗 썝紐 , 湲됱뿬   遺  꽌踰덊샇瑜  異쒕젰 븯 꽭 슂
SELECT
    ename   궗 썝紐 ,
    sal    湲됱뿬,
    deptno 遺  꽌踰덊샇
FROM
    emp
WHERE
    deptno = 10;
--emp 뿉 꽌  씠由꾩씠 KING 씤  궗 엺 쓽  궗 썝紐 , 吏곸뾽 쓣 議고쉶 븯 떆 삤
SELECT
    ename  궗 썝紐 ,
    job   吏곸뾽
FROM
    emp
WHERE
    ename = 'KING';
--emp 뿉 꽌 湲됱뿬媛  3000  씠 긽 씤  궗 엺 쓽  궗 썝紐낃낵 湲됱뿬瑜  議고쉶 븯 떆 삤
SELECT
    ename  궗 썝紐 ,
    sal   湲됱뿬
FROM
    emp
WHERE
    sal >= 3000;
-- 븰 깮 뀒 씠釉붿뿉 꽌  궎媛  180cm  씠 긽 씤  븰 깮紐낃낵  궎瑜  異쒕젰 븯 떆 삤
SELECT
    name    븰 깮紐 ,
    height  궎
FROM
    student
WHERE
    height >= 180;
-- 븰 깮 뀒 씠釉붿뿉 꽌  궎媛  160cm遺  꽣 180cm  궗 씠 씤  븰 깮 쓽  븰 깮紐낃낵  궎 異쒕젰 between a and b( 옉    닽 옄 癒쇱     빞 븿)
SELECT
    name    븰 깮紐 ,
    height  궎
FROM
    student
WHERE
    height BETWEEN 160 AND 180
ORDER BY
    height;
--in(a,b): a,b留  議고쉶
--emp 뿉 꽌 deptno媛  20,30 씤  궗 엺 뱾 쓽  궗 썝紐낃낵 遺  꽌踰덊샇瑜  議고쉶 븯 떆 삤
SELECT
    ename   궗 썝紐 ,
    deptno 遺  꽌踰덊샇
FROM
    emp
WHERE
    deptno IN ( 20, 30 );
--null媛믩쭔 異쒕젰
--emp 뿉 꽌 comm 씠 null 씤  궗 엺 쓽  씠由꾧낵 蹂대꼫 뒪瑜  異쒕젰 븯 떆 삤
SELECT
    ename  궗 썝紐 ,
    comm  蹂대꼫 뒪
FROM
    emp
WHERE
    comm IS NULL;
--emp 뿉 꽌 comm 씠 null 씠  븘 땶  궗 엺 쓽  씠由꾧낵 蹂대꼫 뒪瑜  異쒕젰 븯 떆 삤
SELECT
    ename  궗 썝紐 ,
    comm  蹂대꼫 뒪
FROM
    emp
WHERE
    comm IS NOT NULL;

--NVL: null媛  0 쑝濡  諛붽씀湲 _ 뿰 궛 씠 紐⑹쟻
SELECT
    ename         궗 썝紐 ,
    nvl(comm, 0) 蹂대꼫 뒪
FROM
    emp;
--Like  뿰 궛 옄
-- 븰 깮 뀒 씠釉붿뿉 꽌 源  뵪留  議고쉶 븯 뿬 紐⑤뱺  뿴 쓣 異쒕젰 븯 떆 삤
SELECT
    *
FROM
    student
WHERE
    name LIKE '源 %';