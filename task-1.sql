WITH highestScore AS (
    SELECT 
        nim,
        namaMK,
        nilaiAngka,
        RANK() OVER (PARTITION BY nim ORDER BY nilaiAngka DESC) AS rank
    FROM courses
)
SELECT 
    s.nim,
    s.Nama,
    MAX(c.nilaiAngka) AS "Nilai tertinggi",
    MIN(c.nilaiAngka) AS "Nilai terendah",
    AVG(ROUND(c.nilaiAngka)) AS "Nilai rata-rata",
    COUNT(c.kodeMK) AS "Jumlah mata kuliah",
    hs.namaMK AS "Mata kuliah dengan nilai tertinggi"
FROM 
    students AS s
JOIN 
    courses AS c ON s.nim = c.nim
JOIN 
    highestScore AS hs ON s.nim = hs.nim AND hs.rank = 1
GROUP BY 
    s.nim, s.nama, hs.namaMK;
