;/////// ************************************************************ //////////////////////////////
;/////// вставка текста после сущ текстом                             //////////////////////////////
;/////// ************************************************************ //////////////////////////////

(defun c:901-ins-after-exist-txt

( / basictxt chosenbasictxt countchosenbasictxt currentdatabasictxt databasictxt datachosentxtforinsert intermediatedatabasictxt 
intermediatedatanewtxt intermediatedatatxt newtxt numchosenbasictxt txtforinsert type-obj)

(while (/= 
	(setq txtforinsert 
		(cond 
			((car (entsel "\n¬ыберите текст дл€ вставки\n")));=
			((getstring "¬ведите текст"));=
		);cond
	);setq 
	nil);услови€ дл€ while

	(if (= txtforinsert "") (exit))
	
	(setq type-obj (type txtforinsert));setq
	
	(if (= type-obj 'ENAME)
		(setq	datachosentxtforinsert (entget txtforinsert)	; извлекаем данные текста
					intermediatedatatxt (assoc 1 datachosentxtforinsert)
					txtforinsert (cdr intermediatedatatxt)
		);setq
	);if

	; указываем данные текста, к которому будем добавл€ть спереди текст дл€ вставки
	(prompt "\n¬ыберите в какой текст добавл€ть\n")
	(setq	chosenbasictxt			(ssget '((0 . "*text")))
				countchosenbasictxt	(sslength chosenbasictxt)
	) ;конец setq

	(setq numchosenbasictxt 0) ;конец setq

	(repeat	countchosenbasictxt
		(setq	currentdatabasictxt (ssname chosenbasictxt numchosenbasictxt)
					databasictxt (entget currentdatabasictxt)
					intermediatedatabasictxt (assoc 1 databasictxt)
					basictxt (cdr intermediatedatabasictxt)
		) ;конец setq

		(setq	newtxt (strcat basictxt txtforinsert)	; модифицируем основной текст
					intermediatedatanewtxt (cons 1 newtxt)
					databasictxt (subst	intermediatedatanewtxt intermediatedatabasictxt databasictxt)
		) ;конец setq
		(entmod databasictxt)
		(setq numchosenbasictxt (+ 1 numchosenbasictxt)) ;счетчик цикла
	);repeat
);while

(princ) ; тихий выход
)
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////