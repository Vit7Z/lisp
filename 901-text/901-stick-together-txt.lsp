;///////////////////////////////////// преобразование нескольких однострочных текстов //////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////// в один многострочный текст            ///////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:901-stick-together-txt

( / adoc align-h-txt align-w-txt append-lst-tpm counter-txt current-primitive current-txt data-primitive data-primitive-last height-txt lngth-list-doc lngth-set-txt 
lst-tpm number-last-primitive num-iter pnt-primitive-last pnt-txt-1 pnt-txt-zero primitive-last primitive-zero set-primitive-txt txt txt-1 width-txt width-txt-current 
x-end-txt x-pnt-zero x-start-txt y-pnt-last y-pnt-zero)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);undo

(setvar "cmdecho" 0)

(prompt "\nВыберите текст\n") ; создаем набор

(setq	set-primitive-txt (ssget '((0 . "*text")))
			lngth-set-txt (sslength set-primitive-txt) ; количество элементов в наборе
			number-last-primitive (- lngth-set-txt 1)
			txt ""
			width-txt	0
			counter-txt 0
);setq

	;извлекаем данные первого примитива: высоту, точку вставки, применим для нового текста
	(setq	primitive-zero (ssname set-primitive-txt 0)
				height-txt (cdr (assoc 40 (entget primitive-zero))) ; высота	
				align-h-txt (cdr (assoc 72 (entget primitive-zero))) ; выравнивание горизонтальное
				align-w-txt (cdr (assoc 73 (entget primitive-zero))) ; выравнивание вертикальное
				pnt-txt-zero (cdr (assoc 10 (entget primitive-zero))) ; точка вставки
				x-pnt-zero (car pnt-txt-zero)
				y-pnt-zero (+ (car (cdr pnt-txt-zero)) height-txt)
	) ;setq

	;определяем верхнюю точку текста
	(setq	pnt-txt-1	(list x-pnt-zero y-pnt-zero));setq

	;извлекаем точку вставки последнего примитива
	(setq	primitive-last (ssname set-primitive-txt number-last-primitive)
				data-primitive-last (entget primitive-last)
				pnt-primitive-last (cdr (assoc 10 data-primitive-last))
				y-pnt-last (car (cdr pnt-primitive-last)) ; точка вставки
	);setq

	(repeat	lngth-set-txt
		(progn
			(setq	current-primitive	(ssname set-primitive-txt counter-txt)
						data-primitive (entget current-primitive) ; получаем данные текущего примитива текста
						current-txt (cdr (assoc 1 data-primitive)) ; получаем текст
						txt (strcat txt current-txt "\n") ; склеиваем в одну переменную
						width-txt-current	(cdr (assoc 41 data-primitive)) ; ширина
			);setq

	; находим длину, в случае text
			(if	(= width-txt-current 1)
				(setq	x-start-txt (car (car (textbox (entget current-primitive))))
							x-end-txt (car (car (cdr (textbox (entget current-primitive)))))
							width-txt-current	(+ (- x-end-txt x-start-txt) 2)
				) ;setq
			) ;if

	; устанавливаем наибольшую длину
			(if	(> width-txt-current width-txt)
				(setq	width-txt	width-txt-current);setq
			);if

			(setq	counter-txt (+ counter-txt 1) ;счетчик номера примитива
			);setq
			(command "_.erase" current-primitive "")
		);progn
	);repeat

;определение длины текстовой строки и опеределение необходимых полей
(setq lngth-list-doc (strlen txt)
			num-iter (fix (/ lngth-list-doc 700))
			lst-tpm nil
			append-lst-tpm (cons 3 txt)
);setq

(if (= 0 num-iter)
	(setq lst-tpm (list (cons 1 txt))
	);setq
);if

(if (> num-iter 0)
	(repeat num-iter
		(setq lst-tpm (vl-list* append-lst-tpm lst-tpm)
		);setq
		(setq append-lst-tpm (cons 3 txt)
					lst-tpm (reverse lst-tpm)
		);setq
	);repeat
);if

(setq lst-tpm (reverse lst-tpm)
);setq

(setq txt-1
  (entmake
    (vl-list*
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 pnt-txt-1) ; нач точка текста
      '(8 . "0")
       (cons 40 height-txt) ; высота текста
       (cons 41 width-txt) ; растяжение текста
      '(42 . 180) ; ширина текста
      '(71 . 1) ; гориз выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
       lst-tpm
    );list
  ); entmakex
); setq

(vla-endundomark adoc)
(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(setvar "orthomode" 1)
(princ)
)
;///////////////////////////////////// конец программы    //////////////////////////
