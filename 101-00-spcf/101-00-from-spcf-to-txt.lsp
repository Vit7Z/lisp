;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// передача данных из автокада в файл                           //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:101-00-from-spcf-to-txt

( / adoc cntr-1 counter cur-date cur-day cur-hrs cur-min cur-month cur-year dwg-file-dir file-to-write list-1 list-2 list-3 list-5 
list-6 list-7 list-8 list-9 list-902 name-file-dwg name-file-spcf number-lines pnt-1 pnt-2 pnt-bttm pnt-top str-counter str-txt 
txt-1-tmp txt-2-tmp txt-3-tmp txt-5-tmp txt-6-tmp txt-7-tmp txt-8-tmp txt-9-tmp txt-obj-1 txt-obj-2 txt-obj-3 txt-obj-5 txt-obj-6 
txt-obj-7 txt-obj-8 txt-obj-9 xpnt-01 xpnt-top ypnt-01 ypnt-02 ypnt-bttm ypnt-top)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 1)
(setvar "osmode" 6199)

(setq counter 1);setq

(while (/= nil (setq pnt-top (getpoint "\nВыберите точку верх\n")))
	(setq	pnt-bttm (getpoint "\nВыберите точку низ\n")
				xpnt-top (nth 0 pnt-top)
				ypnt-top (nth 1 pnt-top)

				ypnt-bttm (nth 1 pnt-bttm)
				
				number-lines (fix (/ (- ypnt-top ypnt-bttm) 8))
				
				txt-1-tmp nil
				txt-2-tmp nil
				txt-3-tmp nil

				txt-5-tmp nil
				txt-6-tmp nil
				txt-7-tmp nil
				txt-8-tmp nil
				txt-9-tmp nil
				
				list-1 ""
				list-2 ""
				list-3 ""

				list-5 ""
				list-6 ""
				list-7 ""
				list-8 ""
				list-9 ""
				
				ypnt-01 ypnt-top
	);setq
	
	(setvar "osmode" 0)
	
	(repeat number-lines
		(setq xpnt-01 xpnt-top
					ypnt-01 ypnt-top
					ypnt-02 (- ypnt-01 4)
		);setq
		

		;;;;;;сбор из графы 1 /////////////////////
		(setq pnt-1 (list xpnt-01 ypnt-02) ;точки рамки
					pnt-2 (list (- xpnt-01 20) ypnt-02)
					txt-obj-1 (ssget "_F" (list pnt-1 pnt-2) '((0 . "*TEXT")))
		);setq

		(if (/= txt-obj-1 nil)
			(progn
				(setq txt-1-tmp (cdr (assoc 1 (entget (ssname txt-obj-1 0)))));setq
			
				(cond 
					((/= list-1 nil) (setq list-1 (strcat list-1 " " txt-1-tmp)));setq
					
					((= list-1 nil) (setq list-1 txt-1-tmp));setq
				);cond
			);progn
		);if
		
		
		;;;;;;сбор из графы 2 /////////////////////
		(setq pnt-1 (list (+ xpnt-01 130) ypnt-02) ;точки рамки
					pnt-2 (list xpnt-01 ypnt-02)
					txt-obj-2 (ssget "_F" (list pnt-1 pnt-2) '((0 . "*TEXT")))
		);setq

		(if (/= txt-obj-2 nil)
			(progn
				(setq txt-2-tmp (cdr (assoc 1 (entget (ssname txt-obj-2 0)))));setq
			
				(cond 
					((/= list-2 nil) (setq list-2 (strcat list-2 " " txt-2-tmp)));setq
					
					((= list-2 nil) (setq list-2 txt-2-tmp));setq
				);cond
			);progn
		);if


		;;;;;;сбор из графы 3 /////////////////////
		(setq pnt-1 (list (+ xpnt-01 190) ypnt-02) ;точки рамки
					pnt-2 (list (+ xpnt-01 130) ypnt-02)
					txt-obj-3 (ssget "_F" (list pnt-1 pnt-2) '((0 . "*TEXT")))
		);setq

		(if (/= txt-obj-3 nil)
			(progn
				(setq txt-3-tmp (cdr (assoc 1 (entget (ssname txt-obj-3 0)))));setq
			
				(cond 
					((/= list-3 nil) (setq list-3 (strcat list-3 " " txt-3-tmp)));setq
					
					((= list-3 nil) (setq list-3 txt-3-tmp));setq
				);cond
			);progn
		);if


		;;;;;;сбор из графы 5 /////////////////////
		(setq pnt-1 (list (+ xpnt-01 270) ypnt-02) ;точки рамки
					pnt-2 (list (+ xpnt-01 225) ypnt-02)
					txt-obj-5 (ssget "_F" (list pnt-1 pnt-2) '((0 . "*TEXT")))
		);setq

		(if (/= txt-obj-5 nil)
			(progn
				(setq txt-5-tmp (cdr (assoc 1 (entget (ssname txt-obj-5 0)))));setq
			
				(if (and (/= txt-5-tmp nil) (/= list-5 nil))
					(setq list-5 (strcat list-5 " " txt-5-tmp));setq
				);if
			);progn
		);if
		
		
		;;;;;;сбор из графы 6 /////////////////////
		(setq pnt-1 (list (+ xpnt-01 290) ypnt-02) ;точки рамки
					pnt-2 (list (+ xpnt-01 270) ypnt-02)
					txt-obj-6 (ssget "_F" (list pnt-1 pnt-2) '((0 . "*TEXT")))
		);setq

		(if (/= txt-obj-6 nil)
			(progn
				(setq txt-6-tmp (cdr (assoc 1 (entget (ssname txt-obj-6 0)))));setq
			
				(if (and (/= txt-6-tmp nil) (/= list-6 nil))
					(setq list-6 (strcat list-6 " " txt-6-tmp));setq
				);if
			);progn
		);if
		
		;;;;;;сбор из графы 7 /////////////////////
		(setq pnt-1 (list (+ xpnt-01 310) ypnt-02) ;точки рамки
					pnt-2 (list (+ xpnt-01 290) ypnt-02)
					txt-obj-7 (ssget "_F" (list pnt-1 pnt-2) '((0 . "*TEXT")))
		);setq

		(if (/= txt-obj-7 nil)
			(progn
				(setq txt-7-tmp (cdr (assoc 1 (entget (ssname txt-obj-7 0)))));setq
			
				(if (and (/= txt-7-tmp nil) (/= list-7 nil))
					(setq list-7 (strcat list-7 " " txt-7-tmp));setq
				);if
			);progn
		);if
		
		
		;;;;;;сбор из графы 8 /////////////////////
		(setq pnt-1 (list (+ xpnt-01 335) ypnt-02) ;точки рамки
					pnt-2 (list (+ xpnt-01 310) ypnt-02)
					txt-obj-8 (ssget "_F" (list pnt-1 pnt-2) '((0 . "*TEXT")))
		);setq

		(if (/= txt-obj-8 nil)
			(progn
				(setq txt-8-tmp (cdr (assoc 1 (entget (ssname txt-obj-8 0)))));setq
			
				(if (and (/= txt-8-tmp nil) (/= list-8 nil))
					(setq list-8 (strcat list-8 " " txt-8-tmp));setq
				);if
			);progn
		);if
		
		
		;;;;;;сбор из графы 9 /////////////////////
		(setq pnt-1 (list (+ xpnt-01 375) ypnt-02) ;точки рамки
					pnt-2 (list (+ xpnt-01 335) ypnt-02)
					txt-obj-9 (ssget "_F" (list pnt-1 pnt-2) '((0 . "*TEXT")))
		);setq

		(if (/= txt-obj-9 nil)
			(progn
				(setq txt-9-tmp (cdr (assoc 1 (entget (ssname txt-obj-9 0)))));setq
			
				(if (and (/= txt-9-tmp nil) (/= list-9 nil))
					(setq list-9 (strcat list-9 " " txt-9-tmp));setq
				);if
			);progn
		);if
		
		(setq list-1 (vl-string-left-trim " " list-1)
					list-2 (vl-string-left-trim " " list-2)
					list-3 (vl-string-left-trim " " list-3)
					list-5 (vl-string-left-trim " " list-5)
					list-6 (vl-string-left-trim " " list-6)
					list-7 (vl-string-left-trim " " list-7)
					list-8 (vl-string-left-trim " " list-8)
					list-9 (vl-string-left-trim " " list-9)
		);setq
		
		(if (and (= txt-obj-1 nil)
						 (= txt-obj-2 nil)
						 (= txt-obj-3 nil)
						 (= txt-obj-5 nil)
						 (= txt-obj-6 nil)
						 (= txt-obj-7 nil)
						 (= txt-obj-8 nil)
						 (= txt-obj-9 nil));
						 
			(setq str-counter (itoa counter)
						str-txt (list (strcat str-counter ";" list-1 ";" list-2 ";" list-3 ";" list-5 ";" list-6 ";" list-7 ";" list-8 ";" list-9))
				
						list-902 (vl-list* str-txt list-902)
						
						str-txt nil						
						list-1 ""						
						list-2 ""
						list-3 ""
						list-5 ""
						list-6 ""
						list-7 ""
						list-8 ""
						list-9 ""
						
						counter (1+ counter)
			);setq
		);if

		(setq	ypnt-top (- ypnt-top 8));setq
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

			name-file-spcf (strcat name-file-dwg "-" cur-year "-" cur-month "-" cur-day "-" cur-hrs "-" cur-min "-spcf.txt")
			
			file-to-write (open (strcat dwg-file-dir name-file-spcf) "w")
);setq
	
(write-line (strcat "№ п/п;Позиция;Наименование и техническая характеристика;"
										"Тип, марка, обозначение документа, опросного листа;"
										"Завод-изготовитель;Ед. изм.;Кол.;"
										"Масса ед., кг.;"
										"Примечание") file-to-write)
	
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
;/////// *************************************************************//////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              //////////////////////////////
;/////// *************************************************************//////////////////////////////