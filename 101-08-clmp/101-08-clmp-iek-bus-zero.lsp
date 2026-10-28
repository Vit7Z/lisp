;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-clmp-iek-bus-zero

( / adoc dcl-id list-00 list-01 list-02 list-03 list-04 list-1001 list-901 list-902 list-99 str-1 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq list-00 (list "Шина нулевая с DIN-изолятором"
						  			"Шина нулевая в корпусе (кросс-модуль)")
      list-901 nil
      list-902 nil
			str-1 nil
);setq

(tmp-start-101-08-clmp-iek-bus-zero)

(if (< (setq dcl-id (load_dialog "dia-101-08-clmp-iek-bus-zero.dcl")) 0) ;ищем диалог
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
(list-filling "txt-99" list-99)
(list-filling "txt-1001" list-1001)

(set_tile "txt-00" "0")
(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-99" "0")

(action_tile "txt-00"
  (strcat "(tmp-start-101-08-clmp-iek-bus-zero)");srcat
);action_tile

(action_tile "txt-01"
  (strcat "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-99\" $value)"
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
  (strcat "(tmp-filling-fields-101-08-clmp-iek-bus-zero)");strcat
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

(if (= type-list "le") (tmp-le-101-08-clmp-iek-bus-zero));if
(if (= type-list "spcf") (tmp-spcf-101-08-clmp-iek-bus-zero));if
(if (= type-list "lecgv") (tmp-lecgv-101-08-clmp-iek-bus-zero));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-start-101-08-clmp-iek-bus-zero

( / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-900-dscr)

(if (= nil str-1) 
	(setq str-1 (nth 0 list-00));setq
	(setq str-1 (nth (atoi (get_tile "txt-00")) list-00));setq
);if

(cond
	((= str-1 "Шина нулевая с DIN-изолятором")
		(read-file-for-dialog-box-01 "101-08-clmp-iek-bus-zero-din-isol-01.txt" 5)
	);=

	((= str-1 "Шина нулевая в корпусе (кросс-модуль)")
		(read-file-for-dialog-box-01 "101-08-clmp-iek-bus-zero-din-cross-module.txt" 5)
	);=
);cond

(divide-text-into-parts list-900-dscr 120)

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
			list-04 list-04-read-file
			list-99 list-05-read-file
			list-1001 list-900-dscr
);setq

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-99" list-99)
(list-filling "txt-1001" list-1001)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-08-clmp-iek-bus-zero

( / cntr-1 str-00 str-01 str-02 str-03 str-99 tmp-str-spcf)

(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
		str-01 (nth (atoi (get_tile "txt-01")) list-01)
		str-02 (nth (atoi (get_tile "txt-02")) list-02)
		str-03 (nth (atoi (get_tile "txt-03")) list-03)
		str-99 (nth (atoi (get_tile "txt-99")) list-99)
      cntr-1 0 
);setq
  
(if (/= list-901 nil)
	(setq list-901 (reverse list-901)
			list-902 (reverse list-902)
	);setq
);if

(setq tmp-str-spcf (list (cons 0 str-00) (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99))
  		list-902 (vl-list*  tmp-str-spcf list-902)  		
  		list-901 (vl-list* (strcat str-01 "  " str-03 " мм2") list-901)
);setq

(setq list-901 (reverse list-901)
		list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-08-clmp-iek-bus-zero

( / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-04 str-tmp str-txt str-txt-01)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-00 (cdr (assoc 0 str-tmp))
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))	
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-00 "Шина нулевая с DIN-изолятором")
		(setq str-701 (strcat "Шина нулевая, " str-01 ", кол. проводников " str-03 ", монтаж на DIN-рейку, артикул " str-02)
					str-702 nil
		);setq
	);if =


	;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-00 "Шина нулевая в корпусе (кросс-модуль)")
		(setq str-701 (strcat "Шина нулевая, " str-01 ", кол. проводников " str-03 ", кросс-модуль, монтаж на DIN-рейку, артикул " str-02)
					str-702 nil
		);setq
	);if=
 
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "*1*");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-08-clmp-iek-bus-zero

( / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
			str-00 (cdr (assoc 0 str-tmp))
			str-01 (cdr (assoc 1 str-tmp))
			str-02 (cdr (assoc 2 str-tmp))
			str-03 (cdr (assoc 3 str-tmp))
			str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
	
			str-701 "Шина нулевая"		
			
			str-702 (list (cons 1 (strcat "кол. проводников " str-03))
							  (cons 2 "монтаж на DIN-рейку"))
							  											
			str-manufact "ИЭК, г. Москва"	
						
			str-order (list (cons 1 (strcat str-01 ", артикул " str-02)) 
								 (cons 2 ",") 
								 (cons 3 nil));list
				
			str-unit "шт."
			
			str-crtf nil
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ ОВШ               //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-08-clmp-iek-bus-zero

( / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-00 (cdr (assoc 0 str-tmp))
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;;;/////////
	(setq str-701 (strcat "Шина нулевая, " str-01 ", кол. проводников " str-03 ", монтаж на DIN-рейку, артикул " str-02)
			str-702 nil
			str-703 nil
	);setq

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
		
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
