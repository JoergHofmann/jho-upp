	
--  Konstanten ===================================================================================================================================================== {**
home = os.getenv("HOME")

--**}

-- Variable ======================================================================================================================================================== {**

-- Dokument-Info ==================================================================================================== {**

AutorNachname = "Hofmann"

AutorVorname = "Jörg"

AutorStrasse"Am Schloßpark 78"

AutorPLZ = "65203"

AutorOrt = "Wiesbaden"

AutorTel = "+49(611)507411"

AutorFax = "+49(611)94939032"

AutorMobil = "+49(176)27810343"

AutorMail = "joerg.hofmann@jho-home.de"

-- **}

-- Variable für Jahr, Monat, Tag definieren ====================================================================================== {**
--

heute = os.date('*t')

Monat = {}

Monat[1] = {
   MMMM = "Januar",
    MMM = "Jan",
     MM = "01",
      Q = "I"
   }

Monat[2] = {
   MMMM = "Februar",
    MMM = "Feb",
     MM = "02",
      Q = "I"
   }

Monat[3] = {
   MMMM = "März",
    MMM = "Mrz",
     MM = "03",
      Q = "I"
   }

Monat[4] = {
   MMMM = "April",
    MMM = "Apr",
     MM = "04",
      Q = "II"
   }

Monat[5] = {
   MMMM = "Mai",
    MMM = "Mai",
     MM = "05",
      Q = "II"
   }

Monat[6] = {
   MMMM = "Juni",
    MMM = "Jun",
     MM = "06",
      Q = "II"
   }

Monat[7] = {
   MMMM = "Juli",
    MMM = "Jul",
     MM = "07",
      Q = "III"
   }

Monat[8] = {
   MMMM = "August",
    MMM = "Aug",
     MM = "08",
      Q = "III"
   }

Monat[9] = {
   MMMM = "September",
    MMM = "Sep",
     MM = "09",
      Q = "III"
   }

Monat[10] = {
   MMMM = "Oktober",
    MMM = "Okt",
     MM = "10",
      Q = "IV"
   }

Monat[11] = {
   MMMM = "November",
    MMM = "Nov",
     MM = "11",
      Q = "IV"
   }

Monat[12] = {
   MMMM = "Dezember",
    MMM = "Dez",
     MM = "12",
      Q = "IV"
   }

 -- **}

-- Projektinformationen ====================================================================================== {**
--
ProjectId = ""

ProjectTitel = ""

AufgabenTyp = "" -- BELEG oder TEXT

-- **}

-- **}

