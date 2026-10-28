;/////// ************************************************************ ////////////////////////////////////////////////////////////////////////////////
;///////                                                              ////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////////////////////////////////////////////
(defun 101-04-lamp-schn-xb-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-08 list-801 list-802 list-900 list-900-dscr 
list-900-menu list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-04-lamp-schn-xb-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			
      list-901 nil
      list-902 nil
      list-900 nil
      list-900-menu nil
      list-900-dscr nil
      
      str-01 "0"
);setq

(txt-01-101-04-lamp-schn-xb-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-04-lamp-schn-xb-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_lamp_xb" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-101-04-lamp-schn-xb-01-general str-01)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-txt (get_tile \"txt-02\"))"
  				"(set_tile \"txt-03\" str-txt)"
  				"(set_tile \"txt-04\" str-txt)"
  				"(set_tile \"txt-05\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-07\" str-txt)"
  				"(set_tile \"txt-08\" str-txt)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-txt (get_tile \"txt-03\"))"
  				"(set_tile \"txt-02\" str-txt)"
  				"(set_tile \"txt-04\" str-txt)"
  				"(set_tile \"txt-05\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-07\" str-txt)"
  				"(set_tile \"txt-08\" str-txt)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(setq str-txt (get_tile \"txt-04\"))"
  				"(set_tile \"txt-02\" str-txt)"
  				"(set_tile \"txt-03\" str-txt)"
  				"(set_tile \"txt-05\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-07\" str-txt)"
  				"(set_tile \"txt-08\" str-txt)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-lamp-schn-xb-01-general)");strcat
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

(if (= type-list "le") (le-101-04-lamp-schn-xb-01-general list-902));if

(if (= type-list "spcf") (spcf-101-04-lamp-schn-xb-01-general list-902));if

(if (= type-list "lecgv") (lecgv-101-04-lamp-schn-xb-01-general list-902));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрогамма чтения данных из файлов для авт выкл//////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-lamp-schn-xb-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-07-read-file list-900-dscr 
list-900-read-file name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(divide-text-into-parts list-900-dscr 120)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-07 list-06-read-file
			list-08 list-07-read-file
			list-900 list-900-read-file
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-lamp-schn-xb-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 tmp-list-902)

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if
		
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)		
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-04 (strcat "Uпит " str-04)
			
			str-05 (nth (atoi (get_tile "txt-05")) list-05)		
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
);setq

;;;;;;;//////////////////////////////////////////////////////////////////////
(setq list-901 (vl-list* (strcat str-02  "  " str-03 "  " str-04 "  " str-06) list-901)
			
			str-03 (strcase str-03 1)
			
			str-06 (strcase str-06 1)
			
			tmp-list-902 (list (cons 1 str-02) (cons 2 str-03) (cons 3 str-04) (cons 4 str-06) (cons 99 "0,05"))
);setq

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-lamp-schn-xb-01-general

(list-902 / cntr-1 pnt-ins str-1 str-2 str-3 str-4 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
	
				str-701 (strcat "Лампа сигнальная Schneider Electric, артикул " str-1 ", " str-3 ", " str-2 ", " str-4)		
	);setq
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-04-lamp-schn-xb-01-general

( / cntr-1 pnt-ins str-0 str-1 str-2 str-3 str-4 str-5 str-7 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-0 (cdr (assoc 0 str-tmp))
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
				str-7 (cdr (assoc 7 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;обработка данных
	(cond
		((= str-2 "Зеленый") (setq str-2 "зеленый"));=
		((= str-2 "Красный") (setq str-2 "красный"));=
		((= str-2 "Желтый") (setq str-2 "желтый"));=
	);cond

	(cond
		((= str-4 "Винт") (setq str-4 "винтовые"));=
	);cond

	(cond
		((= str-5 "Круг") (setq str-5 "круглая"));=
	);cond

	(cond
		((= str-7 "Пластик") (setq str-7 "пластиковый"));=
	);cond

	(setq str-701 "Лампа сигнальная"
						
				str-702 (list (cons 1 (strcat "цвет " str-2))
											(cons 2 (strcat "Uпит. " str-3))
											(cons 3 (strcat str-4 " контакты"))
											(cons 4 (strcat str-5 " форма"))
											(cons 5 (strcat str-7 " корпус"))
								);list

																	 
				str-order (list (cons 1 str-1) 
												(cons 2 " ") 
												(cons 3 nil));list
	);setq


	(setq str-manufact "Schneider Electric, г. Москва"
				str-unit "шт"
				str-crtf nil
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-04-lamp-schn-xb-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-99 str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-30 str-tmp-4 str-tmp-5 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	); setq
	
	(09-empt-lin-le-cgv)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)

	;обработка данных	


	(cond
		((= str-tmp-2 "Зеленый") (setq str-tmp-2 "зеленый"));=
		((= str-tmp-2 "Красный") (setq str-tmp-2 "красный"));=
		((= str-tmp-2 "Желтый") (setq str-tmp-2 "желтый"));=
	);cond

	(cond
		((= str-tmp-4 "Винт") (setq str-tmp-4 "винтовые"));=
	);cond

	(cond
		((= str-tmp-5 "Круг") (setq str-tmp-5 "круглая"));=
	);cond

	(setq nmbr-ln 5);setq
			
	(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
				
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Лампа сигнальная Schneider Electric,")
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "серия Harmony, " "артикул " str-tmp-1 ","))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-tmp-2 " цвет, " str-tmp-3 ","))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-tmp-4 " зажимы, " str-tmp-5 " форма"))

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