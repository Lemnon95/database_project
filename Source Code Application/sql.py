import sqlite3
from prettytable import PrettyTable

def SQL_classe(dancer, c):
	try:
		c.execute("SELECT Classe FROM Ballerino WHERE Codice = \""+dancer+"\"")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	return c.fetchall()[0][0]
	
def max_classe(cl1, cl2):
	if (cl1 == 'M' or cl2 == 'M'):
		return 'M'
	return min(cl1, cl2)

def print_result(c, err_msg):
	print()
	print()
	items = c.fetchall()
	if len(items) > 0:
		column_names = [description[0] for description in c.description]
		myTable = PrettyTable(column_names)
		
		
		for item in items:
			myTable.add_row(item)
		print(myTable)
	else:
		print(err_msg)
	return
	
def query1():
	#Inserimento nuovo ballerino e relativa classe, categoria e scuola di ballo.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	nome = input("Inserisci il nome del ballerino: ")
	cognome = input("Inserisci il cognome del ballerino: ")
	sesso = input("Inserisci il sesso [Maschio/Femmina]: ")
	date = input("Inserisci la data di nascita [dd/mm/yyyy]: ")
	privatista = input("Privatista [Si/No]: ")
	if (privatista == 'No'):
		scuola = input("Inserisci l'ID della scuola: ")
	classe = input("Inserisci la classe di appartenenza: ")
	categoria = input("Inserisci la categoria di appartenenza: ")
	
	try:
		if (privatista == 'No'):
			Ballerino = [(nome, cognome, sesso, date, privatista, scuola, classe, categoria)]
			c.executemany("""
			INSERT INTO Ballerino (Nome, Cognome, Sesso, 'Data di Nascita', Privatista, Scuola, Classe, Categoria)
			VALUES (?,?,?,?,?,?,?,?)
			""", Ballerino)
		else:
			Ballerino = [(nome, cognome, sesso, date, privatista, classe, categoria)]
			c.executemany("""
			INSERT INTO Ballerino (Nome, Cognome, Sesso, 'Data di Nascita', Privatista, Classe, Categoria)
			VALUES (?,?,?,?,?,?,?)
			""", Ballerino)
		conn.commit()
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	print("\n\nNuovo ballerino inserito con successo.")
	conn.close()
	return
	
def query2():
	#Inserimento nuova scuola di ballo.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	nome = input("Inserisci il nome della scuola: ")
	cap = input("Inserisci il cap: ")
	via = input("Inserisci la via: ")
	civico = input("Inserisci il numero civico: ")
	Scuola = [(nome, cap, via, civico)]
	try:
		c.executemany("""
		INSERT INTO ScuolaDiBallo (Nome, Cap, Via, NumeroCivico)
		VALUES (?,?,?,?)
		""", Scuola)
		conn.commit()
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
		
	print("\n\nNuova scuola inserita con successo.")
	conn.close()
	return
	
def query3():
	#Forma una nuova coppia assegnando ad essa un ballerino uomo ed una ballerina donna.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	ballerino = input("Inserisci l'ID del ballerino: ")
	ballerina = input("Inserisci l'ID della ballerina: ")
	#a questo punto, ci calcoliamo la categoria e la classe della coppia
	#per la categoria è semplice, siccome deve essere uguale (verificato poi tramite trigger) possiamo prendere la categoria di uno qualsiasi dei ballerini
	sql_categoria = ("SELECT Categoria FROM Ballerino WHERE Codice = \""+ballerino+"\"")
	try:
		c.execute(sql_categoria)
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	categoria = c.fetchall()[0][0]
	
	#per la classe, dobbiamo derivare quella maggiore
	classe_ballerino = SQL_classe(ballerino, c)
	classe_ballerina = SQL_classe(ballerina, c)
	classe_coppia = max_classe(classe_ballerino, classe_ballerina)
	
	conn.isolation_level = None
	Concorrente = [(classe_coppia, categoria)]
	c.execute("BEGIN")
	try:
		c.executemany("""
		INSERT INTO Concorrente (Classe, Categoria)
		VALUES (?, ?)
		""", Concorrente)
		c.execute("SELECT max(Numero) FROM Concorrente")
		id_coppia = c.fetchall()[0][0]
		Coppia = [(id_coppia, ballerino, ballerina)]
		c.executemany("""
		INSERT INTO Coppia (Numero, Ballerino, Ballerina)
		VALUES (?, ?, ?)
		""", Coppia)
		c.execute("COMMIT")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		c.execute("ROLLBACK")
		conn.close()
		return
	
	print("Nuova Coppia inserita con successo.")
	conn.close()
	return

