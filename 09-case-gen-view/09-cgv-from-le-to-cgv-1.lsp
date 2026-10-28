;/////// ************************************************************ //////////////////////////////////////////////////
;/////// ѕоз. ѕЁ --> ќбозн. ѕЁќ¬Ў                                     //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////
(defun c:09-cgv-from-le-to-cgv-1

( / adoc align-h box-txt counter current-primitive current-txt len-current-txt length-set-txt len-txt lst-txt-60 
lst-txt-64 lst-txt-name lst-txt-position nmbr-ln pnt-bot pnt-top pnt-txt pos-blank set-primitive-txt txt txt-position 
txt-q xp1-box-txt xp2-box-txt x-pnt-bot x-pnt-top x-pnt-txt y-pnt-bot y-pnt-top y-pnt-txt)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))) ;undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(while (/= nil (setq pnt-top (getpoint "\n”кажите верхнюю точку справа от ѕоз.\n")))
	(setq pnt-bot (getpoint "\n”кажите нижнюю точку слева от ѕоз.\n")
				x-pnt-top (nth 0 pnt-top)
				y-pnt-top (nth 1 pnt-top)
				x-pnt-bot (nth 0 pnt-bot)
				y-pnt-bot (nth 1 pnt-bot)
	);setq
		
	(setq txt nil
				current-txt nil
				txt-position nil
				lst-txt-position nil
				lst-txt-60 nil
				lst-txt-64 nil
				lst-txt-name nil
				current-primitive nil
	);setq

	;обрабатываем графу "ѕќ«»÷»ќЌЌќ≈ ќЅќ«Ќј„≈Ќ»≈"
	(setq pnt-top (list (- x-pnt-top 0.2) (- y-pnt-top 0.2)) ;точки секущей линии
				pnt-bot (list (+ x-pnt-bot 0.2) (+ y-pnt-bot 0.2))
	);setq
	
	(setvar "osmode" 0)
	
	;создаем набор позиционных обозначений
	(setq	set-primitive-txt (ssget "_c" pnt-top pnt-bot '((0 . "*TEXT"))));setq
	
	(if (/= set-primitive-txt nil)
	  (09-cgv-from-le-to-cgv-1-get-lst-txt-60 set-primitive-txt)
	);if
	
	;обрабатываем графу "Ќј»ћ≈Ќќ¬јЌ»≈"//////////////////////////////////////////////////////////////////////////
	(setq pnt-top (list (+ x-pnt-top 109.8) (- y-pnt-top 0.2)) ;точки секущей линии
				pnt-bot (list (+ x-pnt-top 0.2) (+ y-pnt-bot 0.2))
	);setq
	
	(setq	set-primitive-txt (ssget "_c" pnt-top pnt-bot '((0 . "*TEXT")));создаем набор позиционных обозначений
	      txt-position ""
				counter (1- (sslength set-primitive-txt))
	);setq
	
	;формируем строку с наименовани€ми, строки объедин€ем через пробел
	(repeat	(sslength set-primitive-txt)
		(setq	current-primitive	(ssname set-primitive-txt counter)
					current-txt (cdr (assoc 1 (entget current-primitive))) ; получаем текст
					
					txt-position (strcat txt-position " " current-txt)
					counter (1- counter)
		);setq
	);repeat

	;формируем список из слов графи наименование
	(while (vl-string-search " " txt-position 0)
	  (setq pos-blank (vl-string-search " " txt-position 0);находим позицию пробела
			    current-txt (vl-string-right-trim " " (substr txt-position 1 (+ 1 pos-blank)));отсеченна€ часть текста, убираем пробел справа
	  			txt-position (vl-string-left-trim " " (substr txt-position (+ 1 pos-blank)));права€ часть текста (после отсекани€), убираем пробел слева в правой части текста
    );setq
    	
		(if (/= current-txt "")
		  (setq lst-txt-name (vl-list* current-txt lst-txt-name));setq
		);if
	);while

	(setq	lst-txt-name (reverse (vl-list* txt-position lst-txt-name))
				counter 0
				len-txt 0
				len-current-txt 0
				txt ""
				length-set-txt (length lst-txt-name)
	);setq

	(repeat length-set-txt
		(setq current-txt (nth counter lst-txt-name));setq
		
		(setq	box-txt (textbox (list (cons 1 current-txt) (cons 40 2.5) (cons 50 0) (cons 41 1)));textbox
					xp1-box-txt (car (nth 0 box-txt)); х, лева€ нижн€€ точка
					xp2-box-txt (car (nth 1 box-txt)); х, права€ верхн€€ точка
					len-current-txt (- xp2-box-txt xp1-box-txt);длина текста
		);setq
		
		(setq	box-txt (textbox (list (cons 1 (strcat txt " " current-txt)) (cons 40 2.5) (cons 50 0) (cons 41 1)));textbox
					xp1-box-txt (car (nth 0 box-txt)); х, лева€ нижн€€ точка
					xp2-box-txt (car (nth 1 box-txt)); х, права€ верхн€€ точка
					len-txt (- xp2-box-txt xp1-box-txt);длина текста
		);setq
		
		(if (and (< len-txt 63) (< counter length-set-txt))
			(setq txt (vl-string-left-trim " " (strcat txt " " current-txt)));setq
		);if
		
		(if (and (< len-txt 63) (= (+ counter 1) length-set-txt))
			(setq current-txt txt);setq
		);if
		
		(if (and (> len-txt 63) (< counter length-set-txt))
			(setq lst-txt-64 (vl-list* txt lst-txt-64)
						len-txt 0
						txt current-txt
			);setq
		);if
		
		(setq	counter (+ counter 1));
	);repeat

	(setq lst-txt-64 (reverse (vl-list* current-txt lst-txt-64)));setq, список из строк, длина каждой не более 64мм

	;закончили обработку строк графы "Ќј»ћ≈Ќќ¬јЌ»≈"/////////////////////////////////////////////////////////////


	;обрабатываем графу " ќЋ»„≈—“¬ќ"
	(setq pnt-top (list (+ x-pnt-top 119.8) (- y-pnt-top 0.2)) ;точки секущей линии
				pnt-bot (list (+ x-pnt-top 110.2) (- y-pnt-top 7.8))
				txt-q (ssget "_c" pnt-top pnt-bot '((0 . "*TEXT")));ssget
				txt-q (entget (ssname txt-q 0))
				txt-q (list (cdr (assoc 1 txt-q)))
	);setq
	;/////////////////////////////////////////////////////////////
	
	
	;;;;;;; стриаем существующее ///////////////////////////////////////////////////////////////////////////////
	(setvar "osmode" 6199)
	(setq	pnt-top (getpoint "\n”кажите точку 1\n")
				pnt-bot (getpoint "\n”кажите точку 2\n")
				
				x-pnt-top (nth 0 pnt-top)
				y-pnt-top (nth 1 pnt-top)
				x-pnt-bot (nth 0 pnt-bot)
				y-pnt-bot (nth 1 pnt-bot)
				
				pnt-top (list (+ x-pnt-top 169) (- y-pnt-top 1));точки рамки
				pnt-bot (list (+ x-pnt-bot 1) (+ y-pnt-bot 1))
	);setq

	(setvar "osmode" 0)

	(setq	set-primitive-txt (ssget "_C" pnt-top pnt-bot '((0 . "*TEXT"))));setq

	(if (/= set-primitive-txt nil) (command "_erase" set-primitive-txt ""));if
  ;;;;;;; стираем существующие тексты на месте вставки
  
  ;;;;;;; координата Y всех верхних новых текство
  (setq y-pnt-txt (- y-pnt-top 4));setq
   
  
  (if (/= lst-txt-60 nil)
    (progn
      (setq x-pnt-txt (+ x-pnt-top 1)
            align-h 0      
      );setq
      (09-cgv-from-le-to-cgv-1-print-text lst-txt-60 x-pnt-txt y-pnt-txt align-h)
    );progn
  );if
  
  
  (setq x-pnt-txt (+ x-pnt-top 61)
        align-h 0
  );setq
  (09-cgv-from-le-to-cgv-1-print-text lst-txt-64 x-pnt-txt y-pnt-txt align-h)
 
 
	(setq x-pnt-txt (+ x-pnt-top 130)
	      align-h 1
	);setq
	(09-cgv-from-le-to-cgv-1-print-text txt-q x-pnt-txt y-pnt-txt align-h)
	
	
	(setq x-pnt-txt (- x-pnt-top 7.5)
	      align-h 1
	      txt-q (list "+++")
	);setq
	(09-cgv-from-le-to-cgv-1-print-text txt-q x-pnt-txt y-pnt-txt align-h)
	
	
	(setq nmbr-ln (max (length lst-txt-60) (length lst-txt-64)));setq

	(repeat (1+ nmbr-ln)
		(progn
			(setq pnt-top (list x-pnt-top y-pnt-top));setq
			(command "_insert" "овш-пэ-пуста€-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-top)			
			(setq y-pnt-top (- y-pnt-top 8));setq
		);progn
	);repeat

	(setvar "osmode" 6199)

	(setq x-pnt-top nil
				y-pnt-top nil
				x-pnt-bot nil
				y-pnt-bot nil
				lst-txt-name nil
				lst-txt-position nil
	);setq
);while

(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar "orthomode" 1)

(gc)
(princ)
)

;/////// ************************************************************ //////////////////////////////////////////////////
;///////  ќЌ≈÷                                                        //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////


;/////// ************************************************************ //////////////////////////////////////////////////
;/////// ‘”Ќ ÷»я  ќЅ–јЅќ“ ј ѕќ« ќЅќ«Ќј„≈Ќ»…                           //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////
(defun 09-cgv-from-le-to-cgv-1-get-lst-txt-60
	
(set-primitive-txt / box-txt counter current-txt len-current-txt length-set-txt len-txt lst-txt-position pos-blank 
txt txt-position xp1-box-txt xp2-box-txt)
	
(setq txt-position ""
			counter (1- (sslength set-primitive-txt))
);setq
	
;формируем строку с позиционными обозначени€ми, строки объедин€ем через пробел
(repeat	(sslength set-primitive-txt)
	(setq	current-txt (cdr (assoc 1 (entget (ssname set-primitive-txt counter))))
				txt-position (strcat txt-position " " current-txt)		
				counter (1- counter)
	);setq
);repeat

;формируем список из позиционных обозначений
(while (vl-string-search " " txt-position 0)
  (setq pos-blank (vl-string-search " " txt-position 0);находим позицию пробела
			  current-txt (vl-string-right-trim " " (substr txt-position 1 (+ 1 pos-blank)));отсеченна€часть текста, убираем пробел справа
	  		txt-position (vl-string-left-trim " " (substr txt-position (+ 1 pos-blank)));права€ часть текста (после отсекани€), убираем пробел слева в правой части текста
	  		txt-position (vl-string-right-trim " " txt-position)
  );setq
    	
	(if (/= current-txt "")
		(setq lst-txt-position (vl-list* current-txt lst-txt-position));setq
	);if
);while

(setq lst-txt-position (reverse (vl-list* txt-position lst-txt-position)));setq, список из текстов

(setq	counter 0
			len-txt 0
			len-current-txt 0
			txt ""
			length-set-txt (length lst-txt-position)
);setq

(repeat length-set-txt
  (setq	current-txt (nth counter lst-txt-position)
		    box-txt (textbox (list (cons 1 current-txt) (cons 40 2.5) (cons 50 0) (cons 41 1)));textbox
				xp1-box-txt (car (nth 0 box-txt)); х, лева€ нижн€€ точка
				xp2-box-txt (car (nth 1 box-txt)); х, права€ верхн€€ точка
				len-current-txt (- xp2-box-txt xp1-box-txt);длина текста
	);setq
		
	(setq	box-txt (textbox (list (cons 1 (strcat txt " " current-txt)) (cons 40 2.5) (cons 50 0) (cons 41 1)));textbox
				xp1-box-txt (car (nth 0 box-txt)); х, лева€ нижн€€ точка
				xp2-box-txt (car (nth 1 box-txt)); х, права€ верхн€€ точка
				len-txt (- xp2-box-txt xp1-box-txt);длина текста
	);setq
		
	(if (and (< len-txt 59) (< counter length-set-txt))
		(setq txt (vl-string-left-trim " " (strcat txt " " current-txt)));setq
	);if
		
	(if (and (< len-txt 59) (= (+ counter 1) length-set-txt))
		(setq current-txt txt);setq
	);if
		
	(if (and (> len-txt 59) (< counter length-set-txt))
		(setq lst-txt-60 (vl-list* txt lst-txt-60)
					len-txt 0
					txt current-txt
		);setq
	);if
		
	(setq	counter (+ counter 1));счетчик
);repeat

;список из строк, длина каждой не более 64мм
(setq lst-txt-60 (reverse (vl-list* current-txt lst-txt-60)));setq

)
;/////// ************************************************************ //////////////////////////////////////////////////
;///////  ќЌ≈÷ ‘”Ќ ÷»»                                                //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////


;/////// ************************************************************ //////////////////////////////////////////////////
;/////// ‘”Ќ ÷»я  ѕ≈„ј“№ “≈ —“ј                                       //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////
(defun 09-cgv-from-le-to-cgv-1-print-text
 
(lst-txt x-pnt y-pnt align-h / counter pnt-txt txt txt-1)
	
(setq counter 0
      pnt-txt (list x-pnt y-pnt)
);setq
 
(repeat (length lst-txt)
  (setq txt (nth counter lst-txt));setq
    (setq txt-1 
      (entmakex (list
			  '(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				(cons 10 pnt-txt);нач точка
				(cons 11 pnt-txt);нач точка
				(cons 1 txt);содержание
				'(40 . 2.5);высота
				(cons 41 1);раст€жение
				'(50 . 0);поворот
				(cons 72 align-h);гориз выравнивание
				'(73 . 2) ;верт выравнивание
				'(370 . -1) ;толщина
				(cons 7 "Standard");стиль
			);list
		);entmakex
	);setq
	
	(setq y-pnt (- y-pnt 8)
				pnt-txt (list x-pnt y-pnt)
				counter (+ counter 1)
	);setq
);repeat
)
;/////// ************************************************************ //////////////////////////////////////////////////
;///////  ќЌ≈÷ ‘”Ќ ÷»»                                                //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////