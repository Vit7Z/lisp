;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// передача данных из ОВШ в файл                                //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:09-cgv-from-cgv-to-txt

( / adoc cntr-1 counter-line cur-date cur-day cur-hrs cur-min cur-month cur-year data-primitive dlt-x dlt-y dwg-file-dir file-to-write 
line-sec list-902 list-txt name-file-dwg number-lines pnt-1 pnt-2 pnt-bttm pnt-top str-01 str-02 str-03 str-04 str-05 str-06 str-txt 
tmp-str-01 tmp-str-02 tmp-str-03 tmp-str-04 tmp-str-05 tmp-str-06 txt txt-primitive xpnt-01 xpnt-bttm xpnt-top ypnt-01 ypnt-bttm ypnt-top)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 1)
(setvar "osmode" 6199)

(setq counter-line 0
			str-01 ""
			str-02 ""
			str-03 ""
			str-04 ""
			str-05 ""
			str-06 ""
);setq

(while (/= nil (setq pnt-top (getpoint "\nВыберите точку верх\n")))
	
	(setq	pnt-bttm (getpoint "\nВыберите точку низ\n")
	
				xpnt-top (nth 0 pnt-top)
				ypnt-top (nth 1 pnt-top)
				
				xpnt-bttm (nth 0 pnt-bttm)
				ypnt-bttm (nth 1 pnt-bttm)

				dlt-y (- ypnt-top ypnt-bttm)
				number-lines (fix (/ dlt-y 8))
	);setq
	
	(repeat number-lines
		;;;;;;;сбор из графы ПОЗ/////////////////////////////////////////////////////
		(setq xpnt-01 xpnt-top
					ypnt-01 ypnt-top
					dlt-x 15
		);setq
	
		(get-data-from-graphs-09-cgv-from-cgv-to-txt xpnt-01 ypnt-01 dlt-x)
		
		(if (or (/= list-txt nil) (/= list-txt ""))
			(setq tmp-str-01 list-txt);setq
		);if
		
		;;;;;;;сбор из графы ОБОЗНАЧЕНИЕ/////////////////////////////////////////////////////
		(setq xpnt-01 (+ xpnt-top 60)
					ypnt-01 ypnt-top
					dlt-x 60
		);setq
	
		(get-data-from-graphs-09-cgv-from-cgv-to-txt xpnt-01 ypnt-01 dlt-x)
	
		(if (or (/= list-txt nil) (/= list-txt ""))
			(setq tmp-str-02 list-txt);setq
		);if
		
		;;;;;;;сбор из графы НАИМЕНОВАНИЕ/////////////////////////////////////////////////////
		(setq xpnt-01 (+ xpnt-top 125)
					ypnt-01 ypnt-top
					dlt-x 65
		);setq
	
		(get-data-from-graphs-09-cgv-from-cgv-to-txt xpnt-01 ypnt-01 dlt-x)
	
		(if (or (/= list-txt nil) (/= list-txt ""))
			(setq tmp-str-03 list-txt);setq
		);if
		
		;;;;;;;сбор из графы КОЛ/////////////////////////////////////////////////////
		(setq xpnt-01 (+ xpnt-top 135)
					ypnt-01 ypnt-top
					dlt-x 10
		);setq
	
		(get-data-from-graphs-09-cgv-from-cgv-to-txt xpnt-01 ypnt-01 dlt-x)
	
		(if (or (/= list-txt nil) (/= list-txt ""))
			(setq tmp-str-04 list-txt);setq
		);if
		
		;;;;;;;сбор из графы МАССА/////////////////////////////////////////////////////
		(setq xpnt-01 (+ xpnt-top 150)
					ypnt-01 ypnt-top
					dlt-x 15
		);setq

		(get-data-from-graphs-09-cgv-from-cgv-to-txt xpnt-01 ypnt-01 dlt-x)
	
		(if (or (/= list-txt nil) (/= list-txt ""))
			(setq tmp-str-05 list-txt);setq
		);if
		
		;;;;;;;сбор из графы ПРИМЕЧАНИЕ/////////////////////////////////////////////////////
		(setq xpnt-01 (+ xpnt-top 170)
					ypnt-01 ypnt-top
					dlt-x 20
		);setq
	
		(get-data-from-graphs-09-cgv-from-cgv-to-txt xpnt-01 ypnt-01 dlt-x)
	
		(if (or (/= list-txt nil) (/= list-txt ""))
			(setq tmp-str-06 list-txt);setq
		);if
		
		(setq ypnt-top (- ypnt-top 8)
					xpnt-01 nil
					dlt-x nil
					counter-line (+ counter-line 1)
		);setq

		(if (/= tmp-str-01 nil)		
			(setq str-01 (strcat str-01 " " tmp-str-01)		
						str-01 (vl-string-left-trim " " str-01)
			);set
		);if
	
		(if (/= tmp-str-02 nil)		
			(setq str-02 (strcat str-02 " " tmp-str-02)			
						str-02 (vl-string-left-trim " " str-02)
						str-02 (vl-string-subst " " "  " str-02)
						str-02 (vl-string-subst " " "  " str-02)
						str-02 (vl-string-subst " " "  " str-02)
						str-02 (vl-string-subst " " "  " str-02)				
			);setq
		);if
		
		(if (/= tmp-str-03 nil)		
			(setq str-03 (strcat str-03 " " tmp-str-03)
						str-03 (vl-string-left-trim " " str-03)
						str-03 (vl-string-subst " " "  " str-03)
						str-03 (vl-string-subst " " "  " str-03)
						str-03 (vl-string-subst " " "  " str-03)
						str-03 (vl-string-subst " " "  " str-03)
			);setq
		);if
		
		(if (/= tmp-str-04 nil)		
			(setq str-04 (strcat str-04 " " tmp-str-04)
						str-04 (vl-string-left-trim " " str-04)
						str-04 (vl-string-subst " " "  " str-04)
						str-04 (vl-string-subst " " "  " str-04)
						str-04 (vl-string-subst " " "  " str-04)
						str-04 (vl-string-subst " " "  " str-04)
			);setq
		);if
		
		(if (/= tmp-str-05 nil)		
			(setq str-05 (strcat str-05 " " tmp-str-05)
						str-05 (vl-string-left-trim " " str-05)
						str-05 (vl-string-subst " " "  " str-05)
						str-05 (vl-string-subst " " "  " str-05)
						str-05 (vl-string-subst " " "  " str-05)
						str-05 (vl-string-subst " " "  " str-05)
			);setq
		);if
		
		(if (/= tmp-str-06 nil)
			(setq str-06 (strcat str-06 " " tmp-str-06));setq
		);if
		
		(if (and (= tmp-str-01 nil) (= tmp-str-02 nil) (= tmp-str-03 nil) (= tmp-str-04 nil) (= tmp-str-05 nil) (= tmp-str-06 nil) (/= counter-line number-lines))
			(setq str-txt (list (strcat str-01 ";" str-02 ";" str-03 ";" str-04 ";" str-05 ";" str-06))
						list-902 (vl-list* str-txt list-902)
						str-01 ""
						str-02 ""
						str-03 ""
						str-04 ""
						str-05 ""
						str-06 ""
			);setq
		);if

		(if (or (/= tmp-str-01 nil) (/= tmp-str-02 nil) (/= tmp-str-03 nil) (/= tmp-str-04 nil) (/= tmp-str-05 nil) (= tmp-str-06 nil))
			(if (= counter-line number-lines)
				(setq str-txt (list (strcat str-01 ";" str-02 ";" str-03 ";" str-04 ";" str-05 ";" str-06))
							list-902 (vl-list* str-txt list-902)
							counter-line 0
							str-01 ""
						str-02 ""
						str-03 ""
						str-04 ""
						str-05 ""
						str-06 ""
				);setq
			);if
		);if
	);repeat
	
	(setvar "osmode" 6199)
);while