def query4():
	#Inserimento giudizio di un giudice relativo ad una Partecipazione - C.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	part_c = input("Inserisci Numero del concorrente: ")
	part_g = input("Inserisci Codice del Giudice: ")
	match = input("Inserisci l'ID del Match: ")
	tipologia = input("Inserisci tipologia [Finale/Eliminatorie]: ")
	
	if ("Finale" == tipologia):
		posizione = input("Inserisci la posizione: ")
	else:
		consenso = input("Inserisci il consenso [Si/No] ")
		if (consenso == "Si"):
			#costruisco dizionario dei consensi
			DizConsensi = {
				"Semifinale" : 6,
				"Quarti" : 11,
				"Ottavi" : 14
			}
			#estraggo il round
			sql = ("SELECT Round FROM Match WHERE ID = \""+ match +"\"")
			try:
				c.execute(sql)
			except sqlite3.Error as er:
				print('SQLite error: %s' % (' '.join(er.args)))
				conn.close()
				return
			m_round = c.fetchall()[0][0]
			consensi_massimi = DizConsensi[m_round]
			#non ci resta che estrapolare il numero di consensi che il giudice ha già dato
			sql = ("""
			SELECT count(*)
			FROM Giudizio 
			WHERE PartecipazioneG = """+"\""+part_g+"\" and MatchG = \"" + match +"\""+"""
			""")
			try:
				c.execute(sql)
			except sqlite3.Error as er:
				print('SQLite error: %s' % (' '.join(er.args)))
				conn.close()
				return
			num_consensi = c.fetchall()[0][0]
			if (num_consensi == consensi_massimi): 
				print("\n\nIl giudice selezionato ha raggiunto il suo valore massimo di consensi per questo match. Operazione non eseguita.")
				return
			
		
	try:
		if ("Finale" == tipologia):
			Giudizio = [(part_c, part_g, match, match, tipologia, posizione)]
			c.executemany("""
			INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Posizione)
			VALUES (?, ?, ?, ?, ?, ?)
			""", Giudizio)
		else:
			Giudizio = [(part_c, part_g, match, match, tipologia, consenso)]
			c.executemany("""
			INSERT INTO Giudizio (PartecipazioneC, PartecipazioneG, MatchC, MatchG, Tipologia, Consenso)
			VALUES (?, ?, ?, ?, ?, ?)
			""", Giudizio)
		conn.commit()
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	print("\n\nNuovo giudizio inserito con successo.")
	conn.close()
	return
	
def query5():
	#trova il piazzamento di un dato concorrente, in una specifica classifica. 
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	concorrente = input("Inserisci il numero del concorrente: ")
	classe = input("Inserisci la classe della classifica: ")
	categoria = input("Inserisci la categoria della classifica: ")
	disciplina = input("Inserisci la disciplina della classifica: ")
	try:
		c.execute("SELECT Posizione FROM Piazzamento join Concorrente on Concorrente = Numero WHERE Numero = \"" + concorrente + "\" and Classifica in ( SELECT ID FROM Classifica WHERE Classe = \"" + classe + "\" and Categoria = \"" + categoria + "\" and Disciplina = \"" + disciplina + "\")")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
		
	
	items = c.fetchall()
	
	if len(items) > 0:
		print("\nLa posizione del concorrente selezionato, nella classifica scelta è: " + str(items[0][0]))
	else:
		print("\nIl concorrente numero " + concorrente + " non risulta in questa classifica")
	conn.close()
	return

