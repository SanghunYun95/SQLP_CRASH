-- 1 
SELECT ����, SUM(����ݾ�) AS ����ݾ�
FROM ����������
GROUP BY ����
ORDER BY ����ݾ� DESC;

-- 2
SELECT ����, ����ݾ�
FROM ����������
ORDER BY �� ASC;

-- 3
SELECT ����, SUM(����ݾ�) AS ����ݾ�
FROM ����������
GROUP BY ����
ORDER BY �� DESC;

-- 4
SELECT ����, SUM(����ݾ�) AS ����ݾ�
FROM ����������
GROUP BY ����
HAVING SUM(����ݾ�) > 1000
ORDER BY COUNT(*) ASC;