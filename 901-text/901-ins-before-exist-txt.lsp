;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// вставка текста перед сущ текстом                             //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////

(defun c:901-ins-before-exist-txt

( / basictxt chosenbasictxt countchosenbasictxt currentdatabasictxt databasictxt datachosentxtforinsert intermediatedatabasictxt 
intermediatedatanewtxt intermediatedatatxt newtxt numchosenbasictxt txtforinsert type-obj)

(while (/= 
	(setq txtforinsert 
		(cond 
			((car (entsel "\n¬ыберите текст дл€ вставки\n")));=
			((getstring "¬ведите текст"));=
		);cond
	);setq 
	nil);конец услови€ дл€ while

	(if (= txtforinsert "") (exit))
	
	(setq type-obj (type txtforinsert));setq
	
	(if (= type-obj 'ENAME)
		(setq	datachosentxtforinsert (entget txtforinsert);извлекаем данные текста
					intermediatedatatxt (assoc 1 datachosentxtforinsert)
					txtforinsert (cdr intermediatedatatxt)
		);setq
	);if

	; указываем данные текста, к которому будем добавл€ть спереди текст дл€ вставки
	(prompt "\n¬ыберите в какой текст добавл€ть\n")
	
	(setq	chosenbasictxt			(ssget '((0 . "*text")))
				countchosenbasictxt	(sslength chosenbasictxt)
				numchosenbasictxt 0
	);setq

	(repeat	countchosenbasictxt

		(setq	currentdatabasictxt (ssname chosenbasictxt numchosenbasictxt)
					databasictxt (entget currentdatabasictxt)
					intermediatedatabasictxt (assoc 1 databasictxt)
					basictxt (cdr intermediatedatabasictxt)
		);setq

		(setq	newtxt (strcat txtforinsert basictxt)	; модифицируем основной текст
					intermediatedatanewtxt (cons 1 newtxt)
					databasictxt (subst	intermediatedatanewtxt intermediatedatabasictxt databasictxt)
		);setq
		
		(entmod databasictxt)
		
		(setq numchosenbasictxt (+ 1 numchosenbasictxt)) ;счетчик цикла
	);repeat
);while


(princ) ; тихий выход
)
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////