def query6():
	#trova il numero dei ballerini appartenenti ad una certa scuola di ballo.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	via = input("Inserisci la via della scuola: ")
	civ = input("Inserisci il numero civico: ")
	cap = input("Inserisci il CAP: ")
	try:
		c.execute("SELECT (NumBalleriniD + NumBalleriniC + NumBalleriniB + NumBalleriniA + NumBalleriniM) as Totale from ScuolaDiBallo where  ScuolaDiBallo.NumeroCivico = \""+ civ +"\" and ScuolaDiBallo.Via = \"" +via+ "\" and ScuolaDiBallo.Cap = \"" +cap+ "\"")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	items = c.fetchall()
	
	if len(items) > 0:
		print("\nIl numero di ballerini appartenente alla scuola è: " + str(items[0][0]))
	else:
		print("\nLa scuola selezionata non esiste")
	conn.close()
	return
	
	
def query7():
	#trova i dati di tutti i giudici di un certo match.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	m_round = input("Inserisci il round: ")
	m_classe = input("Inserisci la classe: ")
	m_categoria = input("Inserisci la categoria: ")
	m_disciplina = input("Inserisci la disciplina: ")
	try:
		c.execute("""
select *
from Giudice as G
where Codice in 
(
	select Giudice
	from PartecipazioneG
	where Match in 
	(
		select ID
		from Match
		where Round = """ + "\"" +m_round+ "\" and Classe = \"" +m_classe+ "\" and Categoria = \"" +m_categoria+ "\" and Disciplina = \"" +m_disciplina+ "\"" + """
	)
)""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return

	print_result(c, "Il match indicato non è esistente, oppure non vi sono stati assegnati giudici.")
	
	conn.close()
	return
	
def query8():
	#trova i dati di tutti i ballerini che compongono le coppie iscritte ad una determinata disciplina. 
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	disciplina = input("Inserisci la disciplina: ")
	try:
		c.execute("""
		select *
		from Ballerino
		where (Sesso = "Femmina" and Codice in
		(
			select Ballerina
			from Coppia
			where Numero in
			(
				select NumeroCoppia
				from IscrizioneCoppia
				where NomeDisciplina = """ + "\""+disciplina+ "\"" + """
			)
		))
		or
		Sesso = "Maschio" and Codice in
		(
			select Ballerino
			from Coppia
			where Numero in
			(
				select NumeroCoppia
				from IscrizioneCoppia
				where NomeDisciplina = """ + "\""+disciplina+ "\"" + """
			)
		)
		order by Codice
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	print_result(c, "Non ci sono coppie iscritte alla disciplina selezionata.")
	
	conn.close()
	return
	
def query9():
	#visualizza nome, cognome e scuola di ballo dei ballerini di tutte le coppie arrivate in finale in una determinata classifica.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	classe = input("Inserisci la classe della classifica: ")
	categoria = input("Inserisci la categoria della classifica: ")
	disciplina = input("Inserisci la disciplina della classifica: ")
	try:
		c.execute("""
		select B1.Nome, B1.Cognome, B1.Scuola, B2.Nome as NomeF, B2.Cognome as CognomeF, B2.Scuola as ScuolaF, C.Numero
		from  Ballerino as B1 join Coppia as C on Ballerino = B1.Codice
			  join Ballerino as B2 on Ballerina = B2.Codice
		group by C.Numero
		having C.Numero in 
		(
			select Concorrente
			from Piazzamento join Classifica as C on Piazzamento.Classifica = C.ID
			where Classe = """+"\""+classe+"\" and Categoria = \""+categoria+"\" and Disciplina = \""+disciplina+"\""+"""
		)
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	print_result(c, "Non ci sono coppie arrivate in finale nella classifica selezionata.")
		
	
	
	conn.close()
	return
	
def query10():
	#alcola la percentuale del numero di ballerini di classe C, per scuola di ballo.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	try:
		c.execute("""
		select ID, Nome, (NumBalleriniC/(NumBalleriniD+NumBalleriniC+NumBalleriniB+NumBalleriniA+NumBalleriniM)) as Percentuale
		from ScuolaDiBallo
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
		
	print_result(c, "Non ci sono scuole")
	
	conn.close()
	return	
	
def query11():
	#memorizza l'iscrizione di un gruppo ad una disciplina
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	gruppo = input("Inserisci numero del gruppo: ")
	disciplina = input("Inserisci il nome della disciplina di gruppo: ")
	Iscrizione = [(gruppo, disciplina)]
	try:
		c.executemany("""
		INSERT INTO IscrizioneGruppo
		VALUES (?, ?)
		""", Iscrizione)
		conn.commit()
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	print("\n\nNuova iscrizione aggiunta con successo.")
	conn.close()
	return

def query12():
	#stampa tutti i dati di una disciplina di gruppo (incluso il numero di gruppi iscritti).
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	disciplina = input("Inserisci disciplina di gruppo: ")
	try:
		c.execute("""
		select *
		from Disciplina
		where Nome = """+"\""+disciplina+"\" and Tipologia = \"Gruppo\""+ """
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	print_result(c, "Errore. Inserisci una disciplina di gruppo.")
	
	conn.close()
	return
	
def query13():
	#estrai le scuole di ballo dove è massimo il numero di ballerini di una specifica classe.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	X = input("Inserisci classe: ")
	try:
		c.execute("""
		select *
		from ScuolaDiBallo
		group by ID
		having max(NumBallerini"""+X+""")
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	print_result(c, "Errore. Non esiste nessun ballerino di classe " + X + ".")
	
	conn.close()
	return
	
def query14():
	#estrai per ogni coppia, il loro numero ed il numero di discipline a cui sono iscritte, ma solo se sono iscritte ad almeno 2 discipline.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	try:
		c.execute("""
		select C.Numero, count(IC.NomeDisciplina) as N°_Discipline
		from Coppia as C join IscrizioneCoppia as IC on C.Numero = IC.NumeroCoppia
		group by C.Numero
		having count(IC.NomeDisciplina) > 1
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	print_result(c, "Non esiste nessuna coppia iscritta ad almeno 2 discipline")
	
	conn.close()
	return
	
def query15():
	#estrai Nome e Cognome dei giudici che hanno giudicato più match.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	try:
		c.execute("""
		select G.Nome, G.Cognome
		from Giudice as G join PartecipazioneG as PG on G.Codice = PG.giudice
		group by G.Codice
		having count(*) = 
		( 
			select max(c)
			from (
				select count(*) as c
				from Giudice as G join PartecipazioneG as PG on G.Codice = PG.giudice
				group by G.Codice
				) 
		)
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	print_result(c, "Non esiste nessun giudizio")
	
	conn.close()
	return
	
def query16():
	#estrai la classe a cui appartengono meno ballerini.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	try:
		c.execute("""
		select C.Nome
		from Classe as C join Ballerino as B on C.Nome = B.Classe
		group by C.Nome
		having count(*) =
		(
			select min(c)
			from (
				select count(*) as c
				from Classe as C join Ballerino as B on C.Nome = B.Classe
				group by C.Nome
				)
		)
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	print_result(c, "Non esiste nessun ballerino")
	
	conn.close()
	return
	
def query17():
	#estrarre il nome dei gruppi composti solo da ballerini dello stesso sesso.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	try:
		c.execute("""
		select Gruppo.Nome
		from Gruppo join ComposizioneG as CG on Gruppo.Numero = CG.Gruppo
		group by Gruppo.Nome
		having count(*) = 
		(
			select count(*)
			from Ballerino as B join ComposizioneG as CG on B.Codice = CG.Ballerino
			where B.Sesso = 'Maschio' and CG.Gruppo = Gruppo.Numero
		)
		or 
		count (*) =
		(
			select count(*)
			from Ballerino as B join ComposizioneG as CG on B.Codice = CG.Ballerino
			where B.Sesso = 'Femmina' and CG.Gruppo = Gruppo.Numero
		)
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	print_result(c, "Non esiste nessun gruppo composto da ballerini dello stesso sesso")
	
	conn.close()
	return
	
def query18():
	#estrai nomi dei ballerini ed il numero di gruppi a cui partecipano, se quest’ultimo è maggiore di 1.
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	try:
		c.execute("""
		select B.Nome, B.Cognome, count(*) as Num
		from Ballerino as B join ComposizioneG as CG on B.Codice = CG.Ballerino
		group by B.Codice
		having 1 < count(*)
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	print_result(c, "Non esiste nessun gruppo composto da ballerini dello stesso sesso")
	
	conn.close()
	return
	
def query19():
	#generazione classifica
	conn = sqlite3.connect('salsa_championship.db')
	c = conn.cursor()
	classe = input("Inserisci la classe della classifica: ")
	categoria = input("Inserisci la categoria della classifica: ")
	disciplina = input("Inserisci la disciplina della classifica: ")
	
	#controlliamo che ogni partecipante alla finale abbia 6 giudizi
	#per prima cosa dobbiamo sapere quanti concorrenti hanno partecipato 
	try:
		c.execute("""
		SELECT count(*)
		FROM Match as M join PartecipazioneC as PC on M.ID = PC.Match
		WHERE M.Classe = """+"\""+classe+"\" and M.Categoria = \""+categoria+"\" and M.Disciplina = \""+disciplina+"\" and M.Round = \"Finale\""+"""
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
		
	c_f = c.fetchall()[0][0]
	if (c_f == 0):
		print("\n\nErrore. Nessun concorrente ha partecipato alla finale di questo match")
		return
	
	#a questo punto controlliamo che il numero dei giudizi sia uguale al numero dei partecipanti*6
	try:
		c.execute("""
		SELECT count(*)
		FROM Match as M join PartecipazioneC as PC on M.ID = PC.Match
		     join Giudizio as G on G.PartecipazioneC = PC.Concorrente and M.ID = G.MatchC
		WHERE M.Classe = """+"\""+classe+"\" and M.Categoria = \""+categoria+"\" and M.Disciplina = \""+disciplina+"\" and M.Round = \"Finale\""+"""
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	n_g = c.fetchall()[0][0]
	
	if(n_g != (c_f*6)):
		print("\n\nMancano uno o più giudizi, assicurarsi di inserirli prima di generare la classifica.")
		return
	
	
		
	#recupero l'id della classifica
	try:
		c.execute("""
		SELECT ID
		FROM Classifica as M
		WHERE M.Classe = """+"\""+classe+"\" and M.Categoria = \""+categoria+"\" and M.Disciplina = \""+disciplina+"\""+"""
		""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	classifica = c.fetchall()[0][0]
	
	#calcolo per ogni concorrente, la media dei giudizi
	try:
		c.execute("""
			SELECT PC.Concorrente, avg(G.Posizione) as Media
			FROM Match as M join PartecipazioneC as PC on M.ID = PC.Match
			join Giudizio as G on G.PartecipazioneC = PC.Concorrente
			WHERE M.Classe = """+"\""+classe+"\" and M.Categoria = \""+categoria+"\" and M.Disciplina = \""+disciplina+"\" and M.Round = \"Finale\""+"""
			GROUP BY PC.Concorrente
			ORDER BY avg(G.Posizione)
			""")
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
	
	cm = c.fetchall()
	piazzamento = 1
	li = []
	li.append((cm[0][0], classifica, piazzamento))
	for i in range (1,len(cm)):
		if(cm[i][1] != cm[i-1][1]):
			piazzamento += 1
		li.append((cm[i][0], classifica, piazzamento))
			
	#a questo punto non ci resta che fare l'insert
	try:
		c.executemany("""
		INSERT INTO Piazzamento
		VALUES (?, ?, ?)
		""", li)
		conn.commit()
	except sqlite3.Error as er:
		print('SQLite error: %s' % (' '.join(er.args)))
		conn.close()
		return
		
	print("\n\nTutti i piazzamenti sono stati inseriti con successo.")
		
	
	conn.close()
	return
	
	
	
