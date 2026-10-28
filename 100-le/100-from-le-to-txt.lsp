;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// передача данных из ПЭ в txt                                  //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:100-from-le-to-txt

( / adoc cntr-1 counter-1 dlt-x dlt-y dwg-file-dir file-to-write flag-1 flag-2 flag-3 flag-4 line-counter list-902 name-file-dwg name-file-spcf number-lines pnt-bttm pnt-top str-txt tmp-note tmp-pos tmp-tech tmp-vol txt-str xpnt-01 xpnt-bttm xpnt-top ypnt-01 ypnt-bttm ypnt-top)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 1)
(setvar "osmode" 6199)

(setq line-counter 1 ;номер по порядку
);setq

(while (/= nil (setq pnt-top (getpoint "\nВыберите точку верх\n")))
	(setq	pnt-bttm (getpoint "\nВыберите точку низ\n")
	
				xpnt-top (nth 0 pnt-top)
				ypnt-top (nth 1 pnt-top)
				
				xpnt-bttm (nth 0 pnt-bttm)
				ypnt-bttm (nth 1 pnt-bttm)

				dlt-y (- ypnt-top ypnt-bttm)
				number-lines (fix (/ dlt-y 8))
				
				xpnt-01 xpnt-top
				ypnt-01 ypnt-top
				
				tmp-pos "" ;текст из строки "поз. обозначение"
				tmp-tech "" ;текст из строки "наименование"
				tmp-vol "" ;текст из строки "количество"
				tmp-note "" ;текст из строки "примечание"
				
				flag-1 nil
				flag-2 nil
				flag-3 nil
				flag-4 nil
				
				counter-1 0;количество повторений циклов
	);setq
	
	
	(repeat number-lines
	
		;;;;;;;сбор текста из графы "поз. обозначение" /////////////////////////
		(setq xpnt-01 xpnt-top
					dlt-x 20
		);setq

		(tmp-reading-data-from-graphs xpnt-01 ypnt-01 dlt-x)
		
		(if (/= txt-str nil)
			(setq tmp-pos (strcat tmp-pos " " txt-str)
						flag-1 1
			);setq
			(setq flag-1 nil);setq
		);if
		
				
		;;;;;;;сбор текста из графы "наименование" /////////////////////////
		(setq xpnt-01 (+ xpnt-top 110)
					dlt-x 110
		);setq
		
		(tmp-reading-data-from-graphs xpnt-01 ypnt-01 dlt-x)
		
		(if (/= txt-str nil)
			(setq tmp-tech (strcat tmp-tech " " txt-str)
						flag-2 1
			);setq
			(setq flag-2 nil);setq
		);if
		
		;;;;;;;сбор текста из графы "количество" /////////////////////////
		(setq xpnt-01 (+ xpnt-top 120)
					dlt-x 10
		);setq
		
		(tmp-reading-data-from-graphs xpnt-01 ypnt-01 dlt-x)
		
		(if (/= txt-str nil)
			(setq tmp-vol txt-str
						flag-3 1
			);setq
			(setq flag-3 nil);setq
		);if
		
		;;;;;;;сбор текста из графы "примечание///////////////
		(setq xpnt-01 (+ xpnt-top 165)
					dlt-x 45
		);setq
		
		(tmp-reading-data-from-graphs xpnt-01 ypnt-01 dlt-x)
		
		(if (/= txt-str nil)
			(setq tmp-note (strcat tmp-note " " txt-str)
						flag-4 1
			);setq
			(setq flag-4 nil);setq
		);if
				
		(if (and (= flag-1 nil) (= flag-2 nil) (= flag-3 nil) (= flag-4 nil))
			(setq str-txt (list (strcat (itoa line-counter) ";" tmp-pos ";" tmp-tech ";" tmp-vol ";" tmp-note))
						list-902 (vl-list* str-txt list-902)
					
						tmp-pos ""
						tmp-tech ""
						tmp-vol ""
						tmp-note ""
				
						flag-1 nil
						flag-2 nil
						flag-3 nil
						flag-4 nil
					
						line-counter (+ line-counter 1)
			);setq
		);if
		
		(setq ypnt-01 (- ypnt-01 8)
					counter-1 (+ counter-1 1)
		);setq
	
		(if (and (= counter-1 number-lines)
						 (or (/= flag-1 nil) (/= flag-2 nil) (/= flag-3 nil) (/= flag-4 nil)));and
			(setq str-txt (list (strcat (itoa line-counter) ";" tmp-pos ";" tmp-tech ";" tmp-vol ";" tmp-note))
						list-902 (vl-list* str-txt list-902)
					
						tmp-pos ""
						tmp-tech ""
						tmp-vol ""
						tmp-note ""
				
						flag-1 nil
						flag-2 nil
						flag-3 nil
						flag-4 nil
						
						line-counter (+ line-counter 1)
			);setq
		);if
	);repeat
);while

(setq list-902 (reverse list-902));setq

(setq name-file-dwg (vl-string-right-trim ".dwg" (getvar "dwgname"))
			dwg-file-dir (getvar "dwgprefix")
			name-file-spcf (strcat name-file-dwg " list of elements")
);setq

(setq file-to-write (open (strcat dwg-file-dir name-file-spcf ".txt") "w"));setq
	
(write-line (strcat "№ п/п;Позиция;Наименование и техническая характеристика;"
										"Количество;"
										"Примечание") file-to-write)
	
(write-line "1;2;3;4;5" file-to-write)

(setq cntr-1 0)

(repeat (length list-902)
	(setq str-txt (car (nth cntr-1 list-902)));setq
	
	(write-line str-txt file-to-write)
	
	(write-line "" file-to-write)
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(close file-to-write)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////



;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// чтение данных из графы                                       ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-reading-data-from-graphs

(xpnt-01 ypnt-01 dlt-x / data-primitive line-sec pnt-1 pnt-2 txt-primitive)

(setvar "osmode" 0)

;;;;;;;извлекаем текст строки в графе
(setq ypnt-01 (- ypnt-01 4)

			pnt-1 (list xpnt-01 ypnt-01) ;точки рамки
			pnt-2 (list (- xpnt-01 dlt-x) ypnt-01)
			
			line-sec (list pnt-1 pnt-2)
			txt-primitive (ssget "_F" line-sec '((0 . "*TEXT")))
			txt-str nil
);setq
	
(if (/= txt-primitive nil)
	(setq data-primitive (entget (ssname txt-primitive 0))
				txt-str (cdr (assoc 1 data-primitive))
				txt-str (vl-string-right-trim " " txt-str)
				txt-str (vl-string-left-trim " " txt-str)
	);setq
);if

(setvar "osmode" 6199)

(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
