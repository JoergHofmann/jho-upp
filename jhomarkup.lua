	
--  Konstanten ===================================================================================================================================================== {**
home = "//home/jorg/"

function SetAutorNachname(nachname)
   AutorNachname = nachname
end

SetAutorNachname("Hofmann")


function SetAutorVorname(vorname)
   AutorVorname = vorname
end

SetAutorVorname("Jörg")

function SetAutorStrasse(strasse)
   AutorStrasse = strasse 
end

SetAutorStrasse("Am Schloßpark 78")

function SetAutorPLZ(plz)
   AutorPLZ = plz
end

SetAutorPLZ("65203")

function SetAutorOrt(ort)
   AutorOrt = ort
end

SetAutorOrt("Wiesbaden")

function SetAutorTel(tel)
   AutorTel = tel
end

SetAutorTel("+49(611)507411")

function SetAutorFax(fax)
   AutorFax = fax
end

SetAutorFax("+49(611)94939032")

function SetAutorMobil(mobil)
   AutorMobil = mobil
end

SetAutorMobil("+49(176)27810343")

function SetAutorMail(mail)
   AutorMail = mail
end

SetAutorMail("joerg.hofmann@jho-home.de")

function SetTypBeleg()
   AufgabenTyp = "beleg"
end

function SetTypText()
   AufgabenTyp = "text"
end

-- Variable für Jahr, Monat, Tag definieren
--

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
--
-- Funktionen {**
--


-- MUSTACHE ==================================================================================================== {**
-- Fügt Daten aus einer YAML-Datei in das Mustache-Template ein.
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


-- PRAESENTATION ================================================================================================= {**
-- Befehle um Präsentationen zu erstellen - nur Testfassung


function Slide (content)

	if (modus == "slides") then
		return content
	else
		return "Keine Folien"
	end

end



function Handout (content)

	if (modus == "handout") then
		return content
	else
		return ""
	end
end



function Note (content)

	local s = [[<aside class="notes">]]

	if (modus == "slides") then
		s = s .. content .. "</aside>"
		return s
	end

	if (modus == "notes") then
		return content
	end
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

-- **}
