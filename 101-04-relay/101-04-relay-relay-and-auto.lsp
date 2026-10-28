;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-relay-relay-and-auto

( / adoc dcl-id list-01 list-02 list-03 list-04 list-901 list-902 list-902-read-file str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil
      list-01 (list "РП21М")
      list-901 nil
      list-902 nil
      list-902-read-file nil
);setq

(txt-01-101-04-relay-relay-and-auto)

(if (< (setq dcl-id (load_dialog "dia-101-04-relay-relay-and-auto.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_relay_relay_and_auto" dcl-id))
		(exit)
);if


(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)


(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")


(action_tile "txt-01"
  (strcat "(txt-01-101-04-relay-relay-and-auto)");srcat
);action_tile

(action_tile "but1"
  (strcat "(filling-data-101-04-relay-relay-and-auto)");strcat
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

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-04-relay-relay-and-auto));if

(if (= type-list "spcf") (tmp-spcf-101-04-relay-relay-and-auto));if

(if (= type-list "lecgv") (tmp-lecgv-101-04-relay-relay-and-auto));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ///////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-relay-relay-and-auto

()

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01));setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(cond
	((= str-01 "РП21М") (read-file-for-dialog-box-01 "101-04-relay-relay-and-auto-rp-21-m.txt"));=


);cond

(setq list-02 (cdr (assoc 1 list-902-read-file))
			list-03 (cdr (assoc 2 list-902-read-file))
			list-04 (cdr (assoc 3 list-902-read-file))
);setq




(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)