-- Funktionen {**

-- Dokument-Info ==================================================================================================== {**

function SetAutorNachname(nachname) --{**
   AutorNachname = nachname
end
-- **}

function SetAutorVorname(vorname) --{**
   AutorVorname = vorname
end
-- **}

function SetAutorStrasse(strasse) --{**
   AutorStrasse = strasse 
end
-- **}

function SetAutorPLZ(plz) --{**
   AutorPLZ = plz
end
-- **}

function SetAutorOrt(ort) --{**
   AutorOrt = ort
end
-- **}

function SetAutorTel(tel) --{**
   AutorTel = tel
end
-- **}

function SetAutorFax(fax) --{**
   AutorFax = fax
end
-- **}

function SetAutorMobil(mobil) --{**
   AutorMobil = mobil
end
-- **}

function SetAutorMail(mail) --{**
   AutorMail = mail
end
-- **}

-- **}

-- Projektinformationen ====================================================================================== {**
--
function SetProjectId (id) --{**
	ProjectId = id
end
-- **}

function SetProjectTitel (t) --{**
	ProjectTitel = t
end
-- **}

function SetTypBeleg() --{**
   AufgabenTyp = "beleg"
end
-- **}

function SetTypText() --{**
   AufgabenTyp = "text"
end
-- **}

-- **}

-- Git-Funktionenen {**
-- Funktionen um Informationen aus Git zu erhalten

function GITHash() --{**
	local handle = io.popen("git rev-parse HEAD")
	local result = handle:read("*a")
	handle:close()
	return result
end
-- **}

function GITAbrHash() --{**
	local handle = io.popen("git rev-parse --short HEAD")
	local result = handle:read("*a")
	handle:close()
	return result
end
-- **}

-- \item GITParentHashes = \GITParentHashes\ parent hashes
-- \item GITAbrParentHashes = \GITAbrParentHashes\ abbreviated parent hashes
-- \item GITAuthorName = \GITAuthorName\ author name
-- \item GITAuthorEmail = \GITAuthorEmail\ author email
-- \item GITAuthorDate = \GITAuthorDate\ author date
-- \item GITCommitterName = \GITCommitterName\ committer name
-- \item GITCommitterEmail = \GITCommitterEmail\ committer e-mail
-- \item GITCommitterDate = \GITCommitterDate\ committer date
-- **}

-- SetTarget ============================================================================================== {**
function SetTarget (z)
	zielformat = z
	return ""
end
-- **}

-- www ==================================================================================================== {**
-- wird ausgeführt wenn zielformat = html

function www (content)

	if (zielformat == "html5") then
		return content
	else
		return ""
	end
end

-- **}

-- pdf ==================================================================================================== {**
-- wird ausgeführt wenn zielformat = pdf

function pdf (content)

	if (zielformat == "html5") then
		return content
	else
		return ""
	end
end

-- **}

-- MUSTACHE ==================================================================================================== {**
-- Fügt Daten aus einer YAML-Datei(datei) in das Mustache-Template(vorlage) ein.
--
function mustache (datei, vorlage)
	
	local lyaml   = require "lyaml"
	local lustache = require "lustache"

	local YamlStr = ""
	for line in io.lines(datei) do 
		YamlStr = YamlStr .. line .. "\n"
	end

	MustacheData = lyaml.load(YamlStr)
	ausgabe = lustache:render(vorlage, MustacheData)
	return ausgabe
end
-- **}

-- MISCHEN ==================================================================================================== {**
-- a = yaml-String, Funktion erzeugt neue Reienfolge
-- 
function mischen (a, min)
	local max = #a.inventar - 1
	math.randomseed(os.time())
	for i = min, max, 1 do
		zi = math.random(max)
		t = a.inventar[zi]
		a.inventar[zi] = a.inventar[i]
		a.inventar[i] = t
	end
end
-- **}  

-- AUFGABE ==================================================================================================== {**
-- Fügt eine Aufgabe in den Text ein.
-- 
function Aufgabe (GlEbene, Titel, Datei)

    local ReturnStr = ""
    require(Datei)

    -- Überschrift
    if (zielformat == "context") then
	ReturnStr = ReturnStr .. "\\page\n"
    end
    for i = 1, GlEbene, 1 do
	ReturnStr = ReturnStr .. "#"
    end
    ReturnStr = ReturnStr .. " Übung: " .. Titel .. "\n\n"

    ReturnStr = ReturnStr .. main(GlEbene + 1) 

    return ReturnStr

end
-- **}

-- RUNDEN ==================================================================================================== {**
-- Rundet "zahl" auf die in "stellen" angegebene Genauigkeit
--
function runden (zahl, stellen)	
	local z = math.floor(zahl * 10^stellen + 0.5) / 10^stellen
	return z
end

-- **}

-- TAUSENDER ================================================================================================== {**
-- Stellt "zahl" mit "stellen" nach dem Komma und Tausenderpunkt dar
--
function tausender (zahl,stellen)
	local ganz = ""
	local dez = ""
	local s = ""
	z = runden(zahl, stellen)
	p = string.find(z,"%.")
	dez = string.sub(z, p+1, string.len(z))
	l = string.len(dez)
	if l < stellen then
		for i = l+1, stellen, 1 do
			dez = dez .. "0"
		end
	end
	ganz = string.sub(z, 1, p-1)string.len(ganz)
	ganz = string.reverse(ganz)
	l = string.len(ganz)
	for i = 1, l, 3 do
		s = s .. string.sub(ganz, i, i+2) .. "."
	end 
	s = string.reverse(s)
	s = string.sub(s, 2, string.len(s))
	s = s .. "," .. dez
	return s
end

--**}

-- Datum und Zeit {**


-- **}
--
-- **}

-- Testbereich für Funktionen --{**

-- ZUSAMMEN ==================================================================================================== {**
-- Trennung verhindern
function zusammen (text)
    if (zielformat=="context") then
	text = "\\unhyphenated{" .. text .. "}"
    end
    return text
end

-- **}

-- **}
