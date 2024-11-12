SELECT 
    c.kodeMK,
    c.namaMK,
    COUNT(DISTINCT s.nim) FILTER (WHERE c.nilaihuruf IN ('A', 'B')) AS "Jumlah mahasiswa yang mendapat nilai A atau B",
    ROUND(AVG(c.nilaiAngka) FILTER (WHERE s.umur > 20 AND s.umur < 22), 1) AS "Nilai rata-rata pada mahasiswa yang berumur lebih dari 20 dan kurang dari 22"
FROM 
    courses AS c
JOIN 
    students AS s ON c.nim = s.nim
GROUP BY 
    c.kodeMK, c.namaMK;