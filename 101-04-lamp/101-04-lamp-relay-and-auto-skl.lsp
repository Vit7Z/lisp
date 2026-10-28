;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-lamp-relay-and-auto-skl

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil
			list-01 (list "СКЛ14")
      list-901 nil
      list-902 nil

);setq

(tmp-strt-101-04-lamp-relay-and-auto-skl)

(if (< (setq dcl-id (load_dialog "dia-101-04-lamp-relay-and-auto-skl.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_lamp_relay_and_auto_skl" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(action_tile "txt-01"
  (strcat "(tmp-strt-101-04-lamp-relay-and-auto-skl)");srcat
);action_tile

(action_tile "txt-05"
  (strcat "(txt-05-101-04-lamp-relay-and-auto-skl)");srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-04-lamp-relay-and-auto-skl)"
					"(list-filling \"txt-04\" list-04)"
					"(list-filling \"txt-05\" list-05)"
          "(set_tile \"txt-04\" \"0\")"
          "(set_tile \"txt-05\" \"0\")"
  );strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"spcf\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but4"
  (strcat "(setq type-list \"lecgv\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but5"
  (strcat "(list-delete-item)");strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (tmp-le-101-04-lamp-relay-and-auto-skl));if
(if (= type-list "spcf") (tmp-spcf-101-04-lamp-relay-and-auto-skl));if
(if (= type-list "lecgv") (tmp-lecgv-101-04-lamp-relay-and-auto-skl));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ///////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-strt-101-04-lamp-relay-and-auto-skl

( / list-902-read-file name-file)

(if (= nil str-01) 
	(setq str-01 "СКЛ14");setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(cond
	((= str-01 "СКЛ14") (setq name-file "101-04-lamp-relay-and-auto-skl-14.txt"));=
	



);cond

(read-file-for-dialog-box-02 name-file)

(setq list-02 (cdr (assoc 1 list-902-read-file))
			list-03 (cdr (assoc 2 list-902-read-file))
			list-04 (cdr (assoc 3 list-902-read-file))
			list-05 (cdr (assoc 4 list-902-read-file))
			list-06 (cdr (assoc 5 list-902-read-file))
);setq


(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-05-101-04-lamp-relay-and-auto-skl

( / str-01 str-03)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
);setq

(if (= str-01 "СКЛ14")
	(cond
		((= str-05 "1 постоянный") (setq list-06 (list "24" "12" "48" "110" "127" "220"))); =	
		((= str-05 "2 постоян./перемен.") (setq list-06 (list "24" "12" "48" "110" "127" "220"))); =	
		((= str-05 "3 переменный") (setq list-06 (list "24" "12" "48" "110" "127" "220" "380"))); =	
	); cond
);if

(list-filling "txt-06" list-06)

(set_tile "txt-06" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-04-lamp-relay-and-auto-skl

( / str-01 str-02 str-02-1 str-02-tmp str-03 str-03-1 str-03-2 str-04 str-04-1 str-05 str-05-1 str-05-2 str-06 tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(if (= str-01 "СКЛ14")
	(progn
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-02-1 (substr str-02 1 1)
										
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-03-1 (substr str-03 1 1)
					str-03-2 (substr str-03 3)
					str-03-2 (vl-string-subst "ая" "ый" str-03-2)
					
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
					str-04-1 (substr str-04 1 1)
					
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
					str-05-1 (substr str-05 1 1)
					
					str-06 (nth (atoi (get_tile "txt-06")) list-06)		
		);setq
		
		(if (= "_" str-04-1) (setq str-04-1 ""));if
			
		(cond
			((= str-05 "1 постоянный") (setq str-05-2 (strcat "Uпит. =" str-06 "В")));=
			((= str-05 "2 постоян./перемен.") (setq str-05-2 (strcat "Uпит. =/~" str-06 "В")));=
			((= str-05 "3 переменный") (setq str-05-2 (strcat "Uпит. ~" str-06 "В")));=
		);cond
		
		(setq str-02-tmp (strcat str-01 "-" str-02-1 "-" str-03-1 str-04-1 "-" str-05-1 ", " str-05-2)
		
					list-901 (vl-list* (strcat str-02-tmp ", " str-03-2) list-901)
			
					tmp-list-902 (list (cons 1 str-01) (cons 2 str-02-tmp) (cons 3 str-05-2) (cons 4 str-03-2) (cons 99 "0,05"))					
		);setq
	);prog
);if=

(setq list-902 (vl-list*  tmp-list-902 list-902)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-04-lamp-relay-and-auto-skl

( / cntr-1 pnt-ins str-01 str-02 str-04 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))		
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "СКЛ14")
		(setq str-701 (strcat "Светодиодная коммутаторная лампа " str-02 ", " str-04)
					str-702 nil
		);setq
	);if
 
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-04-lamp-relay-and-auto-skl

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-021 str-022 str-03 str-031 str-032 str-04 str-041 str-042 str-05 str-052 str-06 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)			
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(101-empt-lin-spcf)

	;;;;;;;;;/////////
	(if (= "СКЛ 14" str-01)
		(progn
			(setq str-021 (substr str-02 3)
						str-022 (substr str-02 1 1)			
						str-031 (substr str-03 3)
						str-032 (substr str-03 1 1)
						str-041 (substr str-04 3)
						str-042 (substr str-04 1 1)
						
						str-052 (substr str-05 1 1)
			);setq
			
			(if (= "_"str-042) (setq str-042 ""));if
			
			(cond
				((= str-05 "1 постоянный") (setq str-05 "=")); =	
				((= str-05 "2 постоян./перемен.") (setq str-05 "=/~")); =	
				((= str-05 "3 переменный") (setq str-05 "~")); =	
			);cond

			(setq nmbr-ln 4);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Светодиодная сигнальная лампа")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- группа яркости " str-021 ", цвет " str-031 ", линза " str-041))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- Uпит. " str-05 str-06 "В"))
			;
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "СКЛ 14" str-022 "-" str-032 str-042 "-" str-052 "-" str-06)) 
		);progn
	);if
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"Реле и Автоматика\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")				
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-04-lamp-relay-and-auto-skl

( / cntr-1 pnt-ins str-01 str-02 str-022 str-03 str-031 str-032 str-04 str-042 str-05 str-052 str-06 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)			
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;;;/////////
	(if (= "СКЛ 14" str-01)
		(progn
			(setq str-022 (substr str-02 1 1)			
						str-031 (substr str-03 3)
						str-032 (substr str-03 1 1)
						str-042 (substr str-04 1 1)						
						str-052 (substr str-05 1 1)
			);setq
			
			(if (= "_"str-042) (setq str-042 ""));if
			
			(cond
				((= str-05 "1 постоянный") (setq str-05 "=")); =	
				((= str-05 "2 постоян./перемен.") (setq str-05 "=/~")); =	
				((= str-05 "3 переменный") (setq str-05 "~")); =	
			);cond
			
			(setq str-701 (strcat "Светодиодная сигнальная лампа СКЛ14 " str-022 "-" str-032 str-042 "-" str-052 "-" str-06 ", цвет " str-031 ", " "Uпит. " str-05 str-06 "В")
						str-702 nil
						str-703 nil
			);setq
		);progn
	);if

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////