(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-data-101-04-relay-relay-and-auto

( / str-01 str-02 str-03 str-04 swtch tmp-list-902)

(setq swtch list-901);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq

(if (= str-01 "РП21М")
	(progn
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-04 (nth (atoi (get_tile "txt-04")) list-04)

  				list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-03  "  " str-04) list-901)
					tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 "0,14"))				
		);setq
	);progn
);if

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
(defun le-101-04-relay-relay-and-auto

( / cntr-1 nmbr-ln pnt-ins str-01 str-02 str-02-1 str-03 str-04 str-tmp str-txt str-txt-01)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
		
  ;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "РП21М")
		(progn
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-03 (cdr (assoc 3 str-tmp))	
						str-04 (cdr (assoc 4 str-tmp))	
						nmbr-ln 3
			);setq
			
			(cond
				((= str-02 "001 (1п.)") (setq str-02-1 "1 переключающий контакт"));=
				((= str-02 "002 (2п.)") (setq str-02-1 "2 переключающих контакта"));=
				((= str-02 "003 (3п.)") (setq str-02-1 "3 переключающих контакта"));=
				((= str-02 "004 (4п.)") (setq str-02-1 "4 переключающих контакта"));=
				((= str-02 "010 (1р.)") (setq str-02-1 "1 размыкающий контакт"));=
				((= str-02 "020 (2р.)") (setq str-02-1 "2 размыкающих контакта"));=
				((= str-02 "100 (1з.)") (setq str-02-1 "1 замыкающий контакт"));=
				((= str-02 "110 (1з., 1р.)") (setq str-02-1 "1 замыкающий контакт, 1 размыкающий контакт"));=
				((= str-02 "120 (1з., 2р.)") (setq str-02-1 "1 замыкающий контакт, 2 размыкающих контакта"));=
				((= str-02 "200 (2з.)") (setq str-02-1 "2 замыкающих контакта"));=
				((= str-02 "210 (2з., 1р.)") (setq str-02-1 "2 замыкающих контакта, 1 размыкающий контакт"));=
				((= str-02 "220 (2з., 2р.)") (setq str-02-1 "2 замыкающих контакта, 2 размыкающих контакта"));=
				((= str-02 "300 (3з.)") (setq str-02-1 "3 замыкающих контакта"));=
				((= str-02 "310 (3з., 1р.)") (setq str-02-1 "3 замыкающих контакта, 1 размыкающий контакт"));=
				((= str-02 "400 (4з.)") (setq str-02-1 "4 замыкающих контакта"));=
			);cond
		
			(setq str-txt (strcat "Реле промежуточное РП21М-" (substr str-02 1 3) ", Uупр. " str-03 "В, " str-02-1)
						str-txt-01 nil
			);setq
		);progn	
	);if =

	(split-str-parts-le-110-01 str-txt str-txt-01 pnt-ins)
 
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-04-relay-relay-and-auto

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-02-1 str-03 str-03-1 str-04 str-04-1 str-04-2 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
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

	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "РП21М" str-01)
		(progn
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-03 (cdr (assoc 3 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
			);setq
				
			(cond
				((= str-02 "001 (1п.)") (setq str-02-1 "1 переключающий контакт"));=
				((= str-02 "002 (2п.)") (setq str-02-1 "2 переключающих контакта"));=
				((= str-02 "003 (3п.)") (setq str-02-1 "3 переключающих контакта"));=
				((= str-02 "004 (4п.)") (setq str-02-1 "4 переключающих контакта"));=
				((= str-02 "010 (1р.)") (setq str-02-1 "1 размыкающий контакт"));=
				((= str-02 "020 (2р.)") (setq str-02-1 "2 размыкающих контакта"));=
				((= str-02 "100 (1з.)") (setq str-02-1 "1 замыкающий контакт"));=				
				((= str-02 "110 (1з., 1р.)") (setq str-02-1 "1 замыкающий контакт, 1 размыкающий контакт"));=
				((= str-02 "120 (1з., 2р.)") (setq str-02-1 "1 замыкающий контакт, 2 размыкающих контакта"));=
				((= str-02 "200 (2з.)") (setq str-02-1 "2 замыкающих контакта"));=
				((= str-02 "210 (2з., 1р.)") (setq str-02-1 "2 замыкающих контакта, 1 размыкающий контакт"));=				
				((= str-02 "220 (2з., 2р.)") (setq str-02-1 "2 замыкающих контакта, 2 размыкающих контакта"));=
				((= str-02 "300 (3з.)") (setq str-02-1 "3 замыкающих контакта"));=
				((= str-02 "310 (3з., 1р.)") (setq str-02-1 "3 замыкающих контакта, 1 размыкающий контакт"));=
				((= str-02 "400 (4з.)") (setq str-02-1 "4 замыкающих контакта"));=
			);cond

			(setq str-03-1 (substr str-03 1 1)
						str-03 (substr str-03 2)
			);=
			
			(setq str-04-1 (substr str-04 9)			
						str-04-2 (vl-string-subst "типа" "Тип" (substr str-04 1 5))		
			);=

			(setq nmbr-ln 4);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Реле промежуточное")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-02-1))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- " str-04-1))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "РП21М-" (substr str-02 1 3) ", Uупр. " str-03-1 " " str-03 "В,")) ;Тип, марка, обозначение документа, опросного листа
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "с розеткой " str-04-2))
			
		);progn
	);if

	

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"Реле и Автоматика\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")	
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-04-relay-relay-and-auto

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-02-1 str-02-2 str-03 str-03-1 str-04 str-04-1 str-04-2 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
	
	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "РП21М" str-01)
		(progn
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-03 (cdr (assoc 3 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
						nmbr-ln 5
			);setq
				
			(cond
				((= str-02 "001 (1п.)") (setq str-02-1 "1 переключающий контакт"));=
				((= str-02 "002 (2п.)") (setq str-02-1 "2 переключающих контакта"));=
				((= str-02 "003 (3п.)") (setq str-02-1 "3 переключающих контакта"));=
				((= str-02 "004 (4п.)") (setq str-02-1 "4 переключающих контакта"));=
				((= str-02 "010 (1р.)") (setq str-02-1 "1 размыкающий контакт"));=
				((= str-02 "020 (2р.)") (setq str-02-1 "2 размыкающих контакта"));=
				((= str-02 "100 (1з.)") (setq str-02-1 "1 замыкающий контакт"));=				
				((= str-02 "110 (1з., 1р.)") (setq str-02-1 "1 замыкающий контакт" str-02-2 "1 размыкающий контакт" nmbr-ln 6));=
				((= str-02 "120 (1з., 2р.)") (setq str-02-1 "1 замыкающий контакт" str-02-2 "2 размыкающих контакта"));=
				((= str-02 "200 (2з.)") (setq str-02-1 "2 замыкающих контакта"));=
				((= str-02 "210 (2з., 1р.)") (setq str-02-1 "2 замыкающих контакта" str-02-2 "1 размыкающий контакт" nmbr-ln 6));=
				((= str-02 "220 (2з., 2р.)") (setq str-02-1 "2 замыкающих контакта" str-02-2 "2 размыкающих контакта" nmbr-ln 6));=
				((= str-02 "300 (3з.)") (setq str-02-1 "3 замыкающих контакта"));=
				((= str-02 "310 (3з., 1р.)") (setq str-02-1 "3 замыкающих контакта" str-02-2 "1 размыкающий контакт" nmbr-ln 6));=
				((= str-02 "400 (4з.)") (setq str-02-1 "4 замыкающих контакта"));=
			);cond

			(setq str-03-1 (substr str-03 1 1)
						str-03 (substr str-03 2)
			);=
			
			(setq str-04-1 (vl-string-subst "типа" "Тип" (substr str-04 1 5)));=
			
			(cond
				((= str-04-1 "типа 1") (setq str-04-2 "крепление винтами")); =
				((= str-04-1 "типа 2") (setq str-04-2 "крепление на DIN-рейку")); =
				((= str-04-1 "типа 3") (setq str-04-2 "крепление винтами")); =
			);cond


			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)	
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)

			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Реле промежуточное РП21М-" (substr str-02 1 3)))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-03-1 " " str-03 "В, с розеткой " str-04-1))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "(" str-04-2 "),"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-02-1)
			
			(if (or (= str-02 "110 (1з., 1р.)")
							(= str-02 "120 (1з., 2р.)")
							(= str-02 "210 (2з., 1р.)")
							(= str-02 "220 (2з., 2р.)")
							(= str-02 "310 (3з., 1р.)"));or
				(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 str-02-2)
			);if
		);progn
	);if
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		
	(repeat nmbr-ln
  	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////