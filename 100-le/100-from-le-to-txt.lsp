;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// передача данных из ПЭ в txt                                  //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:100-from-le-to-txt

( / adoc counter counter-line cur-date cur-day cur-hrs cur-min cur-month cur-year dwg-file-dir file-to-write flag key-txt list-1 list-2 
list-3 list-4 list-902 name-file-dwg name-file-spcf number-line number-lines pnt-1 pnt-2 pnt-bttm pnt-top str-txt txt-1-tmp txt-2-tmp 
txt-3-tmp txt-4-tmp txt-obj-1 txt-obj-2 txt-obj-3 txt-obj-4 xpnt-01 ypnt-01 ypnt-02)

;точки указания - левая граница графы "Позиция" и правая граница графы "Примечание"

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 1)
(setvar "osmode" 6199)

(setq counter-line 1);setq

(while (/= nil (setq pnt-top (getpoint "\nУкажите точку верх - лев. сторона Позиция\n")))
	(setq	pnt-bttm (getpoint "\nУкажите точку низ - прав. сторона Примечание\n")
				xpnt-01 (nth 0 pnt-top)
				ypnt-01 (nth 1 pnt-top)
				ypnt-02 (nth 1 pnt-bttm)
				
				number-lines (fix (/ (- ypnt-01 ypnt-02) 8))
			
				list-1 ""
				list-2 ""
				list-3 ""
				list-4 ""
				
				counter 1				
	);setq
	
	(setvar "osmode" 0)
	
	(repeat number-lines
		(setq ypnt-02 (- ypnt-01 4)
		      txt-1-tmp nil
				  txt-2-tmp nil
				  txt-3-tmp nil
				  txt-4-tmp nil
		);setq
						
		;;;;;;сбор из графы 1 /////////////////////
		(setq pnt-1 (list xpnt-01 ypnt-02) ;точки рамки
					pnt-2 (list (+ xpnt-01 20) ypnt-02)
					txt-obj-1 (ssget "_F" (list pnt-1 pnt-2) '((0 . "*TEXT")))
		);setq

		(if (/= txt-obj-1 nil)
			(progn
				(setq txt-1-tmp (cdr (assoc 1 (entget (ssname txt-obj-1 0)))));setq
			
				(cond 
					((/= list-1 "") (setq list-1 (strcat list-1 " " txt-1-tmp)));setq
					((= list-1 "") (setq list-1 txt-1-tmp));setq
				);cond
			);progn
		);if
				
		;;;;;;сбор из графы 2 /////////////////////
		(setq pnt-1 (list (+ xpnt-01 130) ypnt-02) ;точки рамки
					pnt-2 (list (+ xpnt-01 20) ypnt-02)
					txt-obj-2 (ssget "_F" (list pnt-1 pnt-2) '((0 . "*TEXT")))
		);setq
		
		(if (/= txt-obj-2 nil)
			(progn
				(setq txt-2-tmp (cdr (assoc 1 (entget (ssname txt-obj-2 0)))));setq
				
				(cond 
					((/= list-2 "") (setq list-2 (strcat list-2 " " txt-2-tmp)));setq
					((= list-2 "") (setq list-2 txt-2-tmp));setq
				);cond
			);progn
		);if


		;;;;;;сбор из графы 3 /////////////////////
		(setq pnt-1 (list (+ xpnt-01 140) ypnt-02) ;точки рамки
					pnt-2 (list (+ xpnt-01 130) ypnt-02)
					txt-obj-3 (ssget "_F" (list pnt-1 pnt-2) '((0 . "*TEXT")))
		);setq
		
		;(command "_RECTANGLE" pnt-1 pnt-2 pnt-1)

		(if (/= txt-obj-3 nil)
			(progn
				(setq txt-3-tmp (cdr (assoc 1 (entget (ssname txt-obj-3 0)))));setq
			
				(cond 
					((/= list-3 "") (setq list-3 (strcat list-3 " " txt-3-tmp)));setq
					((= list-3 "") (setq list-3 txt-3-tmp));setq
				);cond
			);progn
		);if

		;;;;;;сбор из графы 4 /////////////////////
		(setq pnt-1 (list (+ xpnt-01 185) ypnt-02) ;точки рамки
					pnt-2 (list (+ xpnt-01 140) ypnt-02)
					txt-obj-4 (ssget "_F" (list pnt-1 pnt-2) '((0 . "*TEXT")))
		);setq

		(if (/= txt-obj-4 nil)
			(progn
				(setq txt-4-tmp (cdr (assoc 1 (entget (ssname txt-obj-4 0)))));setq
				
				(cond 
					((/= list-4 "") (setq list-4 (strcat list-4 " " txt-4-tmp)));setq
					((= list-4 "") (setq list-4 txt-4-tmp));setq
				);cond
			);progn
		);if
		
		
		(setq list-1 (vl-string-left-trim " " list-1)
		      list-1 (vl-string-subst "..." "... " list-1)
		      list-1 (vl-string-subst " " "  " list-1)
					list-2 (vl-string-left-trim " " list-2)
					list-2 (vl-string-subst " " "  " list-2)
					list-3 (vl-string-left-trim " " list-3)
					list-4 (vl-string-left-trim " " list-4)
		);setq
	
		(if (or (and (= txt-obj-1 nil) (= txt-obj-2 nil) (= txt-obj-3 nil) (= txt-obj-4 nil))
		    (= counter number-lines))
		  (progn		  
		    (setq key-txt (substr list-2 1 2));setq
		    
		    (if (= key-txt "%%")
				  (setq list-2 (substr list-2 4)
				        str-txt (list (strcat ";" list-1 ";" list-2 ";" list-3 ";" list-4))
				  );setq
				);if
			

		    (if (/= key-txt "%%")
				  (setq number-line (itoa counter-line)
				        str-txt (list (strcat number-line ";" list-1 ";" list-2 ";" list-3 ";" list-4))
				        counter-line (1+ counter-line)
				  );setq
				);if
		  
		    (setq list-902 (vl-list* str-txt list-902)
		          str-txt nil						
						  list-1 ""						
						  list-2 ""
						  list-3 ""
						  list-4 ""
						
						  txt-1-tmp nil
				      txt-2-tmp nil
				      txt-3-tmp nil
				      txt-4-tmp nil
		    );setq
		  );progn
		);if
		


		(setq	ypnt-01 (- ypnt-01 8)
					counter (1+ counter)
		);setq
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

			name-file-spcf (strcat name-file-dwg "-" cur-year "-" cur-month "-" cur-day "-" cur-hrs "-" cur-min "-list of elements.txt")
			
			file-to-write (open (strcat dwg-file-dir name-file-spcf) "w")
);setq
	
(write-line (strcat "№ п/п;"
                    "Позиция;"
                    "Наименование и техническая характеристика;"
										"Количество;"										
										"Примечание") file-to-write)
										
(write-line "1;2;3;4;5" file-to-write)
	
(setq counter 0)

(repeat (length list-902)
	(setq str-txt (car (nth counter list-902)));setq
	(write-line str-txt file-to-write)	
	(write-line "" file-to-write)	
	(setq counter (1+ counter));setq
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