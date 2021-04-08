SELECT szerepnev
FROM Szerep
WHERE hang = 'bariton'
ORDER BY szerepnev;

SELECT max(szulev) - min(szulev) AS korkulonbseg
FROM Enekes;

SELECT Mu.szerzo, Mu.cim, Szerep.szerepnev
FROM Mu INNER JOIN Szerep ON Mu.[﻿id] = Szerep.muid
WHERE Mu.szerzo = 'Erkel'
GROUP BY Mu.szerzo, Mu.cim, Szerep.szerepnev;

SELECT TOP 1 Enekes.nev, szerep.szerepnev, repertoar.utoljara - enekes.szulev AS utolso_enekleskor
FROM (Mu INNER JOIN Szerep ON Mu.[﻿id] = Szerep.muid) INNER JOIN (Enekes INNER JOIN Repertoar ON Enekes.[﻿id] = Repertoar.[﻿enekesid]) ON Szerep.[﻿id] = Repertoar.szerepid
WHERE Mu.cim = 'Bánk bán'
GROUP BY Mu.cim, Enekes.nev, szerep.szerepnev, repertoar.utoljara, enekes.szulev
ORDER BY repertoar.utoljara - enekes.szulev DESC;

SELECT DISTINCT Enekes.nev
FROM (Mu INNER JOIN Szerep ON Mu.[﻿id] = Szerep.muid) INNER JOIN (Enekes INNER JOIN Repertoar ON Enekes.[﻿id] = Repertoar.[﻿enekesid]) ON Szerep.[﻿id] = Repertoar.szerepid
WHERE Szerep.hang in('alt', 'szoprán', 'mezoszoprán') and Mu.szerzo = 'Wagner';

SELECT Enekes.nev, Szerep.szerepnev
FROM Mu INNER JOIN (Szerep INNER JOIN (Enekes INNER JOIN Repertoar ON Enekes.[﻿id] = Repertoar.[﻿enekesid]) ON Szerep.[﻿id] = Repertoar.szerepid) ON Mu.[﻿id] = Szerep.muid
WHERE mu.cim  in(SELECT Mu.cim
FROM Mu INNER JOIN Szerep ON Mu.[﻿id] = Szerep.muid
WHERE Szerep.szerepnev like '*Ottó*'
GROUP BY Mu.cim, Szerep.szerepnev;) and Enekes.nev like '*Ottó*' and Szerep.szerepnev not like '*Ottó*';

SELECT Mu.cim
FROM Mu INNER JOIN Szerep ON Mu.[﻿id] = Szerep.muid
WHERE Szerep.szerepnev like '*Ottó*'
GROUP BY Mu.cim, Szerep.szerepnev;

SELECT [8seged].hang, Count([8seged].nev) AS CountOfnev
FROM 8seged
GROUP BY [8seged].hang;

SELECT distinct Enekes.nev, Szerep.hang
FROM (Mu INNER JOIN Szerep ON Mu.[﻿id] = Szerep.muid) INNER JOIN (Enekes INNER JOIN Repertoar ON Enekes.[﻿id] = Repertoar.[﻿enekesid]) ON Szerep.[﻿id] = Repertoar.szerepid;