(setq list-902 (reverse list-902)
			name-file-dwg (vl-string-right-trim ".dwg" (getvar "dwgname"))
			dwg-file-dir (getvar "dwgprefix")
			
			cur-date (rtos (getvar "cdate"))
			cur-year (substr cur-date 1 4)
			cur-month (substr cur-date 5 2)
			cur-day (substr cur-date 7 2)
			cur-hrs (substr cur-date 10 2)
			cur-min (substr cur-date 12 2)

			name-file-dwg (strcat name-file-dwg "-" cur-year "-" cur-month "-" cur-day "-" cur-hrs "-" cur-min "-cgv.txt")
			
			file-to-write (open (strcat dwg-file-dir name-file-dwg) "w")
);setq

(write-line "Позиция;Обозначение;Наименование;Кол.;Масса единицы, кг;Примечание" file-to-write)
	
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
;/////// *************************************************************////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////



;/////// *************************************************************////////////////////////////////////////
;/////// чтение данных из графы                                       ////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////
(defun get-data-from-graphs-09-cgv-from-cgv-to-txt

(xpnt-01 ypnt-01 dlt-x / data-primitive line-sec pnt-1 pnt-2 txt txt-primitive)

(setvar "osmode" 0)

(setq ypnt-01 (- ypnt-01 4)
			list-txt nil

			pnt-1 (list xpnt-01 ypnt-01) ;точки рамки
			pnt-2 (list (- xpnt-01 dlt-x) ypnt-01)
			line-sec (list pnt-1 pnt-2)
			txt-primitive (ssget "_F" line-sec '((0 . "*TEXT")))
);setq

(if (/= txt-primitive nil)
	(setq list-txt (cdr (assoc 1 (entget (ssname txt-primitive 0)))));setq
);if

(princ)
)

;/////// *************************************************************////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////