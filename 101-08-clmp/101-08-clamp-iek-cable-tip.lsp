;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-clamp-cable-tip-iek

( / adoc dcl-id list-00 list-01 list-02 list-03 list-04 list-05 list-901 list-902 str-1 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq list-00 (list "Наконечник-гильза Е" 
      							"Наконечник-гильза НГИ2")
      list-901 nil
      list-902 nil

			str-1 nil
);setq

(tmp-start-101-08-clamp-cable-tip-iek)

(if (< (setq dcl-id (load_dialog "dia-101-08-clamp-cable-tip-iek.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_accessories_iek" dcl-id))
		(exit)
);if

(list-filling "txt-00" list-00)
(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-1001" list-1001)

(set_tile "txt-00" "0")
(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(action_tile "txt-00"
  (strcat "(tmp-start-101-08-clamp-cable-tip-iek)"
  );srcat
);action_tile

(action_tile "txt-01"
  (strcat "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-08-clamp-cable-tip-iek)");strcat
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

(if (= type-list "le") (tmp-le-101-08-clamp-cable-tip-iek));if
(if (= type-list "spcf") (tmp-spcf-101-08-clamp-cable-tip-iek));if
(if (= type-list "lecgv") (tmp-lecgv-101-08-clamp-cable-tip-iek));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-start-101-08-clamp-cable-tip-iek

( / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-1001-read-file)

(if (= nil str-1) 
	(setq str-1 (nth 0 list-00));setq
	(setq str-1 (nth (atoi (get_tile "txt-00")) list-00));setq
);if

(cond
	((= str-1 "Наконечник-гильза Е")
		(read-file-for-dialog-box "101-08-clamp-cable-tip-iek-e.txt" 4)
	);=

	((= str-1 "Наконечник-гильза НГИ2")
		(read-file-for-dialog-box "101-08-clamp-cable-tip-iek-ngig2.txt" 4)
	);=
);cond



(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
			list-04 list-04-read-file
			list-05 list-05-read-file
			list-1001 list-1001-read-file
);setq

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-1001" list-1001)


(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")



(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-08-clamp-cable-tip-iek

( / cntr-1 str-00 str-01 str-02 str-03 str-04 str-05 tmp-str-spcf)

(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
			str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
      cntr-1 0 
);setq
  

(if (/= list-901 nil)
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq tmp-str-spcf (list (cons 0 str-00) (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05))
  		list-902 (vl-list*  tmp-str-spcf list-902)
  		
  		list-901 (vl-list* (strcat str-01 "  " str-03 " мм2  " str-04 "  ") list-901)
);setq

(setq list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-08-clamp-cable-tip-iek

( / cntr-1 dlt-y nmbr-ln pnt-ins str-00 str-01 str-02 str-03 str-04 str-05 str-not str-patrn str-tmp str-txt x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-00 (cdr (assoc 0 str-tmp))
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	  		
	);setq
	
	(101-empt-lin-spcf)
	
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-00 "Наконечник-гильза*")
		(progn
			(if (= str-04 "Черный") (setq str-04 "черный"));if
			
			(setq nmbr-ln 3
						str-txt (strcat str-01 ", артикул " str-02)
						str-not nil
						str-patrn " "
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Наконечник-гильза")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- сечение проводника " str-03 " мм2, цвет " (strcase str-04 1)))	
		);progn
	);if

	(split-str-parts-spcf-60-01 str-txt str-not str-patrn pnt-ins)

								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ИЭК, г. Москва")
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ ОВШ               //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-08-clamp-cable-tip-iek

( / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-703 str-tmp str-tmp-4)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-00 (cdr (assoc 0 str-tmp))
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	(if (wcmatch str-00 "Наконечник-гильза*")
		(progn
			(if (= str-tmp-4 "Черный") (setq str-tmp-4 "черный"));if
			
			(setq str-701 (strcat "Наконечник-гильза, "  str-01 ", артикул " str-02 ", диаметр провода " str-03 " мм2, цвет " (strcase str-04 1))
						str-702 nil
						str-703 nil
			);setq
			
		);progn
	);if

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 "0,002" pnt-ins);
		
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
