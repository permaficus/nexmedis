# Students

| Nim   | Nama      | Alamat     | Jenis Kelamin | Umur | No. Telepon   |
|-------|-----------|------------|---------------|------|---------------|
| 10001 | John      | Medokan    | L             | 20   | 0987654321    |
| 10002 | Agnes     | Tandes     | P             | 21   | 0987654322    |
| 10003 | Monica    | Rungkut    | P             | 20   | 0987654323    |
| 10004 | Sherlock  | Lontar     | L             | 22   | 0987654324    |
| 10005 | Holmes    | Ngagel     | L             | 23   | 0987654325    |
| 10006 | Watson    | Nginden    | L             | 21   | 0987654326    |
| 10007 | Irena     | Benowo     | P             | 23   | 0987654327    |
| 10008 | Adler     | Jogoloyo   | P             | 22   | 0987654328    |
| 10009 | Jared     | Margomulyo | L             | 21   | 0987654329    |
| 10010 | Jefferson | Manukan    | L             | 23   | 0987654320    |

### Task 1 - Query

```sql
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

```


# Courses

| Nim   | Kode Mk | Nama Mk    | Nilai Angka | Nilai Huruf |
|-------|---------|------------|-------------|-------------|
| 10001 | MKA     | Matematika | 89          | A           |
| 10001 | MKB     | Biologi    | 75          | B           |
| 10001 | MKC     | Fisika     | 82          | A           |
| 10002 | MKB     | Biologi    | 75          | B           |
| 10002 | MKA     | Matematika | 66          | C           |

### Task 2 - Query

```sql
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
```

>[!NOTE]
> Jika mengacu pada data - data di atas maka outputnya menjadi:

| kodemk | namamk     | Jumlah mahasiswa yang mendapat nilai A atau B | Nilai rata-rata pada mahasiswa yang berumur lebih dari 20 dan k |
| ------ | ---------- | --------------------------------------------- | --------------------------------------------------------------- |
| MKA    | Matematika | 1                                             | 66.0                                                            |
| MKB    | Biologi    | 2                                             | 75.0                                                            |
| MKC    | Fisika     | 1                                             |                                    0                          |

### Task 2 - 9 Balls Flowchart

<p align="center">
<img src="https://github.com/permaficus/nexmedis/blob/main/9ball-fc.png">
</p>
<br>