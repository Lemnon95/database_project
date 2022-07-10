import sql

stay = "y";

while stay == "y":
	print ("""
	1.Inserisci un nuovo ballerino e relativa classe, categoria e scuola di ballo.
	2.Inserisci una nuova scuola di ballo.
	3.Inserisci una nuova coppia.
	4.Inserici un nuovo giudizio.
	5.Trova il piazzamento di un concorrente in una classifica.
	6.Trova il numero dei ballerini appartenenti ad una scuola di ballo.
	7.Trova i dati di tutti i giudici di un certo match.
	8.Trova i dati di tutti i ballerini che compongono le coppie iscritte ad una disciplina.
	9.Trova nome, cognome e scuola di ballo dei ballerini di tutte le coppie arrivate in finale in una specifica classifica.
	10.Calcola la percentuale del numero di ballerini di una specifica classe, per scuola di ballo.
	11.Memorizza l'iscrizione di un gruppo ad una disciplina.
	12.Stampa tutti i dati di una disciplina di gruppo.
	13.Trova le scuole di ballo dove è massimo il numero di ballerini di una specifica classe.
	14.Estrai per ogni coppia, il loro numero ed il numero di discipline a cui sono iscritte, ma solo se sono iscritte ad almeno 2 discipline.
	15.Estrai Nome e Cognome dei giudici che hanno giudicato più match.
	16.Estrai la classe a cui appartengono meno ballerini.
	17.Estrai il nome dei gruppi composti solo da ballerini dello stesso sesso.
	18.Estrai nomi dei ballerini ed il numero di gruppi a cui partecipano, se quest’ultimo è maggiore di 1.
	19.Genera una specifica classifica.
	20.Esci dall'applicazione.
	""")
	ans = input("Scegli un'opzione: ")
	if ans == "1":
		sql.query1()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "2":
		sql.query2()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "3":
		sql.query3()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "4":
		sql.query4()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "5":
		sql.query5()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "6":
		sql.query6()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "7":
		sql.query7()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "8":
		sql.query8()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "9":
		sql.query9()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "10":
		sql.query10()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "11":
		sql.query11()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "12":
		sql.query12()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "13":
		sql.query13()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "14":
		sql.query14()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "15":
		sql.query15()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "16":
		sql.query16()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "17":
		sql.query17()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "18":
		sql.query18()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "19":
		sql.query19()
		stay = input("\nVuoi tornare al menu? [y/any]\n")
	elif ans == "20":
		print("\nArrivederci!")
		stay = "no"
	elif ans != "":
		print("\nErrore, riprova.")
