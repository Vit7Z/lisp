;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ведомость основных комплектов рабочих чертежей               ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:02-working-drawings-main-set-01-ins-by-sheets

( / adoc counter counter-1 crnt-block crnt-pnt dlt-y len-of-set list-901 list-pnt name-block-for-del name-crnt-block num-1 num-2 obj-01 pnt-1 pnt-2 pnt-crnt-block 
pnt-ins pnt-l1 pnt-r1 pos-blank set-blocks str-01 str-01-len str-01-obj str-01-right str-01-tbox str-02 str-03 str-11 str-901 str-tmp swtch sym-1 sym-2 sym-3 sym-tmp 
x-crnt-pnt y-crnt-pnt)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(setvar	"cmdecho" 0)
(setvar "textstyle" "standard")
(setvar "osmode" 6199)

(if (= (tblsearch "block" "вед-рч-осн-компл-строка" ) nil)
  (progn
    (load "d:\\yandexdisk\\my-sprt\\02-design\\02-working-drawings-main-set-05-set-empty-line.lsp") 
    (02-working-drawings-main-set-05-set-empty-line) ;;;;;;;вед-рч-осн-компл-строка
  );progn
);if

;//////////////////////////////////////////////////////////////////////////////////////////////
;формируем нобор и оставляем в нем только объекты форматов
(setq pnt-1 (getpoint "\nУкажите лев верхн точку листов")
			pnt-2 (getpoint "\nУкажите нижн прав точку листов")
			
			set-blocks (ssget "_W" pnt-1 pnt-2 '((0 . "INSERT")))
			len-of-set (sslength set-blocks)
			counter 0
);setq

(setvar "osmode" 0)

;формируем набор и оставляем в нем только блоки штампов
(repeat len-of-set
	(setq	crnt-block (entget (ssname set-blocks counter))
				name-block-for-del (ssname set-blocks counter)
				name-crnt-block (cdr (assoc 2 crnt-block))
				swtch 1
	);setq
			
	(cond
		((wcmatch name-crnt-block "штамп-55мм-спдс-@@") (setq swtch 2));=
				
		((wcmatch name-crnt-block "штамп-55мм-спдс-@@-#") (setq swtch 2));=
				
		((wcmatch name-crnt-block "штамп-55мм-спдс-@@-##") (setq swtch 2));=
				
		((wcmatch name-crnt-block "штамп-55мм-спдс-@@@") (setq swtch 2));=
				
		((wcmatch name-crnt-block "штамп-55мм-спдс-@@@-#") (setq swtch 2));=
				
		((wcmatch name-crnt-block "штамп-55мм-спдс-@@@-##") (setq swtch 2));=
				
		((wcmatch name-crnt-block "штамп-55мм-спдс-@@@@") (setq swtch 2));=
				
		((wcmatch name-crnt-block "штамп-55мм-спдс-@@@@-#") (setq swtch 2));=
				
		((wcmatch name-crnt-block "штамп-55мм-спдс-@@@@-##") (setq swtch 2));=
	);cond
			
	(if (= swtch 1)
		(setq set-blocks (ssdel name-block-for-del set-blocks)
			   counter (- counter 1)
		);setq
	);if
		
	(setq counter (+ counter 1));setq
);repeat

;создаем списки по икс и игрек
(setq	len-of-set (sslength set-blocks)
			counter 0
			list-pnt (list "")	  
);setq
		
(repeat len-of-set
	(setq	crnt-block (entget (ssname set-blocks counter))
				name-crnt-block (cdr (assoc 2 crnt-block))
				pnt-crnt-block (cdr (assoc 10 crnt-block))
			
				list-pnt (vl-list* pnt-crnt-block list-pnt)
						
				counter (+ counter 1)
	);setq
);repeat
		
(setq list-pnt (vl-remove "" list-pnt));setq
		
;сортируем по возрастанию х
(setq list-pnt (vl-sort list-pnt (function (lambda (num-1 num-2) (< (nth 0 num-1) (nth 0 num-2))))));setq
		
;сортируем по убыванию y
(setq list-pnt (vl-sort list-pnt (function (lambda (num-1 num-2) (> (nth 1 num-1) (nth 1 num-2))))));setq

;;список 901: 
;поле 1 - наименование листа str-01;
;поле 11 - кол. строк по 138мм; 
;поле 2 - номера листов str-02; 
;поле 3 - кол. листов str-03
(setq list-901 nil
			counter 0
);setq

;извлекаем данные из штампа листов и создаем список 901
(repeat (length list-pnt)
	(setq crnt-pnt (nth counter list-pnt)
				x-crnt-pnt (nth 0 crnt-pnt)
				y-crnt-pnt (nth 1 crnt-pnt)
	);setq
		
	(setq pnt-r1 (list (- x-crnt-pnt 50) (+ y-crnt-pnt 15));точки секущей линии
				pnt-l1 (list (- x-crnt-pnt 120) (+ y-crnt-pnt 0))															
				obj-01 (ssget "_F" (list pnt-l1 pnt-r1) '((0 . "*TEXT")));название листа
	);setq
																
	(if (/= obj-01 nil)
		(setq str-01 (cdr (assoc 1 (entget (ssname obj-01 0)))));setq
	);if
								
	(setq counter-1 0
				sym-tmp ""
	);setq
			 					
	;убираем перенос строки "\P". на выходе - sym-tmp
	(repeat (strlen str-01)
		(setq	sym-1 (ascii (substr str-01 (+ counter-1 1) 1))
				  sym-2 (ascii (substr str-01 (+ counter-1 2) 1))											
					counter-1 (+ counter-1 1)
		);setq
																		
		(if (and (= sym-1 92) (= sym-2 80))
			(setq counter-1 (+ counter-1 1));setq
		);if
									
		(if (and (/= sym-1 92) (/= sym-2 80))
			(setq sym-tmp (strcat sym-tmp (chr sym-1)));setq
		);if
	);repeat

	;добавляем пробел после ".", вслучае некорректной модификации на выходе - sym-tmp
	(setq counter-1 0);setq
	
	(repeat (- (strlen sym-tmp) 3)
		(setq	sym-1 (substr sym-tmp (+ counter-1 1) 1)
					sym-2 (substr sym-tmp (+ counter-1 2) 1)
					sym-3 (substr sym-tmp (+ counter-1 3) 1)
					counter-1 (+ counter-1 1)
		);setq
		
		(if (= sym-2 ".")
			(progn
				(if (and (wcmatch sym-1 "#") (wcmatch sym-3 "@"))
					(setq sym-tmp (vl-string-subst ". " "." sym-tmp counter-1));setq
				);if
				
				(if (and (wcmatch sym-1 "@") (wcmatch sym-3 "@"))
					(setq sym-tmp (vl-string-subst ". " "." sym-tmp counter-1));setq
				);if
			);progn
		);if
	);repeat

	(setq sym-tmp (vl-string-subst " " "  " sym-tmp)
				sym-tmp (vl-string-subst " " "  " sym-tmp)
				sym-tmp (vl-string-subst " " "  " sym-tmp)
				str-01 sym-tmp
	);setq

	
	;вычисляем длину строки наименования листа
	(setq str-01-obj (list (cons 1 str-01) '(0 . "TEXT") '(40 . 2.5) '(41 . 1))
				str-01-tbox (textbox str-01-obj)
				str-11 (- (car (nth 1 str-01-tbox)) (car (nth 0 str-01-tbox)));
				str-11 (+ (fix (/ str-11 138)) 1);длина текста
	);setq
	
	;номер листа
	(setq pnt-r1 (list (- x-crnt-pnt 20) (+ y-crnt-pnt 15));точки секущей линии
				pnt-l1 (list (- x-crnt-pnt 35) (+ y-crnt-pnt 25))															
				obj-01 (ssget "_F" (list pnt-l1 pnt-r1) '((0 . "*TEXT")))
	);setq
																
	(if (/= obj-01 nil)
		(setq str-02 (cdr (assoc 1 (entget (ssname obj-01 0)))));setq
	);if

	;количество страниц
	(setq pnt-r1 (list (- x-crnt-pnt 0) (+ y-crnt-pnt 15));точки секущей линии
				pnt-l1 (list (- x-crnt-pnt 20) (+ y-crnt-pnt 25))															
				obj-01 (ssget "_F" (list pnt-l1 pnt-r1) '((0 . "*TEXT")))
	);setq
																
	(if (/= obj-01 nil)
		(progn
			(setq str-03 (cdr (assoc 1 (entget (ssname obj-01 0)))));setq
			
			(if (= (atoi str-03) 2)
				(setq str-02 (strcat str-02 ", " (itoa (+ (atoi str-02) 1)))
							str-03 (strcat str-03 " листа")
				);setq
			);if
			
			(if (or (= (atoi str-03) 3) (= (atoi str-03) 4)
							(= (atoi str-03) 22) (= (atoi str-03) 23) (= (atoi str-03) 24)
							(= (atoi str-03) 32) (= (atoi str-03) 33) (= (atoi str-03) 34)
							(= (atoi str-03) 42) (= (atoi str-03) 43) (= (atoi str-03) 44)
							(= (atoi str-03) 52) (= (atoi str-03) 53) (= (atoi str-03) 54)
					);or
				(setq str-02 (strcat str-02 "..." (itoa (- (+ (atoi str-02) (atoi str-03)) 1)))
							str-03 (strcat str-03 " листа")
				);setq
			);if
			
			(if (or (and (> (atoi str-03) 4) (< (atoi str-03) 21))
							(and (> (atoi str-03) 25) (< (atoi str-03) 31))
							(and (> (atoi str-03) 35) (< (atoi str-03) 41))
							(and (> (atoi str-03) 45) (< (atoi str-03) 51))
							(and (> (atoi str-03) 55) (< (atoi str-03) 61))
					);or
				(setq str-02 (strcat str-02 "..." (itoa (- (+ (atoi str-02) (atoi str-03)) 1)))
							str-03 (strcat str-03 " листов")
				);setq
			);if
			
			(if (or (= (atoi str-03) 21) (= (atoi str-03) 31) (= (atoi str-03) 41) (= (atoi str-03) 51) (= (atoi str-03) 61))
				(setq str-02 (strcat str-02 "..." (itoa (- (+ (atoi str-02) (atoi str-03)) 1)))
							str-03 (strcat str-03 " лист")
				);setq
			);if
		);progn
		
		(setq str-03 0);setq
	);if

	(if (/= list-901 nil)
		(setq list-901 (reverse list-901));setq
	);if
	
	(setq str-901 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 11 str-11))
				list-901 (vl-list* str-901 list-901)
				list-901 (reverse list-901)
				str-901 nil
				counter (+ counter 1)
	);setq
);repeat
								
(setvar	"OSMODE" 6199) 
		
(setq pnt-ins (getpoint "\nУкажите точку вставки строк\n")
			x-crnt-pnt (nth 0 pnt-ins)
			y-crnt-pnt (nth 1 pnt-ins)
			dlt-y 0
			counter 0
			len-of-set 0
);setq

(setvar	"OSMODE" 0) 

;;;;;;;удаляем существующие записи
(repeat (length list-901)
	(setq str-tmp (nth counter list-901)
				str-11 (cdr (assoc 11 str-tmp))
				len-of-set (+ len-of-set str-11)
				counter (+ 1 counter);setq
	);setq
);repeat

(repeat len-of-set
	(setq set-blocks (ssget "_c" (list (- x-crnt-pnt 14) (- (- y-crnt-pnt dlt-y) 3)) (list (+ x-crnt-pnt 169) (- (- y-crnt-pnt dlt-y) 5))));setq
	(if (/= set-blocks nil) 
		(command "_erase" set-blocks "")
	);if
	(setq dlt-y (+ dlt-y 8));setq
);repeat

;;;;;;;печатаем все
(setq counter 0);setq

(repeat (length list-901)
	(setq str-tmp (nth counter list-901)
				str-01 (cdr (assoc 1 str-tmp))		
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-11 (cdr (assoc 11 str-tmp))
				dlt-y 0
	);setq
						
	(command "_text" "_MC" (list (- x-crnt-pnt 7.5) (- y-crnt-pnt 4)) 2.5 0 str-02)
	
	(if (/= str-03 0)
		(command "_text" "_ML" (list (+ x-crnt-pnt 141) (- y-crnt-pnt 4)) 2.5 0 str-03)
	);if
	
	(repeat str-11
		(command "_insert" "вед-рч-осн-компл-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-crnt-pnt (- y-crnt-pnt dlt-y)))
		(setq dlt-y (+ dlt-y 8));setq
	);repeat
	
	(setq counter-1 1);setq
	
	;/////////////////
	(if (= str-11 1)
		(command "_text" "_ML" (list (+ x-crnt-pnt 1) (- y-crnt-pnt 4)) 2.5 0 str-01)
	);if

	;/////////////////
	(if (= str-11 2)
		(progn
			(while (< str-01-len 138)	
				(setq str-tmp (substr str-01 1 counter-1)
							str-01-obj (list (cons 1 str-tmp) '(0 . "TEXT") '(40 . 2.5) '(41 . 1))
							str-01-tbox (textbox str-01-obj)
							str-01-len (- (car (nth 1 str-01-tbox)) (car (nth 0 str-01-tbox)));
							sym-tmp (substr str-01 counter-1 1)
				);setq
				
				(if (= sym-tmp " ")
					(setq pos-blank counter-1)
				);if
				
				(setq counter-1 (+ 1 counter-1));setq
			);while
	
			(setq str-tmp (substr str-01 1 pos-blank);отсекаем по пробел слева
						str-01-right (substr str-01 (+ 1 pos-blank));убираем пробел слева в правой части текста
						str-01 str-01-right
			);setq
	
			(command "_text" "_ML" (list (+ x-crnt-pnt 1) (- y-crnt-pnt 4)) 2.5 0 str-tmp)	
			(command "_text" "_ML" (list (+ x-crnt-pnt 1) (- y-crnt-pnt 12)) 2.5 0 str-01-right)	
		);progn
	);if
	
	;/////////////////
	(if (> str-11 2)
		(alert "Больше двух строк. Не обработано.")
	);if
	
	(setq counter (+ 1 counter)
				y-crnt-pnt (- y-crnt-pnt (* 8 str-11))
	);setq
);repeat



(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
